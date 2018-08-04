#pragma once
#include "Polinoms.h"
#include <ctime>
#include "Features.h"
#include "PolinomeBuilder.h"
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