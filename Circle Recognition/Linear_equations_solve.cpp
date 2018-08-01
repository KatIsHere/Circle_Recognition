#include <cmath>
#include <iostream> // for debuging
/*
* The method is efficient for solving any system of linear equations
* with symmetric coefficients
* Input: A - array of pointers to rows of a square matrix having dimension N; b - resoults vector
* Output: x - solution vector of A*x=b
*/
void squre_root_solve(double** A, double* B, const int& N, double* x) {
	float sum;
	double* S = new double[N*N];
	double* K = new double[N];
	int i, j, k;
	double suma = 0;

	// Step 1
	S[0] = sqrt(A[0][0]);
	for (j = 1; j < N; ++j) {
		S[j] = A[0][j] / S[0];
	}
	for (i = 1; i < N; ++i) {
		suma = A[i][i];
		for (k = 0; k < i - 1; ++k)
			suma -= S[k*N + i] * S[k*N + i];
		S[i*N + i] = sqrt(suma);
		for (j = i + 1; j < N; ++j) {
			suma = A[i][j];

			for (k = 0; k < i - 1; ++k) {
				suma -= S[k*N + i] * S[k*N + j];
			}
			S[i*N + j] = suma / S[i*N + i];
		}
	}

	// Step 2
	K[0] = B[0] / S[0];
	for (i = 1; i < N; ++i) {
		suma = B[i];
		for (j = 0; j < i - 1; ++j)
			suma -= K[j] * S[j*N + i];
		K[i] = suma / S[i*N + i];
	}

	// Step 3 - solution
	x[N - 1] = K[N - 1] / S[N*N - 1];
	for (i = N - 2; i >= 0; --i) {
		suma = K[i];
		for (k = i + 1; k < N; ++k)
			suma -= S[i*N + k] * x[k];
		x[i] = suma / S[i*N + i];
	}

	delete[]S, delete[]K;
}


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


double* BaireissSolve(double** A, double* b, const int & N) {
	double* x = new double[N];
	double** A_copy = new double*[N];
	int i, j;
	for (i = 0; i < N; ++i) {
		A_copy[i] = new double[N + 1];
		for (j = 0; j < N; ++j) {
			A_copy[i][j] = A[i][j];
		}
		A_copy[i][N] = b[i];
	}

	double p0 = 1, p1 = A_copy[0][0];

	for (j = 0; j < N + 1; ++j) {
		for (i = 0; i < N; ++i) {
			if (i != j) {
				A_copy[i][j] = (A[i][j] * p1) / p0;
			}
		}
	}

	for (i = 0; i < N; ++i) {
		delete[]A_copy[i];
	}
	delete[]A_copy;

	return x;
}


/*
* Gauss Method is a method for solving linear equations
* It is considered slow, but effective and should work for 
* all types of matrixes, given the solution exists
* Input: A matrix; b - resoults vector; N - dimension.
* Output: Function returns the solutions of system of linear equations A*x = b 
* Exceptions: no solution exists
*/
double* GaussMethod(double** A, double*b, const int& n) {
	/* Finds a solution to the system of linear equations
	using Gauss method*/
	double *x, max;
	int k, index;
	const double eps = 0.001;  // precision
	x = new double[n];
	k = 0;
	while (k < n)
	{
		// Find a row with max a[i][k]
		max = abs(A[k][k]);
		index = k;
		for (int i = k + 1; i < n; i++)
		{
			if (abs(A[i][k]) > max)
			{
				max = abs(A[i][k]);
				index = i;
			}
		}
		// Rearrange lines
		if (max < eps)
		{
			// no non-zero elements
			throw "There is no solution because of non-zero collum of the matrix";
		}
		for (int j = 0; j < n; j++)
		{
			double temp = A[k][j];
			A[k][j] = A[index][j];
			A[index][j] = temp;
		}
		double temp = b[k];
		b[k] = b[index];
		b[index] = temp;
		// Normalization of equations
		for (int i = k; i < n; i++)
		{
			double temp = A[i][k];
			if (abs(temp) < eps) continue; // skip for a zero element
			for (int j = 0; j < n; j++)
				A[i][j] = A[i][j] / temp;
			b[i] = b[i] / temp;
			if (i == k)  continue; // the equation does not deduct itself from itself
			for (int j = 0; j < n; j++)
				A[i][j] = A[i][j] - A[k][j];
			b[i] = b[i] - b[k];
		}
		k++;
	}
	// inverse substitution
	for (k = n - 1; k >= 0; k--)
	{
		x[k] = b[k];
		for (int i = 0; i < k; i++)
			b[i] = b[i] - A[i][k] * x[k];
	}
	return x;
}


/*
* Tridiagonal Method is a method for solving linear equations with tridiagonal matrixes
* Input: a, b, c - arrays, representing left, center and right non-zero lines of values; 
* d - resoults vector; N - dimension.
* Output: Function returns the solutions of system of linear equations A*x = b
*/
double* TridiagonalSolve(const double *a, const double *b, double *c, double *d, const int& n) {
	// a[0] == 0
	// c[n-1] == 0
	double* x = new double[n];
	/* Modify the coefficients. */
	c[0] /= b[0];
	d[0] /= b[0];
	double id;	int i;
	for (i = 1; i < n; i++) {
		id = 1 / (b[i] - c[i - 1] * a[i]);  /* Division by zero risk. */
		c[i] *= id;	                         /* Last value calculated is redundant. */
		d[i] = (d[i] - d[i - 1] * a[i]) * id;
	}

	x[n - 1] = d[n - 1];
	for (i = n - 2; i >= 0; i--)
		x[i] = d[i] - c[i] * x[i + 1];

	return x;
}

double* TridiagonalSolve(const int *a, const int *b, double *c, int *d, const int& n) {
	// a[0] == 0
	// c[n-1] == 0
	double* x = new double[n];
	/* Modify the coefficients. */
	c[0] /= b[0];
	d[0] /= b[0];
	double id;	int i;
	for (i = 1; i < n; i++) {
		id = 1 / (b[i] - c[i - 1] * a[i]);  /* Division by zero risk. */
		c[i] *= id;	                         /* Last value calculated is redundant. */
		d[i] = (d[i] - d[i - 1] * a[i]) * id;
	}

	x[n - 1] = d[n - 1];
	for (i = n - 2; i >= 0; i--)
		x[i] = d[i] - c[i] * x[i + 1];

	return x;
}