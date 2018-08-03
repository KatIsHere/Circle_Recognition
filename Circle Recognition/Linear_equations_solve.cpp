#include <cmath>

/* Input: A - square matrix having dimension N
*        Tol - small tolerance number to detect failure when the matrix is near degenerate
*  Output: Matrix A is changed, it contains both matrices L-E and U as A=(L-E)+U such that P*A=L*U.
*        The permutation matrix is not stored as a matrix, but in an integer vector P of size N+1
*        containing column indexes where the permutation matrix has "1". The last element P[N]=S+N,
*        where S is the number of row exchanges needed for determinant computation, det(P)=(-1)^S
*  Exceptions: matrix is degenerate
*/
int LUPDecomposition(double **A, const int& N, double Tol, int *P) {

	int i, j, k, i_max;
	double max_a, absA;
	double *ptr = new double[N];

	for (i = 0; i <= N; i++)
		P[i] = i;

	for (i = 0; i < N; i++) {
		max_a = 0.0;
		i_max = i;

		for (k = i; k < N; k++) {
			if ((absA = fabs(A[k][i])) > max_a) {			// 1 KERNEL
				max_a = absA;
				i_max = k;
			}
			//printf("A[%d][%d] = %f\t", k, i, A[k][i]);
		}
		//printf("maxA = %f\n", max_a);
		if (max_a < 0.01) throw "Matrix is degenerate, try another method";

		if (i_max != i) {
			j = P[i];
			P[i] = P[i_max];
			P[i_max] = j;

			for (int j = 0; j < N; ++j) {
				ptr[j] = A[i][j];
				A[i][j] = A[i_max][j];
				A[i_max][j] = ptr[j];
			}
			P[N]++;
		}

		for (j = i + 1; j < N; j++) {
			A[j][i] /= A[i][i];								

			for (k = i + 1; k < N; k++)
				A[j][k] -= A[j][i] * A[i][k];				
		}
	}
	delete[] ptr;
	return 1;			
}


/* 
* Input: A,P filled in LUPDecompose; b - resoults vector; N - dimension
* Output: x - solution vector of A*x=b
*/
void LUPSystemSolve(double **A, int *P, double *b, const int& N, double *x) {
	for (int i = 0; i < N; i++) {
		x[i] = b[P[i]];

		for (int k = 0; k < i; k++)
			x[i] -= A[i][k] * x[k];				
	}

	for (int i = N - 1; i >= 0; i--) {
		for (int k = i + 1; k < N; k++)
			x[i] -= A[i][k] * x[k];						

		x[i] = x[i] / A[i][i];							
	}
}


/* 
* Input: A,P filled in LUPDecompose; N - dimension
* Output: IA is the inverse of the initial matrix
*/
void LUPInvertMatrix(double **A, int *P, const int& N, double **IA) {

	for (int j = 0; j < N; j++) {
		for (int i = 0; i < N; i++) {
			if (P[i] == j)
				IA[i][j] = 1.0;
			else
				IA[i][j] = 0.0;

			for (int k = 0; k < i; k++)
				IA[i][j] -= A[i][k] * IA[k][j];
		}

		for (int i = N - 1; i >= 0; i--) {
			for (int k = i + 1; k < N; k++)
				IA[i][j] -= A[i][k] * IA[k][j];

			IA[i][j] = IA[i][j] / A[i][i];
		}
	}
}


/* 
* Input: A,P filled in LUPDecompose; N - dimension.
* Output: Function returns the determinant of the initial matrix
*/
double LUPDeterminant(double **A, int *P, const int& N) {

	double det = A[0][0];

	for (int i = 1; i < N; i++)
		det *= A[i][i];

	if ((P[N] - N) % 2 == 0)
		return det;
	else
		return -det;
}