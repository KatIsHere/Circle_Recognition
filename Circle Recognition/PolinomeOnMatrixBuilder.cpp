#pragma OPENCL EXTENSION cl_intel_printf : enable
#include <string>
#include <iostream>
#include "InterpolationAndApproximation.h"
#include "Polinoms.h"
#include <ctime>
#include "Features.h"

double* normalizePolinoms(double** vectorSet, const int& vectorCount, const int& vectorSize, std::string norm = "avarage") {
	int i, j;
	double* normalizedPol = new double[vectorSize];
	if (norm == "avarage") {
		double suma;
		for (j = 0; j < vectorSize; ++j) {
			suma = 0.;
			for (i = 0; i < vectorCount; ++i) {
				suma += vectorSet[i][j];
			}
			normalizedPol[j] = suma / vectorCount;
		}
	}
	return normalizedPol;
}

double* X_Set(const int& vectorSize, const int& start = 0) {
	double* xset = new double[vectorSize];
	for (int i = 0; i < vectorSize; ++i)
		xset[i] = i + start;
	return xset;
}


double* choseSubvector(double* vector, const int& vectorSize, const int& start, const int& finish) {
	if (start > vectorSize || finish > vectorSize || start > finish)
		throw "Invalid Argument";
	double* subVector = new double[finish - start];
	for (int i = start; i < finish; ++i)
		subVector[i - start] = vector[i];
	return subVector;
}


double** create_approx_polinomes(double* xSet, double **matrix, const int& hight, const int& width, const int& polinome_power) {
	double** polinomes = new double*[hight];
	for (int i = 0; i < hight; ++i) {
		polinomes[i] = new double[polinome_power];
		polinomes[i] = approximation_polinome(xSet, matrix[i], width, polinome_power);
	}
	return polinomes;
}


double** PolinomeSetValues(double*x, double** PolinomeCoefs, const int& height, 
	const int& N, const int& dots) {
	// PLOTS A SET OF POLINOMES OF POWER N ON ONE GRAPH
	int i, j;
	//double* x = xCreateSet(xFrom, xTo, dots);
	double** fx = new double*[height];
	for (i = 0; i < height; ++i) {
		fx[i] = new double[dots];
		for (j = 0; j < dots; ++j) {
			fx[i][j] = function_from_coefs(x[j], PolinomeCoefs[i], N);
		}
	}

	return fx;
}


double** PolinomeSetValues_array(double*x, double* PolinomeCoefs, const int& height, const int& N, const int& dots) {
	// PLOTS A SET OF POLINOMES OF POWER N ON ONE GRAPH
	int i, j;
	double** fx = new double*[height];
	for (i = 0; i < height; ++i) {
		fx[i] = new double[dots];
		for (j = 0; j < dots; ++j) {
			fx[i][j] = Polinome_Power_array(x[j], PolinomeCoefs, N, i);
		}
	}
	return fx;
}


double* xCreateSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	float h = float(finish - start) / (N - 1);
	double* x = new double[N];
	for (int i = 0; i < N; ++i) {
		x[i] = start + h * i;
	}
	return x;
}


double** ReverseMatrix(double** matr, const int& hight, const int& wigth) {
	double** matrRev = new double*[wigth];
	for (int i = 0; i < wigth; ++i) {
		matrRev[i] = new double[hight];
		for (int j = 0; j < hight; ++j) {
			matrRev[i][j] = matr[j][i];
		}
	}
	return matrRev;
}



/*
* Builds a set of approximation polinomes on a matrix --- one polinome per a row
* Counts computational time, and prints it, if (printTime == true)
* Returns a matrix of polinome coeficients
*/
double** buidPolinome(double* x, double** Matrix, const int& height, const int& width, const int& power, bool printTime) {
	clock_t begin = clock();
	double** polinomes = create_approx_polinomes(x, Matrix, height, width, power);
	clock_t end = clock();
	double time = 0;
	if (printTime) {
		time = (float)(end - begin) / CLOCKS_PER_SEC;
		std::cout << "\n ELAPCED TIME: " << time << "\n";
	}

	return polinomes;
}