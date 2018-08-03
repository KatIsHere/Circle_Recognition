#pragma once
#include <string>
double* approximation_coefs(double* xSet, double* fSet, const int& setSize, 
		const int& polinomialPower = 5, std::string functions = "polinome", double SystemTolerance = 0.01);
double* approximation_polinome(double* xSet, double* fSet, const int& setSize, const int& polinomialPower = 5, double SystemTolerance = 0.1);
