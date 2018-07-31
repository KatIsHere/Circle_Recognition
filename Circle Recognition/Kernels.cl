#pragma OPENCL EXTENSION cl_intel_printf : enable
#define POWER 6


// POLINOME POWER = 5  ----- >  POLINOME = 6 (because 6 coefs)
__kernel void build_polinome(__global const float* xSet, __global const float* fSet, __global float* C, 
								__global float* A, __global float* B, __global int* Y,
								const int setSize, 
								__global float* T){ 
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float sumaA;
	float sumaB;
	const int id = get_global_id(0);

	// CREATING A SYSTEM OF LINEAR EQUATIONS
	// I = 0
	for (j = 0; j < POWER; ++j) {
			sumaA = 0.;
			for (k = 0; k < setSize; ++k) 
				sumaA += pown(xSet[k], j);				
			A[j] = normalizing * sumaA;					
		}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j) 
		sumaB += fSet[id * setSize + j];
	B[0] = sumaB * normalizing;							

	// I = 1
	for (j = 0; j < POWER; ++j) {
		sumaA = 0.;
		for (k = 0; k < setSize; ++k) 
			sumaA += pown(xSet[k], 1 + j);
		A[POWER + j] = normalizing * sumaA;
	}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j)
		sumaB += xSet[j] * fSet[id * setSize + j];
	B[1] = sumaB * normalizing;

	// I = 2
	for (j = 0; j < POWER; ++j) {
		sumaA = 0.;
		for (k = 0; k < setSize; ++k)
			sumaA += pown(xSet[k], 2 + j);
		A[2 * POWER + j] = normalizing * sumaA;
	}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j)
		sumaB += pown(xSet[j], 2) * fSet[id * setSize + j];
	B[2] = sumaB * normalizing;

	// I  = 3
	for (j = 0; j < POWER; ++j) {
		sumaA = 0.;
		for (k = 0; k < setSize; ++k)
			sumaA += pown(xSet[k], 3 + j);
		A[3 * POWER + j] = normalizing * sumaA;
	}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j)
		sumaB += pown(xSet[j], 3) * fSet[id * setSize + j];
	B[3] = sumaB * normalizing;

	// i = 4
	for (j = 0; j < POWER; ++j) {
		sumaA = 0.;
		for (k = 0; k < setSize; ++k) 
			sumaA += pown(xSet[k], 4 + j);
		A[4 * POWER + j] = normalizing * sumaA;
	}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j)
		sumaB += pown(xSet[j], 4) * fSet[id * setSize + j];
	B[4] = sumaB * normalizing;

	// I = 5
	for (j = 0; j < POWER; ++j) {
		sumaA = 0.;
		for (k = 0; k < setSize; ++k) 
			sumaA += pown(xSet[k], 5 + j);
		A[5 * POWER + j] = normalizing * sumaA;
	}
	sumaB = 0.;
	for (j = 0; j < setSize; ++j) 
		sumaB += pown(xSet[j], 5) * fSet[id * setSize + j];
	B[5] = sumaB * normalizing;

	
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


__kernel void build_polinome_UNOPTIMIZED(__global const float* xSet, __global const float* fSet, __global float* C,
					__global float* A, __global float* B, __global int* Y,
					const int setSize,
					__global float* T,
					const int power) {
	int i, j, k;
	float normalizing = (float)1 / (setSize + 1);					// 1/(b-a)

	float sumaA;
	float sumaB;

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
			//printf("A[%d][%d] = %f\t", i, k, A[i*power + k]);
		}
	}

	for (i = power - 1; i >= 0; i--) {
		for (k = i + 1; k < power; k++)
			C[id * power + i] -= A[i * power + k] * C[id * power + k];

		C[id * power + i] /= A[i * power + i];
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
