#pragma once
#include "Plotter.h"
#include <random>
#include <limits>
#include <algorithm>
#include "PolinomeBuilder.h"
#include <iostream>
#include <ctime>
#include <vector>
//-------------------------------------------------------------------------------------------------------
// DRAWING ON A GRAPH

inline void drawFunctionSet(double* polinomes, const int& height, const int& N, const double& xFrom, const double& xTo, 
	const int& classNumb,
	AvarageMeaninig Avar,
	const int& dots = 100, float colorRed = 0.05f, float colorGreen = 0.05f,
	float colorBlue = 0.05f, float thikness = 1.45) {
	double* x = xCreateSet(xFrom, xTo, dots);
	double** values = PolinomeSetValues_array(x, polinomes, height, N, dots);

	//double* centerX = new double[height];
	//double* centerY = new double[height];
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
	double max_X = x[dots - 1], min_X = x[0];
	double max_Y, min_Y;
	const clock_t start = clock();
	findExtremums_and_features(polinomes_new, extrems, extremsValues, extrNumb, height, N, xFrom, xTo, max_Y, min_Y, pos_min, pos_max, Avar);
	const clock_t finish = clock();

	//printf("EXTREMUMS TIME COUNT: %f\n", (float)(finish - start) / CLOCKS_PER_SEC);

	// Drawing approximated polinomes, extreme values
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotFunctionWithOrtho2D(x, values[i], dots, xTo, xFrom, max_Y, min_Y,
			colorRed + redCh, colorGreen + greenCh, colorBlue + blueCh, thikness);
		plotPointsWithOrtho2D(extrems[i], extremsValues[i], extrNumb[i], xTo, xFrom, max_Y, min_Y, 1.f, 0.0f, 0.2f, 3.5);
	}

	// Drawing center points
	//plotPointsWithOrtho2D(centerX, centerY, height, xTo, xFrom, max_Y, min_Y, 0.0f, 0.0f, 0.0f, 3.5);

	// Drawing axis
	Plot_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);

	// Drawing info
	std::string obj_name = "Input height = " + std::to_string(height);
	RenderString(0.63, 0.9, obj_name, GLUT_BITMAP_9_BY_15);
	obj_name = "Width = " + std::to_string((int)xTo);
	RenderString(0.63, 0.84, obj_name, GLUT_BITMAP_9_BY_15);
	obj_name = "Polinome power is " + std::to_string(N - 1);
	RenderString(0.63, 0.78, obj_name, GLUT_BITMAP_9_BY_15);
	obj_name = "Of class: " + std::to_string(classNumb);
	RenderString(0.63, 0.72, obj_name, GLUT_BITMAP_9_BY_15);

	// DELETING DATA
	//delete[]centerX; delete[]centerY;
	delete[]x;
	for (int i = 0; i < height; ++i) {
		delete[]values[i]; delete[]extrems[i]; delete[]extremsValues[i];
		delete[]polinomes_new[i];
	}
	delete[]polinomes_new;
	delete[]extrems; delete[]extremsValues;
	delete[]values;
	delete[]extrNumb;
}



inline void drawFunctionSet(double** polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
			AvarageMeaninig Avar,
			const int& dots = 100, float colorRed = 0.05f, float colorGreen = 0.05f,
			float colorBlue = 0.05f, float thikness = 1.45) {
	/*
	* Drawing the matrix as a set of functions(approximation polinomes, power N) 
	*/
	double* x = xCreateSet(xFrom, xTo, dots);
	double** values = PolinomeSetValues(x, polinomes, height, N, dots);
	
	//double* centerX = new double[height];
	//double* centerY = new double[height];
	double** extrems = new double*[height];
	double** extremsValues = new double*[height];

	double max_X = x[dots - 1], min_X = x[0];
	double max_Y, min_Y;

	double extrem_max = 0, extrem_min = 0;
	int pos_max = 0, pos_min = 0;	
	int* extrNumb = new int[height];

	const clock_t start = clock();
	findExtremums_and_features(polinomes, extrems, extremsValues, extrNumb, height, N, xFrom, xTo, max_Y, min_Y, pos_min, pos_max, Avar);
	const clock_t finish = clock();

	printf("EXTREMUMS TIME COUNT: %f\n", (finish - start) / CLOCKS_PER_SEC);

	double maxF, minF;
	float redCh, greenCh, blueCh;

	// Drawing approximated polinomes, extreme values
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotFunctionWithOrtho2D(x, values[i], dots, xTo, xFrom, max_Y, min_Y,
			colorRed + redCh, colorGreen + greenCh, colorBlue + blueCh, thikness);
		plotPointsWithOrtho2D(extrems[i], extremsValues[i], extrNumb[i], xTo, xFrom, max_Y, min_Y, 1.f, 0.0f, 0.2f, 3.5);
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
		delete[]extrems[i]; delete[]extremsValues[i];
	}
	delete[]extrems; delete[]extremsValues;
	delete[]values;

	std::string obj_name = "Input height = " + std::to_string(height); 
	RenderString(0.63, 0.9, obj_name, GLUT_BITMAP_9_BY_15);
	obj_name = "Width = " + std::to_string((int)xTo);
	RenderString(0.63, 0.84, obj_name, GLUT_BITMAP_9_BY_15);
	obj_name = "Polinome power is " + std::to_string(N - 1);
	RenderString(0.63, 0.78, obj_name, GLUT_BITMAP_9_BY_15);
}


Point centerDetection(double** coefs, const int& height, const int& power, const double& a, const double&b) {
	int i;
	int nimb;
	double** extrems = new double*[height];
	for (i = 0; i < height; ++i) {
		extrems[i] = new double[power - 1];
		findExtrems_v2(coefs[i], extrems[i], power, a, b, nimb);
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