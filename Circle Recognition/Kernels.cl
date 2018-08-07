#pragma OPENCL EXTENSION cl_intel_printf : enable
#define POWER 6

#ifdef cl_khr_fp64
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#else
#error "Double precision floating point not supported by OpenCL implementation."
#endif
// MAIN KERNEL
__kernel void build_polinome_double(__global const float* xSet, __global const float* fSet, __global double* C,
			__global double* A, __global double* B, __global int* Y,
			const int setSize, const int power) {
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);
	float suma;
	const int id = get_global_id(0);

	for (i = 0; i < power; ++i) {
		suma = 0.;
		for (j = 0; j < setSize; ++j) {
			suma += pown(xSet[j], i) * fSet[id * setSize + j];
		}
		B[id*power + i] = suma * normalizing;
	}
	// LINEAR EQUATIONS SOLVE
	// LUP solve
	for (i = 0; i < power; i++) {
		C[id * power + i] = B[id*power + Y[i]];

		for (int k = 0; k < i; k++) {
			C[id * power + i] -= A[i * power + k] * C[id * power + k];
		}
	}

	for (i = power - 1; i >= 0; i--) {
		for (k = i + 1; k < power; k++)
			C[id * power + i] -= A[i * power + k] * C[id * power + k];
		C[id * power + i] /= A[i * power + i];
	}
}


// sizes:
// distances: [hight*(width - 1)]
// angles: [hight*(width + 1) / 2]
// center_ x: [hight]
// center_y: [hight]
// extrems_x: [hight*(power - 1)]
//  extrems_y: [hight*(power - 1)]
__kernel void features(__global float* extrems_x, __global float* extrems_y, const int width, 
					__global float* distances, __global float* angles, 
					__global float* center_x, __global float* center_y){ 
	const int id = get_global_id(0);
	// distancesNumb = width - 1;
	// anglesNumb = int(width + 1) / 2;
	int i, j, k;
	// distance calculation (amplitude)
	for(i = 0; i < width - 1; ++i){ 
		distances[id*width + i] = sqrt((center_x[id*width + i + 1] - center_x[id*width + i])*(center_x[id*width + i + 1] - center_x[id*width + i]) +
			(center_y[id*width + i + 1] - center_y[id*width + i])*(center_y[id*width + i + 1] - center_y[id*width + i]));
	}
	const int anglesNumb = (int)(width + 1) / 2;
	float c;
	// cos of angles between amplitudes
	for(i = 0; i < anglesNumb; ++i){ 
		c = sqrt((center_x[id*width + i + 2] - center_x[id*width + i])*(center_x[id*width + i + 2] - center_x[id*width + i]) +
			(center_y[id*width + i + 2] - center_y[id*width + i])*(center_y[id*width + i + 2] - center_y[id*width + i]));
		
		angles[id*width + i] = (distances[i] * distances[i] + distances[i + 1] * distances[i + 1] - c*c ) / (2 * distances[i] * distances[i + 1]);
	}

	// centers
	center_y[id] = extrems_y[id*width + width / 2] + extrems_y[id*width + width / 2 + 1];
	center_x[id] = (extrems_x[id*width + width / 2] + extrems_x[id*width + width / 2 + 1]) / 2;
}



// sizes:
// coefs: [h*power]
// roots: [h*(power - 1)]
// A: [h*(n)*i], for i in range(n, 0)
// B: [h*(n)*i], for i in range(n, 0)
// first_der: [h*(power - 1)]
// xec_der: [h*(power - 2)]
// roots_coune: [h*power]
__kernel void PolinomeRealRoots(__global float* coefs, __global float* rootsArray, const int power,
	__global float* A, __global float* B, __global int* rootsCount){ 
	//__global float* first_der, __global float* sec_der){ 

	const int id = get_global_id(0);
	const int AB_size = power * (power + 1) / 2;

	// Normalize the polinome
	for (int i = 0; i < power; i++)
		A[id*power*AB_size + power*i + i] = coefs[id*power + i] / coefs[id*power + power - 1];


	// derivative:
	for (int i1 = power - 1, i = power - 2; i > 0; i1 = i, i--)
	{
		for (int j1 = i, j = i - 1; j >= 0; j1 = j, j--)
		{
			A[id*power*AB_size + i*power + j] = A[id*power*AB_size + i1*power + j1] * j1 / i1;
		}
	}

	rootsCount[id*power + 1] = 1;
	B[id*power*AB_size + 1] = -A[id*power*AB_size + 1];

	int signLeft = 0, signRight = 0;
	float edgeLeft = 0., edgeRight = 0.;
	float edgeNegativ = 0., edgePositiv = 0.;
	float major = 0;
	float s = 0.;
	double rb;
	float suma;
	float x;

	for(int iteration = 2; iteration < power; ++iteration){ 
		for(int i = 0; i <iteration; ++i){ 
			s = fabs(A[id*power*AB_size + iteration * power + i]);
			if (s > major)
				major = s;
		}
		major += 1.;
		rootsCount[id*power + iteration] = 0;

		for (int i = 0; i <= rootsCount[id*power + iteration - 1]; i++){
			if (i == 0) 
				edgeLeft = -major;
			
			rb = 1.;
			for (int j = power - 1; j >= 0; --j) {
				rb = mad((float)rb, (float)edgeLeft, (float)coefs[id*power + j]);
			}

			if (rb <= 0.0001){ 
				B[id*power*AB_size + iteration * power + rootsCount[id*power + iteration]] = edgeLeft;
				rootsCount[id*power + iteration]++;
				continue;
			}

			if (rb > 0.)
				signLeft = 1;
			else
				signLeft = -1;

			if (i == rootsCount[id*power + iteration - 1])
				edgeRight = major;
			else 
				edgeRight = B[id*power*AB_size + (iteration - 1)*power + i];

			rb = 1.;
			for (int j = power - 1; j >= 0; --j) {
				rb = mad((float)rb, (float)edgeLeft, (float)coefs[id*power + j]);
			}

			if (rb <= 0.0001) {
				B[id*power*AB_size + iteration * power + rootsCount[id*power + iteration]] = edgeRight;
				rootsCount[id*power + iteration]++;
				continue;
			}

			if (rb > 0.)
				signRight = 1;
			else
				signRight = -1;

			if (signLeft == signRight)		// monotone function, no root here
				continue;

			// edges of the search
			if (signLeft<0) {
				edgeNegativ = edgeLeft; edgePositiv = edgeRight;
			}
			else {
				edgeNegativ = edgeRight; edgePositiv = edgeLeft;
			}

			x = 0.5*(edgeNegativ + edgePositiv);
			while(x != edgeNegativ && x != edgePositiv){ 
				rb = 1.;
				for (int j = power - 1; j >= 0; --j) {
					rb = mad((float)rb, (float)edgeLeft, (float)coefs[id*power + j]);
				}
				if (rb < 0)
					edgeNegativ = x;
				else
					edgePositiv = x;
				x = 0.5*(edgeNegativ + edgePositiv);
			}

			B[id*power*AB_size + iteration * power + rootsCount[id*power + iteration]] = x;
			rootsCount[id*power + iteration]++;
		}

		signLeft = 0, signRight = 0;
		edgeLeft = 0., edgeRight = 0.;
		edgeNegativ = 0., edgePositiv = 0.;
		major = 0;
		s = 0.;
	}

	// resoults
	for(int i = 0; i < rootsCount[id*power + power - 1]; ++i){ 
		rootsArray[id * (power - 1) + i] = B[id*power*AB_size + (power - 1) * power + i];
	}
}



// coefs: [h*power]
// roots: [h * (power - 1)]
// rootsCount[h * (power - 1)]
// TODO: fix global sizes
__kernel void PolinomeFindRoots(__global float* coefs, const int coefs_numb,
	const float start, const float h, __global float* roots, __global int* rootsCount){ 

	const int id_i = get_global_id(0);
	const int id_j = get_global_id(1);

	float negative_edge = start + id_j*h, positive_edge = h + start + id_j*h;
	float Left, Right;
	float root;
	int signLeft, signRight;
	// counting root
	root = 0;
	for(int i = 0; i < coefs_numb; ++i){ 
		root += pown(negative_edge, i) * coefs[coefs_numb*id_i - id_i + i];
		
	}
	// if root found
	int rcount = 0;
	if(fabs(root) < 0.01){ 
		rcount = rootsCount[id_i];
		roots[coefs_numb*id_i - id_i + rcount] = root;
		rootsCount[id_i]++;
		return;
	}
	signLeft = (root > 0) ? 1 : -1;

	root = 0;
	for (int i = 0; i < coefs_numb; ++i) {
		root += pown(positive_edge, i) * coefs[coefs_numb*id_i + i];
	}
	// if root found
	if (fabs(root) < 0.01) {
		rcount = rootsCount[id_i];
		roots[coefs_numb*id_i - id_i + rcount] = root;
		rootsCount[id_i]++;
		return;
	}
	signRight = (root > 0) ? 1 : -1;

	// if no sign change ---> no root found
	if (signLeft == signRight)
		return;
	if(signLeft == -1){
		Left = negative_edge; Right = positive_edge;
	}
	else {
		Left = positive_edge; Right = negative_edge;
	}
	// else there is a root betwen negative and positive edges
	root = (Right - Left) * 0.5;
	double resoult = 0;
	for (int i = 0; i < coefs_numb; ++i) {
		resoult += pown(root, i) * coefs[coefs_numb*id_i + i];
	}
	while(fabs(resoult) >= 1){ 
		root = (Right - Left) * 0.5;
		Left = (root < 0) ? root : Left;
		Right = (root > 0) ? root : Right;
		resoult = 0;
		for (int i = 0; i < coefs_numb; ++i) {
			resoult += pown(root, i) * coefs[coefs_numb*id_i + i];
		}
	}
	rcount = rootsCount[id_i];
	roots[coefs_numb*id_i - id_i + rcount] = root;
	rootsCount[id_i]++;

}
