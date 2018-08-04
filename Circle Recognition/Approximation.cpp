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
		LUPDecomposition(A, polinomialPower, SystemTolerance, P);
		LUPSystemSolve(A, P, B, polinomialPower, C);
	}
	//else if (functions == "exp") {
		//C = GaussMethod(A, B, polinomialPower);
	//}
	for (i = 0; i < polinomialPower; i++)
		delete[]A[i];
	delete[]B;	delete[]A;

	return C;
}


double* approximation_polinome(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 5, double SystemTolerance = 0.01) {
	/*
	* Approximation of a table function with a polinome of power n, using mean square ethod forapproximation
	* Returns an array of coeficients ci for polinome: Pn(x) = c0 + c1*x + c2*x**2 + ...
	* Faster than approximation_coefs(), because it doesn't have additional if's
	*/
	double** A = new double*[polinomialPower];
	double* B = new double[polinomialPower];
	int i, j, k;
	double normalizing = double(1) / (setSize + 1);	// 1/(b-a)
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
	LUPDecomposition(A, polinomialPower, SystemTolerance, P);
	LUPSystemSolve(A, P, B, polinomialPower, C);
	for (i = 0; i < polinomialPower; i++)
		delete[]A[i];
	delete[]B;	delete[]A;
	delete[]P;
	return C;
}