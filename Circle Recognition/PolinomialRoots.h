#pragma once
#include <cmath>
double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps = 0.000001);
double NewtonMethod(double* coefs, const int& N, const double& start, const double& finish, const double& Eps = 0.000001);
double BisectionMethod(int power, double edgeNegativ, double edgePositiv, double *coefs, const double& Eps = 0.0000001);
std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b);
void polynomRealRoots(int n, double *coefs, double *rootsArray, int &rootsCount, const double& start, const double& finish);
void FindAllRootsOnSegment(int power, double *coefs, double *rootsArray, int &rootsCount, const double& edgeLeft, const double& edgeRight, const int& segments_numb_mult = 15);