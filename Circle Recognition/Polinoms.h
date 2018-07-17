#pragma once
#include <string>
#include <unordered_set>
double Polinome_4(double x, double c0, double c1, double c2, double c3, double c4);					// c0 + c1*x + c2*x**2 + c3*x**3 + c4*x**4
double Polinome_3(double x, double c0, double c1, double c2, double c3);							// c0 + c1*x + c2*x**2 + c3*x**3
double Polinome_2(double x, double c0, double c1, double c2);										// c0 + c1*x + c2*x**2
double Polinome_Power(double x, double* coefSet, const int& power);
double scalarMult(double &f1(double &), double &f2(double&), double * xSet, const int& setSize);	// scalar multiplication
double Cubic_Solve(double a, double b, double c, double d);											// solve cubic equation

// polinome derevative
double* polinome_derivative(double* coefs, const int& N);

// Chebishow polinoms for discrete case
double Polinome_Chebishow(double x, const int& SetSize, const int& power);
double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome");

std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b);
double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps = 0.0001);
double NewtonMethod(double* coefs, const int& N, const double&start, const double& Eps = 0.0001);
double* findExtrems(double* coefs, const int& N, const double& a, const double& b);
double Polinome_Power(double x, double* coefSet, const int& power);