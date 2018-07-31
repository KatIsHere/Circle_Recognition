#include <cmath>

double* squre_solve(double* A, double* B, const int power) {
	float sum;
	double* T = new double[power*power];
	double* d = new double[power];
	T[0] = sqrt(abs(A[0]));
	d[0] = A[0] > 0 ? 1 : -1;
	for (int j = 1; j < power; ++j) {
		T[j] = A[j] / T[0];
	}
	for (int i = 1; i < power; ++i) {
		for (int j = 0; j < power; ++j) {
			sum = 0;
			if (i == j) {
				for (int l = 0; l < i; ++l) {
					sum += T[l*power + i] * T[l * power + i] * d[l];
				}
				T[i * power + i] = sqrt(abs(A[i*power + i] - sum));
				d[i] = ((A[i * power + i] - sum > 0 ? 1 : -1));
			}
			else if (i < j) {
				for (int l = 0; l < i; ++l) {
					sum += T[l * power + i] * d[l] * T[l * power + j];
				}
				T[i*power + j] = (A[i*power + j] - sum) / (T[i * power + i] * d[i]);
			}
			else T[i*power + j] = 0;
		}
	}
	double* Y = new double[power];
	double* C = new double[power];
	Y[0] = B[0] / T[0];
	for (int i = 1; i < power; ++i) {
		sum = 0;
		for (int j = 0; j < i; ++j) {
			sum += T[j * power + i] * Y[j] * d[j];
		}
		Y[i] = (B[i] - sum) / (T[i*power + i] * d[i]);
	}
	C[power - 1] = Y[power - 1] / T[power*power - 1];
	for (int i = power - 2; i >= 0; --i) {
		sum = 0;
		for (int j = i; j < power; ++j) {
			sum += T[i*power + j] * C[j];
		}
		C[i] = (Y[i] - sum) / T[i*power + i];
	}
	return C;
}


/* INPUT: A - array of pointers to rows of a square matrix having dimension N
*        Tol - small tolerance number to detect failure when the matrix is near degenerate
*  OUTPUT: Matrix A is changed, it contains both matrices L-E and U as A=(L-E)+U such that P*A=L*U.
*        The permutation matrix is not stored as a matrix, but in an integer vector P of size N+1
*        containing column indexes where the permutation matrix has "1". The last element P[N]=S+N,
*        where S is the number of row exchanges needed for determinant computation, det(P)=(-1)^S
*/
int LUPDecompose(double **A, const int& N, double Tol, int *P) {

	int i, j, k, imax;
	double maxA, absA;
	double *ptr = new double[N];

	for (i = 0; i <= N; i++)
		P[i] = i; //Unit permutation matrix, P[N] initialized with N

	for (i = 0; i < N; i++) {
		maxA = 0.0;
		imax = i;

		for (k = i; k < N; k++)
			if ((absA = fabs(A[k][i])) > maxA) {			// 1 KERNEL
				maxA = absA;
				imax = k;
			}

		//failure, matrix is degenerate
		if (maxA < Tol) throw "Matrix is degenerate, try another method";

		if (imax != i) {
			//pivoting P
			j = P[i];
			P[i] = P[imax];
			P[imax] = j;

			for (int j = 0; j < N; ++j) {
				ptr[j] = A[i][j];
				A[i][j] = A[imax][j];
				A[imax][j] = ptr[j];
			}

			//counting pivots starting from N (for determinant)
			P[N]++;
		}

		for (j = i + 1; j < N; j++) {
			A[j][i] /= A[i][i];								// 2 KERNEL

			for (k = i + 1; k < N; k++)
				A[j][k] -= A[j][i] * A[i][k];				// 3 KERNEL
		}
	}
	delete[] ptr;
	// decomposition done 
	return 1;			
}


/* INPUT: A,P filled in LUPDecompose; b - rhs vector; N - dimension
*  OUTPUT: x - solution vector of A*x=b
*/
void LUPSolve(double **A, int *P, double *b, const int& N, double *x) {

	for (int i = 0; i < N; i++) {
		x[i] = b[P[i]];

		for (int k = 0; k < i; k++)
			x[i] -= A[i][k] * x[k];							// 3 KERNEL
	}

	for (int i = N - 1; i >= 0; i--) {
		for (int k = i + 1; k < N; k++)
			x[i] -= A[i][k] * x[k];							// 3 KERNEL

		x[i] = x[i] / A[i][i];								// 2 KERNEL
	}
}


/* INPUT: A,P filled in LUPDecompose; N - dimension
*  OUTPUT: IA is the inverse of the initial matrix
*/
void LUPInvert(double **A, int *P, const int& N, double **IA) {

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


/* INPUT: A,P filled in LUPDecompose; N - dimension.
*  OUTPUT: Function returns the determinant of the initial matrix
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