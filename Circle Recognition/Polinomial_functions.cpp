#include <cmath>
#include <string>
#include <unordered_set>
#include "Features.h"
#include <vector>
#include <algorithm>
#include "PolinomialRoots.h"
#include "LoaderAndPrinter.h"

// -------------------------------------------------------------------------------------------------------------
// SOME POLINOME FUNCTIONS
// Returns polinome of a given power
double Polinome(double x, double* coefSet, const int& power) {
	double s = 0;
	for (int i = 0; i < power; ++i) {
		s += coefSet[i] * pow(x, i);
	}
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
double* findExtrems(double* coefs, const int& N, const double& a, const double& b) {
	double* newCoefs = polinome_derivative(coefs, N);
	double* solv = new double[N - 1];

	std::unordered_set<double> roots = SolvePolinome(newCoefs, N - 1, a, b);
	int j = 0;
	for (auto i = roots.begin(); i != roots.end(); ++i, ++j)
		solv[j] = *(i);
	delete[]newCoefs;
	return solv;
}


// FIND EXTREME VALUES IN A POLINOMES
void findExtrems_v2(double* coefs, double* solv, const int& N, const double& a, const double& b, int& rootCounter) {
	double* newCoefs = polinome_derivative(coefs, N);
	rootCounter = 0;
	polynomRealRoots(N - 2, newCoefs, solv, rootCounter);
	//FindAllRootsOnSegment(N - 1, newCoefs, solv, rootsC, a, b);
	//printVectorScreen(solv, rootsC);
	//printf("\n");
	delete[]newCoefs;
}


// Find all extremums and create fatures
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
	const int& height, const int& N, const double& xFrom, const double& xTo, 
	double& extrem_max, double& extrem_min, int& k_min, int& k_max) {
	// Finding all exteme values of the polinomes
	// On extreme values feathures can be build
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double maxF, minF;
	int  extremCounter;
	int powerMax, powerMin;
	for (int i = 0; i < height; ++i) {
		extrems[i] = new double[N - 1];
		findExtrems_v2(polinomes[i],extrems[i], N, xFrom, xTo, extremCounter);
		extremsValues[i] = new double[N - 1];
		for (int j = 0; j < extremCounter; ++j) {
			extremsValues[i][j] = Polinome(extrems[i][j], polinomes[i], N);
			if (extremsValues[i][j] > max_Y) {
				k_max = i;
				extrem_max = extremsValues[i][j];
				powerMax = extremCounter;
			}
			if (extremsValues[i][j] < min_Y){
				k_min = i;
				extrem_min = extremsValues[i][j];
				powerMin = extremCounter;
			}
		}
	}
	Object_Features features(extrems[k_max], extremsValues[k_max], extrems[k_min], extremsValues[k_min], powerMax, powerMin, extrem_max, extrem_min);
	printf("\nAngles for max polinome: ");
	printVectorScreen(features.getAnglesMax(), features.getAnglNumMax());
	printf("\nAngles for min polinome: ");
	printVectorScreen(features.getAnglesMin(), features.getAnglNumMin());
	printf("\nDistances for max polinome: ");
	printVectorScreen(features.getDistMax(), features.getDistNumMax());
	printf("\nDistances for min polinome: ");
	printVectorScreen(features.getDistMin(), features.getDistNumMin());
	printf("\n");
}
