#pragma once
#include "Polinoms.h"
#include <ctime>
#include "Features.h"
#include "PolinomeBuilder.h"
#include <vector>

void Classify(vector<float>& possibilities, vector<Object_Features> classes, const Object_Features& features) {

}



// Find all extremums and create fatures
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
	int* sizes,
	const int& height, const int& N, const double& xFrom, const double& xTo,
	double& extrem_max, double& extrem_min, int& k_min, int& k_max, AvarageMeaninig& avar) {
	// Finding all exteme values of the polinomes
	// On extreme values feathures can be build
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double maxF, minF;
	int  extremCounter;
	int powerMax, powerMin;
	for (int i = 0; i < height; ++i) {
		extrems[i] = new double[N - 1];
		findExtrems_v2(polinomes[i], extrems[i], N, xFrom, xTo, extremCounter);
		sizes[i] = extremCounter;
		extremsValues[i] = new double[extremCounter];
		for (int j = 0; j < extremCounter; ++j) {
			extremsValues[i][j] = Polinome(extrems[i][j], polinomes[i], N);
			if (extremsValues[i][j] > max_Y) {
				k_max = i;
				extrem_max = extremsValues[i][j];
				max_Y = extrem_max;
				powerMax = extremCounter;
			}
			if (extremsValues[i][j] < min_Y) {
				k_min = i;
				extrem_min = extremsValues[i][j];
				min_Y = extrem_min;
				powerMin = extremCounter;
			}
		}
	}

	Object_Features features(extrems[k_max], extremsValues[k_max], extrems[k_min], extremsValues[k_min], powerMax, powerMin, extrem_max, extrem_min);
	avar.add_features(features);
	printf("\nLocal max: %f, local min: %f", extrem_max, extrem_min);
	printf("\nAngles for max polinome: ");
	//printVectorScreen(features.getAnglesMax(), features.getAnglNumMax());
	printVectorPresigion(features.getAnglesMax(), features.getAnglNumMax());
	printf("\nAngles for min polinome: ");
	//printVectorScreen(features.getAnglesMin(), features.getAnglNumMin());
	printVectorPresigion(features.getAnglesMin(), features.getAnglNumMin());
	printf("\nDistances for max polinome: ");
	printVectorScreen(features.getDistMax(), features.getDistNumMax());
	printf("\nDistances for min polinome: ");
	printVectorScreen(features.getDistMin(), features.getDistNumMin());
	printf("\n");
}



inline void Calculate(double* polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
	const int& classNumb,
	AvarageMeaninig& Avar) {
	double** extrems = new double*[height];
	double** extremsValues = new double*[height];

	double maxF, minF;
	float redCh, greenCh, blueCh;
	// MAX and MIN values of the set
	double** polinomes_new = new double*[height];
	for (int i = 0; i < height; ++i) {
		polinomes_new[i] = new double[N];
		for (int j = 0; j < N; ++j) {
			polinomes_new[i][j] = polinomes[i*N + j];
		}
	}

	//std::vector<Features> features;
	double extrem_max = 0, extrem_min = 0;
	int pos_max = 0, pos_min = 0;
	int* extrNumb = new int[height];
	double max_Y, min_Y;
	//const clock_t start = clock();
	findExtremums_and_features(polinomes_new, extrems, extremsValues, extrNumb, height, N, xFrom, xTo, max_Y, min_Y, pos_min, pos_max, Avar);
	//const clock_t finish = clock();
	for (int i = 0; i < height; ++i) {
		delete[]extrems[i]; delete[]extremsValues[i];
		delete[]polinomes_new[i];
	}
	delete[]polinomes_new;
	delete[]extrems; delete[]extremsValues;
	delete[]extrNumb;
}