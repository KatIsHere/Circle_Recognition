#pragma OPENCL EXTENSION cl_intel_printf : enable
#define POWER 6


// POLINOME POWER = 5  ----- >  POLINOME = 6 (because 6 coefs)
__kernel void build_polinome(__global const float* xSet, __global const float* fSet, __global float* C, 
								__global float* A, __global float* B, __global int* Y,
								const int setSize, 
								__global float* T){ 
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
	// decomposing LUP
	int imax;
	float maxA, absA;
	Y[0] = 0; Y[1] = 1; Y[2] = 2; Y[3] = 3; Y[4] = 4; Y[5] = 5; Y[6] = 6;


	// I = 0
	imax = 0;
	maxA = 0.;

	for (k = 0; k < POWER; k++) {
		absA = fabs(A[k * POWER]);
		if (absA > maxA) {
			maxA = absA;
			imax = k;
		}
	}

	if (imax != 0) {
		//pivoting P
		j = Y[0];
		Y[0] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A
		for (j = 0; j < POWER; ++j) {
			T[j] = A[j];
			A[j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}
	}

	for (j = 1; j < POWER; j++) {
		A[j * POWER] = A[j * POWER] / A[0];

		for (k = 1; k < POWER; k++)
			A[j * POWER + k] = A[j * POWER + k] - A[j*POWER] * A[ k];
	}


	// I = 1
	maxA = 0.;
	imax = 1;

	for (k = 1; k < POWER; k++) {
		absA = fabs(A[k * POWER + 1]);
		if (absA > maxA) {
			maxA = absA;
			imax = k;
		}
	}

	if (imax != 1) {
		//pivoting P
		j = Y[1];
		Y[1] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A

		for (j = 0; j < POWER; ++j) {
			T[j] = A[POWER + j];
			A[POWER + j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}
	}

	for (j = 2; j < POWER; j++) {
		A[j * POWER + 1] = A[j * POWER + 1] / A[POWER + 1];

		for (k = 2; k < POWER; k++)
			A[j * POWER + k] = A[j * POWER + k] - A[j*POWER + 1] * A[POWER + k];
	}


	// I = 2
	
	maxA = 0.;
	imax = 2;

	for (k = 2; k < POWER; k++) {
		absA = fabs(A[k * POWER + 2]);
		if (absA > maxA) {
			maxA = absA;
			imax = k;
		}
	}

	if (imax != 2) {
		//pivoting P
		j = Y[2];
		Y[2] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A

		for (j = 0; j < POWER; ++j) {
			T[j] = A[2*POWER + j];
			A[2*POWER + j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}

	}

	for (j = 3; j < POWER; j++) {
		A[j * POWER + 2] = A[j * POWER + 2] / A[2 * POWER + 2];

		for (k = 3; k < POWER; k++)
			A[j * POWER + k] = A[j * POWER + k] - A[j*POWER + 2] * A[2*POWER + k];
	}
	

	// I = 3
	maxA = 0.;
	imax = 3;

	for (k = 3; k < POWER; k++) {
		absA = fabs(A[k * POWER + 3]);
		if (absA > maxA) {
			maxA = absA;
			imax = k;
		}
	}

	if (imax != 3) {
		//pivoting P
		j = Y[3];
		Y[3] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A

		for (j = 0; j < POWER; ++j) {
			T[j] = A[3*POWER + j];
			A[3*POWER + j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}

	}

	for (j = 4; j < POWER; j++) {
		A[j * POWER + 3] = A[j * POWER + 3] / A[3 * POWER + 3];

		for (k = 4; k < POWER; k++)
			A[j * POWER + k] = A[j * POWER + k] - A[j*POWER + 3] * A[3*POWER + k];
	}
	

	// I = 4
	maxA = 0.;
	imax = 4;

	for (k = 4; k < POWER; k++) {
		absA = fabs(A[k * POWER + 4]);
		if (absA > maxA) {
			maxA = absA;
			imax = k;
		}
	}

	if (imax != 4) {
		//pivoting P
		j = Y[4];
		Y[4] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A

		for (j = 0; j < POWER; ++j) {
			T[j] = A[4*POWER + j];
			A[4*POWER + j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}
	}

	A[5 * POWER + 4] /=  A[4 * POWER + 4];
	A[5 * POWER + 5] -= A[5*POWER + 4] * A[4*POWER + 5];
	

	// I = 5
	maxA = 0.;
	imax = 5;

	absA = fabs(A[5 * POWER + 5]);
	if (absA > maxA) {
		maxA = absA;
		imax = 5;
	}

	if (imax != 5) {
		//pivoting P
		j = Y[5];
		Y[5] = Y[imax];
		Y[imax] = j;

		//pivoting rows of A

		for (j = 0; j < POWER; ++j) {
			T[j] = A[i*POWER + j];
			A[5*POWER + j] = A[imax*POWER + j];
			A[imax*POWER + j] = T[j];
		}
	}
	

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



// S size: power*power
// A size: power*power
// B size: power
// K size: power
__kernel void build_polinome_square_root(__global const float* xSet, __global const float* fSet, __global float* C,
				__global float* A, __global float* B, __global int* K,
				const int setSize,
				__global float* S,
				const int power) {
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float suma;

	const int id = get_global_id(0);

	for (i = 0; i < power; ++i) {
		for (j = 0; j < power; ++j) {
			suma = 0.;
			for (k = 0; k < setSize; ++k) {
				suma += pown(xSet[k], i + j);
			}
			A[i * power + j] = normalizing * suma;
		}
		suma = 0.;
		for (j = 0; j < setSize; ++j) {
			suma += pown(xSet[j], i) * fSet[id * setSize + j];
		}
		B[i] = suma * normalizing;
	}


	// LINEAR EQUATIONS SOLVE (Square root method)
	// Step 1
	S[0] = sqrt(A[0]);
	for (j = 1; j < power; ++j)
		S[j] = A[j] / S[0];
	for(i = 1; i < power; ++i){
		suma = A[i * power + i];
		for (k = 0; k < i - 1; ++k)
			suma -= S[k*power + i] * S[k*power + i];
		S[i*power + i] = sqrt(suma);
		for(j = i + 1; j < power; ++j){ 
			suma = A[i*power + j];
			for(k = 0; k < i - 1; ++k){ 
				suma -= S[k*power + i] * S[k*power + j];
			}
			S[i*power + j] = suma / S[i*power + i];
			printf("S[%d] = %f \t", id*power + j, S[id*power + j]);
		}
	}

	// Step 2
	K[0] = B[0] / S[0];
	for(i = 1; i < power; ++i){ 
		suma = B[i];
		for (j = 0; j < i - 1; ++j)
			suma -= K[j] * S[j*power + i];
		K[i] = suma / S[i*power + i];

		printf("K[%d] = %f \t", i, K[i]);
	}

	// Step 3 - solution
	C[id*power + power - 1] = K[power - 1] / S[power*power - 1];
	for(i = power - 2; i >= 0; --i){ 
		suma = K[i];
		for (k = i + 1; k < power; ++k)
			suma -= S[i*power + k] * C[id*power + k];
		C[id*power + i] = suma / S[i*power + i];
		printf("C[%d] = %f \t", id*power + i, C[id*power + i]);
	}
}




__kernel void build_polinome_UNOPTIMIZED(__global const float* xSet, __global const float* fSet, __global float* C,
					__global float* A, __global float* B, __global int* Y,
					const int setSize,
					__global float* T,
					const int power) {
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float suma;

	const int id = get_global_id(0);

	for (i = 0; i < power; ++i) {
		for (j = 0; j < power; ++j) {
			suma = 0.;
			for (k = 0; k < setSize; ++k) {
				suma += pown(xSet[k], i + j);
			}

			A[i * power + j] = normalizing * suma;
		}
		suma = 0.;
		for (j = 0; j < setSize; ++j) {
			suma += pown(xSet[j], i) * fSet[id * setSize + j];
		}
		B[i] = suma * normalizing;
	}


	// LINEAR EQUATIONS SOLVE
	// LUP decompose
	int imax;
	float maxA, absA;

	for (i = 0; i <= power; i++)
		Y[i] = i;					//Unit permutation matrix

	for (i = 0; i < power; i++) {
		maxA = 0.;
		imax = i;

		for (k = i; k < power; k++)
			if ((absA = fabs(A[k * power + i])) > maxA) {
				maxA = absA;
				imax = k;
			}

		if (imax != i) {
			//pivoting P
			j = Y[i];
			Y[i] = Y[imax];
			Y[imax] = j;

			//pivoting rows of A
			for (j = 0; j < power; ++j) {
				T[j] = A[i*power + j];
				A[i*power + j] = A[imax*power + j];
				A[imax*power + j] = T[j];
			}
		}

		for (j = i + 1; j < power; j++) {
			A[j * power + i] /= A[i * power + i];

			for (k = i + 1; k < power; k++)
				A[j * power + k] -= A[j*power + i] * A[i*power + k];
		}
	}

	// LUP solve
	for (i = 0; i < power; i++) {
		C[id * power + i] = B[Y[i]];

		for (int k = 0; k < i; k++) {
			C[id * power + i] -= A[i * power + k] * C[id * power + k];
			printf("A[%d][%d] = %f\t", i, k, A[i*power + k]);
		}
		printf("\n");
	}

	for (i = power - 1; i >= 0; i--) {
		for (k = i + 1; k < power; k++)
			C[id * power + i] -= A[i * power + k] * C[id * power + k];

		C[id * power + i] /= A[i * power + i];
		printf("C[%d] = %f\t", id * power + i, C[id*power + i]);
	}
	printf("\n");
}



// Newton method
// sizes:
// polinome_coefs: [hight*width]
// start: [hight]
// firstDerivative x: [width - 1]
// secondDerivative: [width - 2]
// extrems: [hight*(width - 1)]
// values: [hight*(width - 1)]
__kernel Extremums_Newton(__global float* polinome_coefs, const int width, 
					__global float *start, const float finish, 
					__global float* firstDerivative, __global float* secondDerivative, 
					__global float* extrems, __global float* values,
					const float Eps, const float h){ 
	const int id_dimi = get_global_id(0);
	const int id_dimj = get_global_id(1);
	float polinome = 0, firstDer = 0, x0 = start[id_dimi];
	int i, j, k;
	// filling out first derivative coefs
	for (i = 0; i < width - 2; ++i) {
		firstDeivative[i] = (i + 1)*polinome_coefs[id_dimi*width + i + 1];
		secondDerivative[i] = (i + 1)*firstDeivative[i + 1];
		polinome += firstDeivative[i] * pown(x0, i);
	}
	firstDeivative[width - 2] = (width - 1)*polinome_coefs[id_dimi*width + width - 1];
	polinome += firstDeivative[width - 2] * pown(x0, width - 2);

	// calculating  first meaning of the polinome
	float value, div;

	for (j = 0; j < width - 1; ++j) {
		polinome += firstDeivative[j] * pown(x0, j);
		firstDer += secondDerivative[j] * pown(x0, j);
	}
	polinome += polinome_coefs[id_dimi*width + width - 1] * pown(x0, width - 1);

	value = fabs(polinome);

	while (value >= Eps) {
		div = polinome / firstDer;
		x0 = x0 - div;
		for (j = 0; j < width - 1; ++j) {
			polinome += firstDeivative[j] * pown(x0, j);
			firstDer += secondDerivative[j] * pown(x0, j);
		}
		polinome += polinome_coefs[id_dimi*width + width - 1] * pown(x0, width - 1);
		value = fabs(polinome);
	}

	polinome = 0;
	for (j = 0; j < width; ++j)
		polinome += polinome_coefs[id_dimi*width + j] * pown(x0, j);
		
	extrems[id_dimi*(width - 1) + id_dimj] = x0;
	values[id_dimi*(width - 1) + id_dimj] = polinome;
	start[id_dimi] = x0 + h;
}


// sizes:
// distances: [hight*(width - 1)]
// angles: [hight*(width + 1) / 2]
// center_ x: [hight]
// center_y: [hight]
// extrems_x: [hight*(power - 1)]
//  extrems_y: [hight*(power - 1)]
__kernel features(__global float* extrems_x, __global float* extrems_y, const int width, 
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
	const int anglesNumb = int(width + 1) / 2;
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