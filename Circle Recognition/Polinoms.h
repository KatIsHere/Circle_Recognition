#pragma once
#include <string>
#include <unordered_set>
#include "Features.h"
#include <vector>
double Polinome_Power(double x, double* coefSet, const int& power);
// polinome derevative
double* polinome_derivative(double* coefs, const int& N);

// CHEBISHOW polinoms for discrete case
double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome");

// POLINOME POWER n
double Polinome_Power(double x, double* coefSet, const int& n);
double Polinome_Power_array(double x, double* coefSet, const int& power, const int& j);
std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b);
double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps = 0.0001);
double NewtonMethod(double* coefs, const int& N, const double&start, const double&finish, const double& Eps = 0.0001);
double* findExtrems(double* coefs, const int& N, const double& a, const double& b);
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
			const int& height, const int& N, const double& xFrom, const double& xTo,
			double& extrem_max, double& extrem_min, int& k_min, int& k_max);