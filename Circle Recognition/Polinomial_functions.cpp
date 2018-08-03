#include <cmath>
#include <string>
#include <unordered_set>
#include "Features.h"
#include <vector>
#include <algorithm>

// -------------------------------------------------------------------------------------------------------------
// SOME POLINOME FUNCTIONS

// Faster polinome functions 
double Polinome_4(double x, double c0, double c1, double c2, double c3, double c4) {
	return c0 + c1 * x + c2 * x*x + c3 * x*x*x + c4 * x*x*x*x;
}

double Polinome_3(double x, double c0, double c1, double c2, double c3) {
	return c0 + c1 * x + c2 * x*x + c3 * x*x*x;
}

double Polinome_2(double x, double c0, double c1, double c2) {
	return c0 + c1 * x + c2 * x*x;
}

// Chebishow polinomes 
double discrete_Chebishow_1(double x, const int& setSize) {
	return 1 - 2 * x / setSize;
}

double discrete_Chebishow_2(double x, const int& setSize) {
	return 1 - 6 * x / setSize - 6 * x*x / (setSize*(setSize - 1));
}

double discrete_Chebishow_3(double x, const int& setSize) {
	return 10 / (3 * (setSize - 2)) * ((setSize / 2 - x)*(1 - 6 * x / setSize - 
				6 * x*x / (setSize*(setSize - 1))) - (setSize + 3) / 5 * (1 - 2 * x / setSize));
}

double discrete_Chebishow_4(double x, const int& setSize) {
	return 7 / (2 * (setSize - 3)) * ((setSize / 2 - x)*discrete_Chebishow_3(x, setSize) - 
			3 * (setSize + 4) / 14 * (1 - 6 * x / setSize - 6 * x*x / (setSize*(setSize - 1))));
}

double discrete_Chebishow_5(double x, const int& setSize) {
	return 18 / (5 * (setSize - 4))*((setSize / 2 - x)* discrete_Chebishow_4(x, setSize) - 
										2 * (setSize + 5) / 9 * discrete_Chebishow_3(x, setSize));
}

double Polinome_Chebishow(double x, const int& SetSize, const int& power) {
	switch (power)
	{
	case 0:
		return 1;
		break;
	case 1:
		return discrete_Chebishow_1(x, SetSize);
		break;
	case 2:
		return discrete_Chebishow_2(x, SetSize);
		break;
	case 3:
		return discrete_Chebishow_3(x, SetSize);
		break;
	case 4:
		return discrete_Chebishow_4(x, SetSize);
		break;
	case 5:
		return discrete_Chebishow_5(x, SetSize);
		break;
	default:
		return 0;
		break;
	}
}

// Returns polinome of a given power
double Polinome_Power(double x, double* coefSet, const int& power) {
	double suma = 0.;
	for (int i = 0; i < power; ++i) {
		suma += coefSet[i] * pow(x, i);						// 1 KERNEL
	}
	return suma;
}

double Polinome_Power_array(double x, double* coefSet, const int& power, const int& j) {
	double suma = 0.;
	for (int i = 0; i < power; ++i) {
		suma += coefSet[power*j + i] * pow(x, i);						// 1 KERNEL
	}
	return suma;
}

double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome") {
	double sum = 0.;
	if (func == "polinome") {
		return Polinome_Power(x, coefs, N_power);
	}
	else if (func == "exp") {
		for (int i = 0; i < N_power; ++i)
			sum += coefs[i] * (exp(-i * x) + exp(i*x));
	}
	return sum;
}


// -------------------------------------------------------------------------------------------------------------
// SCALAR FUNCTION MULTIPLICATION
double scalarMult(double &f1(double &), double &f2(double&), double * xSet, const int& setSize) {
	double suma = 0.;
	int i;
	for (i = 0; i < setSize; ++i) {
		suma += f1(xSet[i])*f2(xSet[i]);
	}
	return suma;
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
// ROOT FINDING ALGORYTHMS

// Finding an exact root in cubic polinomial equation 
double Kardano_Solve(double p, double q) {
	double Q = (p*p*p) / 27 + (q*q) / 4;
	if (Q < 0)
		throw "Complex solutions";
	double sqrtQ = sqrt(Q);
	double alfa = cbrt(-q / 2 + sqrtQ);
	double beta = cbrt(-q / 2 - sqrtQ);
	return alfa + beta;
}

double Cubic_Solve(double a, double b, double c, double d) {
	/*
	* Finds all real solutions for a cubic polinome equation
	*/
	double p = (3 * a*c - b * b) / (3 * a*a);
	double q = (2 * b*b*b - 9 * a*b*c + 27 * a*a*d) / (27 * a*a*a);
	double y = Kardano_Solve(p, q) - b / (3 * a);
	return y;
}


double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps = 0.00001) {
	/*
	* A root-finding algorithm used for functions of one real variable 
	* with a continuous second derivative
	* has ~cubic speed
	*/
	double* FirstDerivative = polinome_derivative(coefs, N);
	double* SecondDerivative = polinome_derivative(FirstDerivative, N - 1);

	double x0 = start, res, polinome = Polinome_Power(x0, coefs, N), firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	bool stop = false;
	while ((abs(polinome) >= Eps)) {
		stop = abs(polinome) >= Eps;
		res = polinome / firstDer;
		x0 = x0 - res / (1 - res * Polinome_Power(x0, SecondDerivative, N - 2) / (2 * firstDer));
		polinome = Polinome_Power(x0, coefs, N);
		firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	}

	delete[]FirstDerivative; delete[]SecondDerivative;
	return x0;
}


double NewtonMethod(double* coefs, const int& N, const double& start, 
		const double& finish, const double& Eps = 0.000001) {
	/*
	* A method for finding approximations to the roots of a real-valued function
	* one of the fastests methods for root finding
	*/
	double* FirstDerivative = polinome_derivative(coefs, N);
	double x0 = start, res, polinome = Polinome_Power(x0, coefs, N), 
							firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	while (abs(polinome) >= Eps) {								// 3 KERNEL
		res = polinome / firstDer;
		x0 = x0 - res;
		//x0 = (finish - x0 > 0) ? x0 : finish - 0.1;//(start + finish) / 2;
		polinome = Polinome_Power(x0, coefs, N);
		firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	}
	delete[]FirstDerivative;
	return x0;
}


// FINDING ALL ROOTS IN A POLINOME
std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b) {
	std::unordered_set<double> roots;
	double h = (b - a) / (N - 1);
	double res, start = a;//+ (b - a) / (N - 1);
	int i = 0;
	while (i < N) {
		res = NewtonMethod(coefs, N, start, b);
		i = i + (roots.find(res) == roots.end());				// 4 KERNEL
		roots.insert(res);
		start = start + h;								// 5 KERNEL
	}
	return roots;
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


// Find all extremums and create fatures
void findExtremums_and_features(double** polinomes, /*double* centerX, double* centerY,*/ double** extrems, double** extremsValues,
	const int& height, const int& N, const double& xFrom, const double& xTo, 
	double& extrem_max, double& extrem_min, int& k_min, int& k_max) {
	// Finding all exteme values of the polinomes
	// On extreme values feathures can be build
	double max_Y = -std::numeric_limits<double>::infinity(), min_Y = std::numeric_limits<double>::infinity();
	double maxF, minF;
	for (int i = 0; i < height; ++i) {
		extrems[i] = findExtrems(polinomes[i], N, xFrom + 0.01, xTo);
		extremsValues[i] = new double[N - 1];
		for (int j = 0; j < N - 1; ++j) {
			extremsValues[i][j] = Polinome_Power(extrems[i][j], polinomes[i], N);
			if (extremsValues[i][j] > max_Y) {
				k_max = i;
				extrem_max = extremsValues[i][j];
			}
			if (extremsValues[i][j] < min_Y){
				k_min = i;
				extrem_min = extremsValues[i][j];
			}
		}
	}


}
