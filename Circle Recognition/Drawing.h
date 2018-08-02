#pragma once
#include "Plotter.h"
#include <random>
#include <limits>
#include <algorithm>
#include "PolinomeBuilder.h"
#include <iostream>
//-------------------------------------------------------------------------------------------------------
// DRAWING ON A GRAPH

inline void drawFunctionSet(double* polinomes, const int& height, const int& N, const double& xFrom, const double& xTo, 
	float* x_extr, float* y_extr,
	const int& dots = 100, float colorRed = 0.05f, float colorGreen = 0.05f,
	float colorBlue = 0.05f, float thikness = 1.45) {
	double* x = xCreateSet(xFrom, xTo, dots);
	double** values = PolinomeSetValues_array(x, polinomes, height, N, dots);


	double maxF, minF;
	float redCh, greenCh, blueCh;
	// MAX and MIN values of the set
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double max_X = x[dots - 1], min_X = x[0];


	double** extrems = new double*[height];
	double** extremsValues = new double*[height];

	for (int i = 0; i < height; ++i) {
		for (int j = 0; j < N - 1; ++j) {
			extrems[i][j] = x_extr[i*(N - 1) + j];
			extremsValues[i][j] = y_extr[i*(N - 1) + j];
		}
	}

	// Counting local max and min values of the set
	// Then counting overall MAX and MIN of the set
	// This helps to scale the graph
	for (int j = 0; j < height; ++j) {
		maxF = *(std::max_element(values[j], values[j] + dots));
		minF = *(std::min_element(values[j], values[j] + dots));
		if (maxF > max_Y)
			max_Y = maxF;
		if (minF < min_Y)
			min_Y = minF;
	}

	// Drawing approximated polinomes, extreme values
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotFunctionWithOrtho2D(x, values[i], dots, xTo, xFrom, max_Y, min_Y,
			colorRed + redCh, colorGreen + greenCh, colorBlue + blueCh, thikness);
		plotPointsWithOrtho2D(extrems[i], extremsValues[i], dots, xTo, xFrom, max_Y, min_Y, 0.5f, 0.0f, 1.0f, 3.0);
	}

	// Drawing center points
	//plotPointsWithOrtho2D(centerX, centerY, height, xTo, xFrom, max_Y, min_Y, 0.0f, 0.0f, 0.0f, 3.5);

	// Drawing axis
	Plot_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);

	// DELETING DATA
	//delete[]centerX; delete[]centerY;
	delete[]x;
	for (int i = 0; i < height; ++i) {
		delete[]values[i]; delete[]extrems[i]; delete[]extremsValues[i];
	}
	//delete[]extrems; delete[]extremsValues;
	delete[]values;
}



inline void drawFunctionSet(double** polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
			const int& dots = 100, float colorRed = 0.05f, float colorGreen = 0.05f,
			float colorBlue = 0.05f, float thikness = 1.45) {
	/*
	* Drawing the matrix as a set of functions(approximation polinomes, power N) 
	*/
	//double* x = xCreateSet(0, height, dots);

	double* x = xCreateSet(xFrom, xTo, dots);
	double** values = PolinomeSetValues(x, polinomes, height, N, dots);
	
	//double* centerX = new double[height];
	//double* centerY = new double[height];
	//double** extrems = new double*[height];
	//double** extremsValues = new double*[height];

	//findExtremums_and_features(polinomes, centerX, centerY, extrems, extremsValues, height, N, xFrom, xTo);

	double maxF, minF;
	float redCh, greenCh, blueCh;
	// MAX and MIN values of the set
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double max_X = x[dots - 1], min_X = x[0];
	
	// Counting local max and min values of the set
	// Then counting overall MAX and MIN of the set
	// This helps to scale the graph
	for (int j = 0; j < height; ++j) {
		maxF = *(std::max_element(values[j], values[j] + dots));
		minF = *(std::min_element(values[j], values[j] + dots));
		if (maxF > max_Y)
			max_Y = maxF;
		if (minF < min_Y)
			min_Y = minF;
	}
	// Drawing approximated polinomes, extreme values
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotFunctionWithOrtho2D(x, values[i], dots, xTo, xFrom, max_Y, min_Y,
			colorRed + redCh, colorGreen + greenCh, colorBlue + blueCh, thikness);
		//plotPointsWithOrtho2D(extrems[i], extremsValues[i], dots, xTo, xFrom, max_Y, min_Y, 0.5f, 0.0f, 1.0f, 3.0);
	}

	// Drawing center points
	//plotPointsWithOrtho2D(centerX, centerY, height, xTo, xFrom, max_Y, min_Y, 0.0f, 0.0f, 0.0f, 3.5);

	// Drawing axis
	Plot_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);

	// DELETING DATA
	//delete[]centerX; delete[]centerY;
	delete[]x;
	for (int i = 0; i < height; ++i) {
		delete[]values[i]; 
		//delete[]extrems[i]; delete[]extremsValues[i];
	}
	//delete[]extrems; delete[]extremsValues;
	delete[]values;
}


Point centerDetection(double** coefs, const int& height, const int& power, const double& a, const double&b) {
	int i;
	double** extrems = new double*[height];
	for (i = 0; i < height; ++i) {
		extrems[i] = findExtrems(coefs[i], power, a, b);
	}
	Point t;
	return t;
}


inline void drawPointsSet(double** matr, const int & height, const int& width, const double& xFrom, const double& xTo,
			float colorRed = 0.05f, float colorGreen = 0.05f,
			float colorBlue = 0.05f, float thikness = 4) {
	// MAX and MIN values of the set
	double* x = xCreateSet(xFrom, xTo, width);
	double maxF, minF;
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double max_X = x[width - 1], min_X = x[0];
	for (int j = 0; j < height; ++j) {
		maxF = *(std::max_element(matr[j], matr[j] + width));
		minF = *(std::min_element(matr[j], matr[j] + width));
		if (maxF > max_Y)
			max_Y = maxF;
		if (minF < min_Y)
			min_Y = minF;
	}
	// Drawing a set of points
	float redCh, greenCh, blueCh;
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotPointsWithOrtho2D(x, matr[i], width, xTo, xFrom, max_Y, min_Y, redCh, greenCh, blueCh, thikness);
		plotFunctionWithOrtho2D(x, matr[i], width, xTo, xFrom, max_Y, min_Y, redCh, greenCh, blueCh, 1.2);
	}
	Plot_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);
	delete[]x;
}
