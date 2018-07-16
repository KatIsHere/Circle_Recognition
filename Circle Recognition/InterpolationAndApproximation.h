#pragma once
#include <string>
double* approximation_coefs(double* xSet, double* fSet, const int& setSize, 
		const int& polinomialPower = 5, std::string functions = "polinome", double SystemTolerance = 0.01);
double* approximation_Chebishov(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 4);
int approximation_optimal_N(double* xSet, double* FSet, const int& setSize, 
		std::string approx = "polinome", const double& eps = 0.01);
double interpolation_Lagrange(double x, double* xSet, double* fSet, const int& setSize);
bool PolinomsComparator(double c0, double c1, double c2, double c3, double c4,
	double d0, double d1, double d2, double d3, double d4,
	double xFrom, double xTo);
double** create_approx_polinomes(double*xSet, double **matrix, const int& hight, const int& width, 
		const int& polinome_power, std::string approximationFunc = "polinome");
double* xCreateSet(double start, double finish, const int& N);
double** PolinomeSetValues(double*x, double** PolinomeCoefs, const int& height, const int& N, const int& dots);
double** ReverseMatrix(double** matr, const int& hight, const int& wigth);