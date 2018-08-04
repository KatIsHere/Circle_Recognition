#pragma once
#include <string>
#include <unordered_set>
#include "Features.h"
#include <vector>
// Simple polinome/ flom coeficients
double Polinome(double x, double* coefSet, const int& power);

// polinome derevative
double* polinome_derivative(double* coefs, const int& N);

// CHEBISHOW polinoms for discrete case
double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome");

// POLINOME POWER n
double Polinomes_Array(double x, double* coefSet, const int& power, const int& j);
std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b);
//double* findExtrems(double* coefs, const int& N, const double& a, const double& b);
void findExtrems_v2(double* coefs, double* solv, const int& N, const double& a, const double& b, int& rootCounter);
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
		int* sizes,
		const int& height, const int& N, const double& xFrom, const double& xTo,
		double& extrem_max, double& extrem_min, int& k_min, int& k_max);
double* findExtrems(double* coefs, const int& N, const double& a, const double& b);