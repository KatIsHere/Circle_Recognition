#pragma OPENCL EXTENSION cl_intel_printf : enable

__kernel void build_polinome(__global const float* xSet, __global const float* fSet, __global float* C, 
								const int power, 
								__global float* A, __global float* B, __global int* Y,
								const int setSize, 
								__global float* T){ 
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float sumaA;
	float sumaB;
	int size = setSize * sizeof(float);

	//const int globalRow = get_global_id(0);
	//const int globalCol = get_global_id(1);

	const int id = get_global_id(0);

	for (i = 0; i < power; ++i) {

		for (j = 0; j < power; ++j) {
			sumaA = 0.;
			for (k = 0; k < setSize; ++k) {
				sumaA += pown(xSet[k], i + j);				
			}

			A[i * power + j] = normalizing * sumaA;					
		}
		sumaB = 0.;
		for (j = 0; j < setSize; ++j) {
			sumaB += pown(xSet[j], i) * fSet[id * setSize + j];
		}
		B[i] = sumaB * normalizing;							
	}

	
	// LINEAR EQUATIONS SOLVE
	int imax;
	float maxA, absA;

	for (i = 0; i <= power; i++)
		Y[i] = i;		//Unit permutation matrix, P[N] initialized with N

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

			for (int j = 0; j < power; ++j) {
				T[j] = A[i*power + j];
				A[i*power + j] = A[imax*power + j];
				A[imax*power + j] = T[j];
			}

			//counting pivots starting from N (for determinant)
			Y[power] = Y[power] + 1;
		}

		for (j = i + 1; j < power; j++) {
			A[j * power + i] = A[j * power + i] / A[i * power + i];

			for (k = i + 1; k < power; k++)
				A[j * power + k] = A[j * power + k] - A[j*power + i] * A[i*power + k];
		}
	}

	for (int i = 0; i < power; i++) {
		C[id * power + i] = B[Y[i]];

		for (int k = 0; k < i; k++) { 
			C[id * power + i] -= A[i * power + k] * C[id * power + k]; 
			//printf("A[%d][%d] = %f\t", i, k, A[i*power + k]);

		}
	}

	for (int i = power - 1; i >= 0; i--) {
		for (int k = i + 1; k < power; k++)
			C[id * power + i] -= A[i * power + k] * C[id * power + k];							

		C[id * power + i] = C[id * power + i] / A[i * power + i];	
		// printf("C[%d] = %f\t", id * power + i, C[id*power + i]);
	}
}


//float sum;
//T[0] = sqrt(fabs(A[0]));
//d[0] = A[0] > 0 ? 1 : -1;
//for (int j = 1; j < power; ++j) {
//	T[j] = A[j] / T[0];
//}
//for (int i = 1; i < power; ++i) {
//	for (int j = 0; j < power; ++j) {
//		sum = 0;
//		if (i == j) {
//			for (int l = 0; l < i; ++l) {
//				sum += T[l*power + i] * T[l * power + i] * d[l];
//			}
//			T[i * power + i] = sqrt(fabs(A[i*power + i] - sum));
//			d[i] = ((A[i * power + i] - sum > 0 ? 1 : -1));
//		}
//		else if (i < j) {
//			for (int l = 0; l < i; ++l) {
//				sum += T[l * power + i] * d[l] * T[l * power + j];
//			}
//			T[i*power + j] = (A[i*power + j] - sum) / (T[i * power + i] * d[i]);
//		}
//		else T[i*power + j] = 0;
//	}
//}
//Y[0] = B[0] / T[0];
//for (int i = 1; i < power; ++i) {
//	sum = 0;
//	for (int j = 0; j < i; ++j) {
//		sum += T[j * power + i] * Y[j] * d[j];
//	}
//	Y[i] = (B[i] - sum) / (T[i*power + i] * d[i]);
//}
//C[id*power + power - 1] = Y[power - 1] / T[power*power - 1];
//for (int i = power - 2; i >= 0; --i) {
//	sum = 0;
//	for (int j = i; j < power; ++j) {
//		sum += T[i*power + j] * C[id*power + j];
//	}
//	C[id*power + i] = (Y[i] - sum) / T[i*power + i];
//	printf("sum = %f,  C[%d] = %f \t", sum, id*power + i, C[id*power + i]);
//}
//printf("\n\n");

/*
T[0] = sqrt(A[0]);
float S;
for (int i = 0; i < power; ++i) {
for (int j = 0; j < power; ++j) {
printf("A[%d][%d] = %f ~~~~~~~~~ ", i, j, A[i * power + j]);
if (i == 0 && j > i) {
T[i * power + j] = (float)A[i * power + j] / T[i * power + i];
}
else if (i != 0) {
if (i == j) {
S = 0;
for (int k = 0; k < i - 1; ++k) {
S += (float)T[k * power + i] * T[k * power + i];
}
T[i * power + i] = sqrt(A[i * power + i] - S);
}
else if (i < j) {
S = 0;
for (int k = 0; k < i - 1; ++k) {
S += T[k * power + i] * T[k * power + i];
}
T[i * power + j] = (float)(A[i * power + j] - S) / T[i * power + i];
}
else if (i > j) {
T[i * power + j] = 0;
}

printf("T[%d][%d] = %f \t", i, j, T[i * power + j]);
}
}
}
printf("\t");

Y[0] = B[0] / T[0];
for (int i = 1; i < power; ++i) {
S = 0;
for (int k = 0; k < i - 1; ++k) {
S += T[k * power + i] * Y[k];
}
Y[i] = (B[i] - S) / T[i * power + i];
}

printf("Hello\n");
C[id * power + power - 1] = Y[power - 1] / T[power * power - 1];
printf("C[%d] = %f \t", id * power + power - 1, C[id * power + power - 1]);
for (int j = power - 2; j >= 0; --j) {
S = 0;
for (int k = j + 1; k < power; ++k) {
S += T[j * power + k] * C[id * power + k];
}
C[id * power + j] = (float)(Y[j] - S) / T[j * power + j];
printf("C[%d] = %f \t", id * power + j, C[id * power + j]);
}
printf("\n");*/
