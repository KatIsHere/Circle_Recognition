#include <cmath>
#include <string>
#include <unordered_set>
#include "Features.h"
#include <vector>
#include <algorithm>
#include "PolinomialRoots.h"

// -------------------------------------------------------------------------------------------------------------
// SOME POLINOME FUNCTIONS
// Returns polinome of a given power
double Polinome(double x, double* coefSet, const int& power) {
	double s = 1;
	for (int i = power - 1; i >= 0; i--)
		s = s * x + coefSet[i];
	return s;
}

double Polinomes_Array(double x, double* coefSet, const int& power, const int& j) {
	double suma = 0.;
	for (int i = 0; i < power; ++i) {
		suma += coefSet[power*j + i] * pow(x, i);						// 1 KERNEL
	}
	return suma;
}

double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome") {
	double sum = 0.;
	if (func == "polinome") {
		return Polinome(x, coefs, N_power);
	}
	else if (func == "exp") {
		for (int i = 0; i < N_power; ++i)
			sum += coefs[i] * (exp(-i * x) + exp(i*x));
	}
	return sum;
}


// -------------------------------------------------------------------------------------------------------------
// POLINOME DERIVATIVE
double* polinome_derivative(double* coefs, const int& N) {
	/*
	* Input: coeficients for a polinome power N
	* Return: coeficients for an input polinome derivative, power is N - 1
	*/
	double* derCoefs = new double[N - 1];
	for (int i = 0; i < N - 1; ++i)
		derCoefs[i] = (i + 1)*coefs[i + 1];						// 2 KERNEL
	return derCoefs;
}



// -------------------------------------------------------------------------------------------------------------
// FIND EXTREME VALUES IN A POLINOMES
//double* findExtrems(double* coefs, const int& N, const double& a, const double& b) {
//	double* newCoefs = polinome_derivative(coefs, N);
//	double* solv = new double[N - 1];
//
//	std::unordered_set<double> roots = SolvePolinome(newCoefs, N - 1, a, b);
//	int j = 0;
//	for (auto i = roots.begin(); i != roots.end(); ++i, ++j)
//		solv[j] = *(i);
//	delete[]newCoefs;
//	return solv;
//}


// FIND EXTREME VALUES IN A POLINOMES
double* findExtrems_v2(double* coefs, const int& N, const double& a, const double& b) {
	double* newCoefs = polinome_derivative(coefs, N);
	double* solv = new double[N - 1];
	int rootsC = 0;
	polynomRealRoots(N - 2, newCoefs, solv, rootsC);
	//std::unordered_set<double> roots = SolvePolinome(newCoefs, N - 2, a, b);
	//int j = 0;
	//for (auto i = roots.begin(); i != roots.end(); ++i, ++j)
		//solv[j] = *(i);
	delete[]newCoefs;
	return solv;
}


// Find all extremums and create fatures
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
	const int& height, const int& N, const double& xFrom, const double& xTo, 
	double& extrem_max, double& extrem_min, int& k_min, int& k_max) {
	// Finding all exteme values of the polinomes
	// On extreme values feathures can be build
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double maxF, minF;
	for (int i = 0; i < height; ++i) {
		extrems[i] = findExtrems_v2(polinomes[i], N, xFrom + 0.01, xTo);
		extremsValues[i] = new double[N - 1];
		for (int j = 0; j < N - 1; ++j) {
			extremsValues[i][j] = Polinome(extrems[i][j], polinomes[i], N);
			if (extremsValues[i][j] > max_Y) {
				k_max = i;
				extrem_max = extremsValues[i][j];
			}
			if (extremsValues[i][j] < min_Y){
				k_min = i;
				extrem_min = extremsValues[i][j];
			}
		}
	}
}
