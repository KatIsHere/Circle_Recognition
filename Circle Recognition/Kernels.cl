// First kernell drafts

// Need to pass A buffer and B buffer and P buffer
__kernel void build_polinome(__global const double* xSet, __global const double* fSet, __global double* C, 
								__global const int power, __global double* A, __global double* B, __global int* P, 
								__global const int setSize){ 
	int i, j, k;
	double normalizing = double(1) / (setSize + 1);					// 1/(b-a)
	
	double sumaA, sumaB;
	int size = setSize * sizeof(double);

	//const int globalRow = get_global_id(0);
	//const int globalCol = get_global_id(1);

	const int id = get_global_id(0);

	for (i = 0; i < power; ++i) {

		for (j = 0; j < power; ++j) {
			sumaA = 0.;
			for (k = 0; k < setSize; ++k) {
				sumaA += pown(xSet[k], i + j);					// 1 KERNEL
			}
			A[i*power + j] = normalizing * sumaA;						// 2 KERNEL
		}
		sumaB = 0.;
		for (j = 0; j < setSize; ++j) {
			sumaB += pown(xSet[j], i)*fSet[id*setSize + j];					// 1 KERNEL
		}
		B[i] = sumaB * normalizing;								// 2 KERNEL
	}
	// LINEAR EQUATIONS SOLVE
	int imax;
	double maxA, *ptr, absA;

	for (i = 0; i <= power; i++)
		P[i] = i; //Unit permutation matrix, P[N] initialized with N

	for (i = 0; i < power; i++) {
		maxA = 0.0;
		imax = i;

		for (k = i; k < power; k++)
			if ((absA = fabs(A[k*power + i])) > maxA) {			// 1 KERNEL
				maxA = absA;
				imax = k;
			}

		if (imax != i) {
			//pivoting P
			j = P[i];
			P[i] = P[imax];
			P[imax] = j;

			//pivoting rows of A
			ptr = A[i];
			A[i] = A[imax];
			A[imax] = ptr;

			//counting pivots starting from N (for determinant)
			P[N]= P[N] + 1;
		}

		for (j = i + 1; j < power; j++) {
			A[j*power + i] = A[j*power + i] / A[i*power + i];

			for (k = i + 1; k < N; k++)
				A[j*power + k] = A[j*power + k] - A[j*power + i] * A[i*power + k];
		}
	}
	delete ptr;

	for (int i = 0; i < power; i++) {
		C[id*power + i] = B[P[i]];

		for (int k = 0; k < i; k++)
			C[id*power + i] -= A[i*power + k] * C[k];							// 3 KERNEL
	}

	for (int i = N - 1; i >= 0; i--) {
		for (int k = i + 1; k < power; k++)
			C[id*power + i] -= A[i*power + k] * C[k];							// 3 KERNEL

		C[id*power + i] = C[id * power + i] / A[i][i];								// 2 KERNEL
	}
}
