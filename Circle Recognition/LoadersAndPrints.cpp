#include <string>
#include <iostream>
#include <fstream>
#include "CL/cl.hpp"
#include "LoaderAndPrinter.h"
#include "Features.h"
#include <vector>
using namespace std;


void printVectorScreen(double* arr, const int& size, string type) {
	// TYPE: can be vector, polinome
	for (int i = 0; i < size - 1; ++i)
		if (type == "vector")
			cout << arr[i] << ", ";
		else if (type == "polinome")
			cout << "x**" << i << "*(" << arr[i] << ") + ";
	if (type == "vector")
		cout << arr[size - 1];
	else if (type == "polinome")
		cout << "x**" << size - 1 << "*(" << arr[size - 1] << ")";
}

void printVectorScreen(const double * arr, const int & size)
{
	for (int i = 0; i < size; ++i)
		cout << arr[i] << ", ";
}

void printVectorScreen(const vector<double>& vec) {
	for (int i = 0; i < vec.size(); ++i)
		cout << vec[i] << ", ";
}

void printVectorScreen(const vector<float>& vec) {
	for (int i = 0; i < vec.size(); ++i)
		printf("%.10g, ", vec[i]);
}

void printVectorScreen(const float * arr, const int & size)
{
	for (int i = 0; i < size; ++i)
		cout << arr[i] << ", ";
}

void printVectorPresigion(const float * arr, const int & size) {
	for (int i = 0; i < size; ++i)
		printf("%.10g, ",arr[i]);
}


void printMatrixScreen(double** matr, const int& height, const int& width, string typePrint, bool one_function) {
	cout << "\n";
	for (int i = 0; i < height; ++i) {
		if (one_function)
			cout << "\tif i == " << i << ":\n \t\treturn ";
		printVectorScreen(matr[i], width, typePrint);
		cout << "\n";
	}
}





double** loadMatrix(string filename, const int& height, const int& width) {
	ifstream in(filename);
	if (!in) {
		throw "Couldn't open the file";
	}
	int i, j;
	double** matr = new double*[height];
	for (i = 0; i < height; ++i) {
		matr[i] = new double[width];
		for (j = 0; j < width; ++j)
			in >> matr[i][j];
	}
	in.close();
	return matr;
}


double* loadMatrix_ToVector(string filename, const int& height, const int& width) {
	ifstream in(filename);
	if (!in) {
		throw "Couldn't open the file";
	}
	int i, size = height * width;
	double* Vect = new double[size];
	for (i = 0; i < size; ++i) {
		in >> Vect[i];
	}

	return Vect;
}


cl_float* cl_loadFunc(const int& height, const int& width, string filename) {
	ifstream in(filename);
	if (!in) {
		throw "Couldn't open the file";
	}
	int i, size = height * width;
	cl_float* Vect = new cl_float[size];
	for (i = 0; i < size; ++i) {
		in >> Vect[i];
	}

	return Vect;
}


