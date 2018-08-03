#pragma once
int LUPDecomposition(double **A, const int& N, double Tol, int *P);
void LUPSystemSolve(double **A, int *P, double *b, const int& N, double *x);
void LUPInvertMatrix(double **A, int *P, const int& N, double **IA);
double LUPDeterminant(double **A, int *P, const int& N);