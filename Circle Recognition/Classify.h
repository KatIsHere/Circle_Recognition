#pragma once
#include "Polinoms.h"
#include <ctime>
#include "Features.h"
#include "PolinomeBuilder.h"
#include <vector>
#include "LoaderAndPrinter.h"
using namespace std;

ObjectClass parse_substring(string str, const int& power) {
	std::vector<double> extrems; std::vector<double> dists; std::vector<float> angles;
	int i = 0;
	while (str[i] != ':') i++;
	string className = str.substr(0, i);
	str.erase(0, i + 1);
	i = 0;
	double extr_count = stod(str);
	while (str[i] != ';') ++i;
	str.erase(0, i + 1);
	std::stringstream buffer(str);
	// extremums
	double extr;
	for (int k = 0; k < power - 1; ++k) {
		buffer >> extr;
		extrems.push_back(extr);
	}

	i = 0;
	while (str[i] != ';') ++i;
	str.erase(0, i + 1);
	buffer.clear();
	buffer.str(str);
	// distances
	for (int k = 0; k < power - 2; ++k) {
		buffer >> extr;
		dists.push_back(extr);
	}
	i = 0;
	while (str[i] != ';') ++i;
	str.erase(0, i + 1);
	buffer.clear();
	buffer.str(str);

	// angles
	for (int k = 0; k < power - 3; ++k) {
		buffer >> extr;
		angles.push_back(extr);
	}

	ObjectClass clas(className, extr_count, extrems, dists, angles);
	return clas;
}

std::vector<ObjectClass> Read_Classification(std::string filename, const int& power) {
	ifstream in(filename);
	vector<ObjectClass> objClasses;
	std::stringstream buffer;
	buffer << in.rdbuf();
	in.close();
	std::string line;
	while (std::getline(buffer, line))
	{
		objClasses.push_back(parse_substring(line, power));
	}
	return objClasses;
}


float* Classify(const Object_Features& obj, vector<ObjectClass> classes) {
	float* possibilities = new float[classes.size()];
	int j = 0;
	for (auto i : classes) {
		possibilities[j] = i.belongs(obj);
		++j;
	}
	printVectorScreen(possibilities, classes.size());
	return possibilities;
}



// Find all extremums and calculate features
Object_Features findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
	int* sizes,
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
	
	return features;
}



inline void Calculate(double* polinomes, const int& height, const int& N, const double& xFrom, const double& xTo,
	const int& classNumb,
	AvarageMeaninig& Avar, vector<ObjectClass> possibleClasses) {
	double** extrems = new double*[height];
	double** extremsValues = new double*[height];

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
	Object_Features features = findExtremums_and_features(polinomes_new, extrems, extremsValues, extrNumb, height, N, xFrom, xTo, max_Y, min_Y, pos_min, pos_max);

	float* possibilities = new float[possibleClasses.size()]; 
	possibilities = Classify(features, possibleClasses);
	Avar.add_features(features);
	//const clock_t finish = clock();
	for (int i = 0; i < height; ++i) {
		delete[]extrems[i]; delete[]extremsValues[i];
		delete[]polinomes_new[i];
	}
	delete[]polinomes_new;
	delete[]extrems; delete[]extremsValues;
	delete[]extrNumb;
}