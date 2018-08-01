/* APPROXIMATION
Used in mathematics to find a simple function,
that can have simmilar values to a given function, for example:
f(x) ~ sum(x{i} * phi(x{i})) - new function
Doesn't allways work great, especially for strongly oscillating functions.
RETURNS: a set of coefficients for a given set of functions
*/

#define __CL_ENABLE_EXCEPTIONS
#include "Polinoms.h"
#include <cmath>
#include <string>
#include "LinearEquations.h"
#include<iostream>
#define NORM_DIFFERENCE_MAX 1

double* approximation_coefs(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 5, std::string functions = "polinome", double SystemTolerance = 0.1) {
	/*
	* Approximation of a table function with a function of power n, using mean square ethod forapproximation
	* functions == "polinome" --- approximate with polinome P(x) = c0 + c1*c + ...
	* functions == "exp"	  --- approximate with exponent sum: Q(x) = c0 + c1(exp(-x) + exp(x)) + c1*(exp(-2x) + exp(x)) + ...
	*/
	double** A = new double*[polinomialPower];
	double* B = new double[polinomialPower];
	int i, j, k;
	double normalizing = double(1) / (setSize + 1);	// 1/(b-a)
	double sumaA, sumaB, res;
	for (i = 0; i < polinomialPower; ++i) {
		A[i] = new double[polinomialPower];
		for (j = 0; j < polinomialPower; ++j) {
			sumaA = 0.;
			for (k = 0; k < setSize; ++k) {
				if (functions == "polinome")
					sumaA += pow(xSet[k], i + j);
				else if (functions == "exp") {
					sumaA += (exp(i*xSet[k]) + exp(-i * xSet[k]))*(exp(j*xSet[k]) + exp(-j * xSet[k]));
				}
				//else if (functions == "cheb")
			}
			res = normalizing * sumaA;
			A[i][j] = res;
		}
		sumaB = 0.;
		for (j = 0; j < setSize; ++j) {
			if (functions == "polinome")
				sumaB += pow(xSet[j], i)*fSet[j];
			else if (functions == "exp") {
				sumaB += (exp(i*xSet[j]) + exp(-i * xSet[j]))*fSet[j];
			}
			//else if (functions == "cheb")
		}
		B[i] = sumaB * normalizing;
	}

	double* C = new double[polinomialPower];
	if (functions == "polinome") {
		int* P = new int[polinomialPower + 1];
		LUPDecompose(A, polinomialPower, SystemTolerance, P);
		LUPSolve(A, P, B, polinomialPower, C);
	}
	else if (functions == "exp") {
		C = GaussMethod(A, B, polinomialPower);
	}
	for (i = 0; i < polinomialPower; i++)
		delete[]A[i];
	delete[]B;	delete[]A;

	return C;
}


double* approximation_polinome(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 5, double SystemTolerance = 0.1) {
	/*
	* Approximation of a table function with a polinome of power n, using mean square ethod forapproximation
	* Returns an array of coeficients ci for polinome: Pn(x) = c0 + c1*x + c2*x**2 + ...
	* Faster than approximation_coefs(), because it doesn't have additional if's
	*/
	double** A = new double*[polinomialPower];
	double* B = new double[polinomialPower];
	int i, j, k;
	double normalizing = float(1) / (setSize + 1);	// 1/(b-a)
	double sumaA, sumaB;

	for (i = 0; i < polinomialPower; ++i) {
		A[i] = new double[polinomialPower]; 

		for (j = 0; j < polinomialPower; ++j) {
			sumaA = 0.;
			for (k = 0; k < setSize; ++k) {
				sumaA += pow(xSet[k], i + j);					
			}					
			A[i][j] = normalizing * sumaA;						
		}
		sumaB = 0.;
		for (j = 0; j < setSize; ++j) {
			sumaB += pow(xSet[j], i)*fSet[j];					
		}				
		B[i] = sumaB * normalizing;								
	}

	double* C = new double[polinomialPower];
	int* P = new int[polinomialPower + 1];
	LUPDecompose(A, polinomialPower, SystemTolerance, P);
	LUPSolve(A, P, B, polinomialPower, C);

	for (i = 0; i < polinomialPower; i++)
		delete[]A[i];
	delete[]B;	delete[]A;
	delete[]P;

	return C;
}


double factorial(const int& N) {
	int nFact = 1;
	for (int i = 1; i <= N; ++i) {
		nFact *= i;
	}
	return nFact;
}

double* approximation_Chebishov(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 4) {
	double* P = new double[polinomialPower];
	int i, j;
	double suma;
	for (i = 0; i < polinomialPower; ++i) {
		suma = 0;
		for (j = 0; j < setSize; ++j) {
			suma += fSet[j] * Polinome_Chebishow(xSet[j], setSize, i);
		}
		P[i] = (2 * polinomialPower + 1) * factorial(polinomialPower - 2) / factorial(polinomialPower + i + 1) * suma;
	}
	return P;
}


double normPolinomial_power4(double c0, double c1, double c2, double c3, double c4,
	double d0, double d1, double d2, double d3, double d4,
	double xFrom, double xTo) {
	// 4(c4 - d4) + 3(c3 - d3) + 2(c3 - d2) + (c1 - d1) + (c0 - d0)
	double x1 = Cubic_Solve(c4 - d4, c3 - d3, c2 - d2, c1 - d1);
	double secondDer1 = Polinome_2(x1, c2 - d2, c3 - d3, c4 - d4);
	double left = abs(Polinome_4(xFrom, c0 - d0, c1 - d1, c2 - d2, c3 - d3, c4 - d4));
	double right = abs(Polinome_4(xTo, c0 - d0, c1 - d1, c2 - d2, c3 - d3, c4 - d4));
	double extr = 0.;
	if (x1 - xFrom > 0 && xTo - x1 > 0) {
		extr = (Polinome_4(x1, c0 - d0, c1 - d1, c2 - d2, c3 - d3, c4 - d4));
	}

	if (left > extr)
		return (left > right) ? left : right;
	else
		return (extr > right) ? extr : right;
}


bool PolinomsComparator(double c0, double c1, double c2, double c3, double c4,
	double d0, double d1, double d2, double d3, double d4,
	double xFrom, double xTo) {
	double norm = normPolinomial_power4(c0, c1, c2, c3, c4, d0, d1, d2, d3, d4, xFrom, xTo);
	if (norm < NORM_DIFFERENCE_MAX)
		return true;
	else
		return false;
}


double sigma_sum(double* xSet, double* Fset, const int& setSize, double* func_coefs, const int& N_power, std::string approx) {
	/*
	* A helper function for approximation_optimal_N()
	*/
	double suma = 0, diff = 0;
	for (int i = 0; i < setSize; ++i) {
		diff = (Fset[i] - function_from_coefs(xSet[i], func_coefs, N_power, approx));
		suma += diff * diff;
	}
	suma = sqrt(suma / (setSize - N_power));
	return suma;
}


int approximation_optimal_N(double* xSet, double* FSet, const int& setSize, std::string approx = "polinome", const double& eps = 0.01) {
	/*
	* Retunrs optimal power for approximating a function
	* Helps to prevent overfitting when choosing an approximation function
	* Realy slow
	*/
	double suma = 0;
	int N = 0;
	int k;
	double prev = 0;
	bool first = true, last = false;
	for (k = 0; k < setSize; ++k) {
		double* qn = approximation_coefs(xSet, FSet, setSize, k, approx);
		suma = sigma_sum(xSet, FSet, setSize, qn, k, approx);
		if (first) {
			first = false;
			prev = suma;
		}
		else {
			if (prev - suma < eps)
				last = true;
			else
				prev = suma;
		}
		delete[]qn;
		if (last)
			break;
	}
	return k;
}