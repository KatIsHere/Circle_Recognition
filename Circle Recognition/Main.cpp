//#include <string>
#include <iostream>
#include <ctime>
#include <algorithm>
#include <random>
#include <limits>
#include "Features.h"
#include "LoaderAndPrinter.h"
#include "InterpolationAndApproximation.h"
#include "LinearEquations.h"
#include "PolinomeBuilder.h"
#include "Plotter.h"
#include "Polinoms.h"
using namespace std;

#define RENDER_CENTER

const int SIZE_SMALL = 17;
const int SIZE_MEDDIUM = 28;
const int SIZE_LARGE = 32;
const int POLINOME_POWER_SMALL = 5;
const int POLINOME_POWER_LARGE = 6;
const int POLINOME_POWER_MEDDIUM = 6;
const int POLINOME_POWER = 6;
const int DOTS = 100;

void RenderApproximation(void);
void RenderPoints(void);
void RenderReversed(void);
//Point* localMinMax(double* xSet, double* fSet, const int& setSize, const int& power);
inline void drawPointsSet(double** matr, const int & height, const int& width, const double& xFrom, const double& xTo,
	float colorRed = 0.05f, float colorGreen = 0.05f,
	float colorBlue = 0.05f, float thikness = 4);
inline void drawFunctionSet(double** polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
	const int& dots = 100, float colorRed = 0.05f, float colorGreen = 0.05f,
	float colorBlue = 0.05f, float thikness = 1.45);


int main(int argc, char ** argv) {
	int WindowPosX = 100, WindowPosY = 100;
	int WindowHeight = 700, WindowWidth = 1200;

	// Draw a window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX, WindowPosY);
	glutCreateWindow("Approximation graph");
	glutDisplayFunc(RenderApproximation);

	glutInit(&argc, argv);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX + 50, WindowPosY + 50);
	glutCreateWindow("Real data graph");
	glutDisplayFunc(RenderPoints);

	glutInit(&argc, argv);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX + 50, WindowPosY + 50);
	glutCreateWindow("Reversed data graph");
	glutDisplayFunc(RenderReversed);

	glutMainLoop();

	return 1;
}



//-------------------------------------------------------------------------------------------------------
// DRAWING ON A GRAPH

inline void drawFunctionSet(double** polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
	const int& dots, float colorRed, float colorGreen, float colorBlue, float thikness) {
	double* x = xCreateSet(0, height, dots);
	double** values = PolinomeSetValues(x, polinomes, height, N, dots);
	double maxF, minF;
	float redCh, greenCh, blueCh;
	//srand(time(NULL));

	// MAX and MIN values of the set
	double max_Y = -numeric_limits<double>::infinity(), min_Y = numeric_limits<double>::infinity();
	double max_X = x[dots - 1], min_X = x[0];


	for (int j = 0; j < height; ++j) {
		maxF = *(max_element(values[j], values[j] + dots));
		minF = *(min_element(values[j], values[j] + dots));
		if (maxF > max_Y)
			max_Y = maxF;
		if (minF < min_Y)
			min_Y = minF;
	}
	//double* centerX = new double[height];
	//double* centerY = new double[height];
	/*double** extremX = new double*[height];
	double** extremY = new double*[height];*/

	double** extrems = new double*[height];
	double** extremsValues = new double*[height];
	// Finding all exteme values
	for (int i = 0; i < height; ++i) {
		extrems[i] = findExtrems(polinomes[i], N, xFrom, xTo);
		extremsValues[i] = new double[N - 1];
		for (int j = 0; j < N - 1; ++j) {
			extremsValues[i][j] = Polinome_Power(extrems[i][j], polinomes[i], N);
		}
		//Features feature = Features(extrem, N - 1);					// creating a feture for one func														
		//centerY[i] = feature.getCenter().y;
		//centerX[i] = feature.getCenter().x;
		//extremX[i] = new double[N - 1];
		//extremY[i] = new double[N - 1];
		//Point* extrem = localMinMax(x, values[i], dots, N - 1);		// all extrems of a func
		//for (int j = 0; j < N - 1; ++j) {
		//	cout << "(" << extrem[j].x << ", " << extrem[j].y << ")" << "\t";
		//	extremX[i][j] = extrem[j].x;
		//	extremY[i][j] = extrem[j].y;
		//}

	}

	// Drawing approximated polinomes
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotFunctionWithOrtho2D(x, values[i], dots, xTo, xFrom, max_Y, min_Y,
			colorRed + redCh, colorGreen + greenCh, colorBlue + blueCh, thikness);
		plotPointsWithOrtho2D(extrems[i], extremsValues[i], dots, xTo, xFrom, max_Y, min_Y, 1.0f, 0.0f, 0.0f, 3);
	}

	// Drawing center points
	//plotPointsWithOrtho2D(centerX, centerY, height, xTo, xFrom, max_Y, min_Y, 0.0f, 0.0f, 0.0f, 2.5);

	// Drawing axis
	Draw_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);

	// DELETING DATA
	//delete[]centerX; delete[]centerY;
	delete[]x;
	for (int i = 0; i < height; ++i) {
		delete[]values[i]; delete[]extrems[i]; delete[]extremsValues[i];
	}
	delete[]extrems; delete[]extremsValues;
	delete[]values;

}



Point centerDetection(double** coefs, const int& height, const int& power, const double& a, const double&b) {
	int i, j;
	double** extrems = new double*[height];
	for (i = 0; i < height; ++i) {
		extrems[i] = findExtrems(coefs[i], power, a, b);
	}
	Point t;
	return t;
}


inline void drawPointsSet(double** matr, const int & height, const int& width, const double& xFrom,
	const double& xTo,
	float colorRed, float colorGreen, float colorBlue, float thikness) {
	// MAX and MIN values of the set
	double* x = xCreateSet(xFrom, xTo, width);
	double maxF, minF;
	double max_Y = -numeric_limits<double>::infinity(), min_Y = numeric_limits<double>::infinity();
	double max_X = x[width - 1], min_X = x[0];
	for (int j = 0; j < height; ++j) {
		maxF = *(max_element(matr[j], matr[j] + width));
		minF = *(min_element(matr[j], matr[j] + width));
		if (maxF > max_Y)
			max_Y = maxF;
		if (minF < min_Y)
			min_Y = minF;
	}
	float redCh, greenCh, blueCh;
	for (int i = 0; i < height; ++i) {
		redCh = float(rand() % 90) / 100 - 0.05;
		greenCh = float(rand() % 90) / 100 - 0.05;
		blueCh = float(rand() % 90) / 100 - 0.05;
		plotPointsWithOrtho2D(x, matr[i], width, xTo, xFrom, max_Y, min_Y, redCh, greenCh, blueCh, thikness);
		plotFunctionWithOrtho2D(x, matr[i], width, xTo, xFrom, max_Y, min_Y, redCh, greenCh, blueCh, 1.2);
	}
	Draw_XY_Axis(min_X, max_X, min_Y, max_Y, 0, 0);
	delete[]x;
}


//-------------------------------------------------------------------------------------------------------
// SCENE RENDERING

void RenderApproximation(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";

	double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	double** MatrixSMALL = loadMatrix(filepath_SMALL, SIZE_SMALL, SIZE_SMALL);
	double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	double* x_SMALL = xCreateSet(0, SIZE_SMALL, SIZE_SMALL);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 1);
	double** polinomes_SMALL = buidPolinome(x_SMALL, MatrixSMALL, SIZE_SMALL, POLINOME_POWER_SMALL, 0);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();

	drawFunctionSet(polinomes_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]polinomes_LARGE[i];
	delete[]polinomes_LARGE;
	for (int i = 0; i < SIZE_SMALL; ++i)
		delete[]polinomes_SMALL[i];
	delete[]polinomes_SMALL;
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
	for (int i = 0; i < SIZE_SMALL; ++i)
		delete[]MatrixSMALL[i];
	delete[]MatrixSMALL;
	//delete[]x_LARGE;
	//delete[]x_SMALL;
}


void RenderReversed(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	double** Matrix = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	double** MatrixLARGE = ReverseMatrix(Matrix, SIZE_LARGE, SIZE_LARGE);
	double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();
	//glOrtho(0, 1, -1, 1, 0.0, 0.0);
	//drawPointsSet(MatrixLARGE, SIZE_LARGE, SIZE_LARGE, 0, SIZE_LARGE);
	drawFunctionSet(polinomes_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]polinomes_LARGE[i];
	delete[]polinomes_LARGE;
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]Matrix[i];
	delete[]Matrix;
	//delete[]x_LARGE;
}


void RenderPoints(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	//string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";

	double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glOrtho(0, 1, -1, 1, 0.0, 0.0);
	drawPointsSet(MatrixLARGE, SIZE_LARGE, SIZE_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
}

