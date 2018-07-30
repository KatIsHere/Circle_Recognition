

__kernel void build_polinome(__global const float* xSet, __global const float* fSet, __global float* C, 
								const int power, 
								__global float* A, __global float* B, __global int* Y,
								const int setSize, 
								__global float* T ){ 
	int i, j, k;
	float normalizing = 1 / (setSize + 1);					// 1/(b-a)
	
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

	T[0] = sqrt(A[0]);
	float S;
	for (int i = 0; i < power; ++i) {
		for (int j = 0; j < power; ++j) {
			if (i == 0 && j > i) {
				T[i * power + j] = A[i * power + j] / T[i * power + i];
			}
			else if (i != 0) {
				if (i == j) {
					S = 0;
					for (int k = 0; k < i - 1; ++k) {
						S += T[k * power + i] * T[k * power + i];
					}
					T[i * power + i] = sqrt(A[i * power + i] - S);
				}
				else if (i < j) {
					S = 0;
					for (int k = 0; k < i - 1; ++k) {
						S += T[k * power + i] * T[k * power + i];
					}
					T[i * power + j] = (A[i * power + j] - S) / T[i * power + i];
				}
				else if (i > j) {
					T[i * power + j] = 0;
				}
			}
		}
	}

	Y[0] = B[0] / T[0];
	for (int i = 1; i < power; ++i) {
		S = 0;
		for (int k = 0; k < i - 1; ++k) {
			S += T[k * power + i] * Y[k];
		}
		Y[i] = (B[i] - S) / T[i * power + i];
	}

	C[id * power + power - 1] = Y[power - 1] / T[power * power - 1];
	for (int j = power - 2; j >= 0; --j) {
		S = 0;
		for (int k = j + 1; k < power; ++k) {
			S += T[j * power + k] * C[id * power + k];
		}
		C[id * power + j] = (Y[j] - S) / T[j * power + j];
	}

	// Another method for solving linear equasions
	/*
	//// LINEAR EQUATIONS SOLVE
	//int imax;
	//float maxA, absA;

	//for (i = 0; i <= power; i++)
	//	P[i] = i; //Unit permutation matrix, P[N] initialized with N

	//for (i = 0; i < power; i++) {
	//	maxA = 0.;
	//	imax = i;

	//	for (k = i; k < power; k++)
	//		if ((absA = fabs(A[k * power + i])) > maxA) {			
	//			maxA = absA;
	//			imax = k;
	//		}

	//	if (imax != i) {
	//		//pivoting P
	//		j = P[i];
	//		P[i] = P[imax];
	//		P[imax] = j;

	//		//pivoting rows of A
	//		ptr = &A[i];
	//		A[i] = A[imax];
	//		A[imax] = *ptr;

	//		//counting pivots starting from N (for determinant)
	//		P[power - 1] = P[power - 1] + 1;
	//	}

	//	for (j = i + 1; j < power; j++) {
	//		A[j * power + i] = A[j * power + i] / A[i * power + i];

	//		for (k = i + 1; k < power; k++)
	//			A[j * power + k] = A[j * power + k] - A[j*power + i] * A[i*power + k];
	//	}
	//}

	//for (int i = 0; i < power; i++) {
	//	C[id * power + i] = B[P[i]];

	//	for (int k = 0; k < i; k++)
	//		C[id * power + i] -= A[i * power + k] * C[id * power + k];
	//}

	//for (int i = power - 1; i >= 0; i--) {
	//	for (int k = i + 1; k < power; k++)
	//		C[id * power + i] -= A[i * power + k] * C[id * power + k];							

	//	C[id * power + i] = C[id * power + i] / A[i * power + i];								
	//}
	*/
}
