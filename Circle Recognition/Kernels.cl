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



// Newton method
// sizes:
// polinome_coefs: [hight*width]
// start: [hight]
// firstDerivative x: [(width - 1)*(width - 1)]
// secondDerivative: [(width - 2)*(width - 2)]
// extrems: [hight*(width - 1)]
// values: [hight*(width - 1)]
__kernel void Extremums_Newton_v2(__global double* polinome_coefs, const int width, 
					__global float *start, const float finish, 
					__global float* firstDeivative, __global float* secondDerivative,
					__global float* extrems, __global float* values,
					const float Eps, const float h){ 
	const int id = get_global_id(0);
	const int id_dimj = get_global_id(1);
	float polinome = 0, firstDer = 0, x0 = start[id];
	int i, j, k;
	// filling out first derivative coefs
	for (i = 0; i < width - 2; ++i) {
		firstDeivative[id*(width - 1) + i] = (i + 1)*polinome_coefs[id*width + i + 1];
		secondDerivative[id*(width - 2) + i] = (i + 1) * firstDeivative[i + 1];
		polinome += firstDeivative[id*(width - 1) + i] * pown(x0, i);
	}
	firstDeivative[id*(width - 1) + width - 2] = (width - 1)*polinome_coefs[id*width + width - 1];
	polinome += firstDeivative[width - 2] * pown(x0, width - 2);

	// calculating  first meaning of the polinome
	float value, div;

	for (j = 0; j < width - 1; ++j) {
		polinome += firstDeivative[id*(width - 1) + j] * pown(x0, j);
		firstDer += secondDerivative[id*(width - 2) + j] * pown(x0, j);
	}
	polinome += polinome_coefs[id*width + width - 1] * pown(x0, width - 1);

	value = fabs(polinome);

	while (value >= Eps) {
		div = polinome / firstDer;
		x0 = x0 - div;
		for (j = 0; j < width - 1; ++j) {
			polinome += firstDeivative[id*(width - 1) + j] * pown(x0, j);
			firstDer += secondDerivative[id*(width - 2) + j] * pown(x0, j);
		}
		polinome += polinome_coefs[id*width + width - 1] * pown(x0, width - 1);
		value = fabs(polinome);
	}

	polinome = 0;
	for (j = 0; j < width; ++j)
		polinome += polinome_coefs[id*width + j] * pown(x0, j);
		
	extrems[id*(width - 1) + id_dimj] = x0;
	values[id*(width - 1) + id_dimj] = polinome;
	start[id] = x0 + h;
}


// Newton method
// sizes:
// polinome_coefs: [hight*width]
// firstDerivative x: [(width - 1)*(width - 1)]
// secondDerivative: [(width - 2)*(width - 2)]
// extrems: [hight*(width - 1)]
// values: [hight*(width - 1)]
__kernel void Extremums_Newton(__global double* polinome_coefs, const int width,
	const float start, const float finish,
	__global float* firstDeivative, __global float* secondDerivative,
	__global float* extrems, __global float* values,
	const float Eps, const float h) {

	const int id = get_global_id(0);
	double polinome = 0, firstDer = 0;
	double meaning_x0;
	double x0 = start + 0.1;
	int i, j, k; 

	// filling out first and second derivative coefs
	for (i = 0; i < width - 2; ++i) {
		firstDeivative[id*(width - 1) + i] = (i + 1)*polinome_coefs[id*width + i + 1];
		secondDerivative[id*(width - 2) + i] = (i + 1) * firstDeivative[id*(width - 1) + i + 1];
		polinome += firstDeivative[id*(width - 1) + i] * pown(x0, i);
		firstDer += secondDerivative[id*(width - 2) + i] * pown(x0, i);
	}
	firstDeivative[id*(width - 1) + width - 2] = (width - 1)*polinome_coefs[id*width + width - 1];
	polinome += firstDeivative[id*(width - 1) + width - 2] * pown(x0, width - 2);
	i = 0;
	double value, div;
	bool flag;
	while (i < width - 1) {
		//// calculating  first meaning of the polinome
		//polinome = 0.;
		//for (j = 0; j < width - 2; ++j) {
		//	polinome += firstDeivative[id*(width - 1) + j] * pown(x0, j);
		//	firstDer += secondDerivative[id*(width - 2) + j] * pown(x0, j);
		//}
		//polinome += firstDeivative[id*(width - 1) + width - 2] * pown(x0, width - 2);
		////polinome += polinome_coefs[id*width + width - 1] * pown(x0, width - 1);

		value = fabs(polinome);

		while (value >= 0.1) {
			div = (polinome) / firstDer;
			x0 = x0 - div;
			//printf("x0: %f ---> ", x0);
			//printf("first der: %f\t", firstDer);
			polinome = 0.; firstDer = 0;
			for (j = 0; j < width - 2; ++j) {
				polinome += firstDeivative[id*(width - 1) + j] * pown(x0, j);
				firstDer += secondDerivative[id*(width - 2) + j] * pown(x0, j);
			}
			polinome += firstDeivative[id*(width - 1) + width - 2] * pown(x0, width - 2);

			//printf("value:%f\t", polinome);
			value = fabs(polinome);
		}

		for(j = 0; j < i; ++j){ 
			flag = ((extrems[id*(width - 1) + j] - x0 < 0.1) && (x0 - extrems[id*(width - 1) + j] < 0.1));
		}

		if(!flag){ 
			extrems[id*(width - 1) + i] = x0;
			//printf("x0 = %f\t", x0);
			meaning_x0 = 0;
			
			for (j = 0; j < width; ++j)
				meaning_x0 += polinome_coefs[id*width + j] * pown(x0, j);
			
			values[id*(width - 1) + i] = meaning_x0;
			i++;
		}
		x0 = x0 + 2*h;
	}
	//printf("i = %d\t", id);
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



// POLINOME POWER = 5  ----- >  POLINOME = 6 (because 6 coefs)
__kernel void build_polinome(__global const float* xSet, __global const float* fSet, __global float* C,
	__global float* A, __global float* B, __global int* Y,
	const int setSize,
	__global float* T) {
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float suma;
	const int id = get_global_id(0);

	// CREATING A SYSTEM OF LINEAR EQUATIONS
	// I = 0
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], j);
		A[j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += fSet[id * setSize + j];
	B[0] = suma * normalizing;

	// I = 1
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], 1 + j);
		A[POWER + j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += xSet[j] * fSet[id * setSize + j];
	B[1] = suma * normalizing;

	// I = 2
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], 2 + j);
		A[2 * POWER + j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += pown(xSet[j], 2) * fSet[id * setSize + j];
	B[2] = suma * normalizing;

	// I  = 3
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], 3 + j);
		A[3 * POWER + j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += pown(xSet[j], 3) * fSet[id * setSize + j];
	B[3] = suma * normalizing;

	// i = 4
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], 4 + j);
		A[4 * POWER + j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += pown(xSet[j], 4) * fSet[id * setSize + j];
	B[4] = suma * normalizing;

	// I = 5
	for (j = 0; j < POWER; ++j) {
		suma = 0.;
		for (k = 0; k < setSize; ++k)
			suma += pown(xSet[k], 5 + j);
		A[5 * POWER + j] = normalizing * suma;
	}
	suma = 0.;
	for (j = 0; j < setSize; ++j)
		suma += pown(xSet[j], 5) * fSet[id * setSize + j];
	B[5] = suma * normalizing;


	// LINEAR EQUATIONS SOLVE
	// solving LUPD
	for (i = 0; i < POWER; i++) {
		C[id * POWER + i] = B[Y[i]];

		for (int k = 0; k < i; k++) {
			C[id * POWER + i] -= A[i * POWER + k] * C[id * POWER + k];
			//printf("A[%d][%d] = %f\t", i, k, A[i*power + k]);
		}
	}

	// I = 0
	for (k = 0; k < POWER; k++)
		C[id * POWER] -= A[k] * C[id * POWER + k];
	C[id * POWER] = C[id * POWER] / A[0];
	printf("C[%d] = %f\t", id * POWER, C[id*POWER]);

	// I = 1
	for (k = 1; k < POWER; k++)
		C[id * POWER + 1] -= A[POWER + k] * C[id * POWER + k];
	C[id * POWER + 1] = C[id * POWER + 1] / A[POWER + i];
	printf("C[%d] = %f\t", id * POWER + 1, C[id*POWER + 1]);

	// I = 2
	for (k = 2; k < POWER; k++)
		C[id * POWER + 2] -= A[2 * POWER + k] * C[id * POWER + k];
	C[id * POWER + 2] = C[id * POWER + 2] / A[i * POWER + 2];
	printf("C[%d] = %f\t", id * POWER + 2, C[id*POWER + 2]);

	// I = 3
	for (k = 3; k < POWER; k++)
		C[id * POWER + 3] -= A[3 * POWER + k] * C[id * POWER + k];
	C[id * POWER + 3] = C[id * POWER + 3] / A[3 * POWER + 3];
	printf("C[%d] = %f\t", id * POWER + 3, C[id*POWER + 3]);

	// I = 4
	for (k = 4; k < POWER; k++)
		C[id * POWER + 4] -= A[4 * POWER + k] * C[id * POWER + k];
	C[id * POWER + 4] = C[id * POWER + 4] / A[4 * POWER + 4];
	printf("C[%d] = %f\t", id * POWER + 4, C[id*POWER + 4]);

	// I = 5
	C[id * POWER + 5] -= A[5 * POWER + 5] * C[id * POWER + 5];
	C[id * POWER + 5] = C[id * POWER + 5] / A[i * POWER + 5];
	printf("C[%d] = %f\t", id * POWER + 5, C[id*POWER + 5]);

	printf("\n");
}
