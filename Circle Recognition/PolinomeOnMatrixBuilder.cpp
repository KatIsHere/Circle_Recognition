#include <string>
#include "InterpolationAndApproximation.h"
#include "Polinoms.h"
const int SIZE_SMALL = 17;
const int SIZE_MEDDIUM = 28;
const int SIZE_LARGE = 32;
const int POLINOME_POWER = 7;
const double TOLERANCE = 0.5;

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


double** create_approx_polinomes(double* xSet, double **matrix, const int& hight, const int& width, const int& polinome_power,  std::string approximationFunc) {
	double** polinomes = new double*[hight];
	for (int i = 0; i < hight; ++i) {
		polinomes[i] = new double[polinome_power];
		polinomes[i] = approximation_coefs(xSet, matrix[i], width, polinome_power, approximationFunc, 0.1);
	}
	
	delete[]xSet;
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


double* xCreateSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	double h = double(finish - start) / (N - 1);
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


//double* createClass(string filepath, const int& imgNumb, string filenamePattern, const int& matrHight, const int & matrWidth, string appox = "polinome") {
//	double ** vectors = new double*[imgNumb];
//	int vectorSize = matrHight * matrWidth;
//	double* xSet = X_Set(vectorSize);
//	double** polinoms = new double*[imgNumb];
//	int i, j;
//	for (i = 0; i < imgNumb; ++i) {
//		vectors[i] = loadMatrix_ToVector(filepath + to_string(i) + filenamePattern, matrHight, matrWidth);
//		polinoms[i] = Aproxx(xSet, vectors[i], vectorSize, appox, POLINOME_POWER + 1);
//	}
//
//	double* function = normalizePolinoms(polinoms, imgNumb, POLINOME_POWER + 1);
//	for (i = 0; i < imgNumb; ++i) {
//		delete[]vectors[i];
//		delete[]polinoms[i];
//	}
//	delete[]vectors; delete[]polinoms;
//	delete[]xSet;
//
//	return function;
//}

//double* createFunction(double** matrix, const int& matrHight, const int & matrWidth, const int& startingPoint = 0, std::string approximationFunc = "polinome") {
//	int vectorSize = matrHight * matrWidth;
//	double * vectors = new double[vectorSize];
//	vectors = loadMatrix_ToVector(filepath, matrHight, matrWidth);
//	double* xSet = X_Set(vectorSize);
//	double* polinom = approximation_coefs(xSet, vectors, vectorSize, 3, approximationFunc);
//	//printVectorScreen(vectors, vectorSize);
//	delete[]xSet;
//	delete[]vectors;
//	return polinom;
//}

//double* createFunctionFromRow(std::string filepath, const int& matrHight, const int & matrWidth, const int& Row, std::string approximationFunc = "polinome") {
//	int vectorSize = matrWidth;
//	double * vectors = loadMatrix_ToVector(filepath, matrHight, matrWidth);
//	double* subvector = choseSubvector(vectors, matrHight*matrWidth, Row*matrWidth, matrWidth + Row * matrWidth);
//
//	delete[]vectors;
//
//	double* xSet = X_Set(vectorSize);
//	double* polinom = approximation_coefs(xSet, subvector, vectorSize, POLINOME_POWER, approximationFunc);
//	//printVectorScreen(subvector, vectorSize);
//	delete[]xSet;
//	delete[]subvector;
//	return polinom;
//}