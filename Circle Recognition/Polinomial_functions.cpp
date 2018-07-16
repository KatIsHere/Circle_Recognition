#include <cmath>
#include <string>
#include <unordered_set>
//	TODO: make this a big function wich receives a 
//	set of functions and creates a new lambda function

double Polinome_4(double x, double c0, double c1, double c2, double c3, double c4) {
	return c0 + c1 * x + c2 * x*x + c3 * x*x*x + c4 * x*x*x*x;
}

double Polinome_3(double x, double c0, double c1, double c2, double c3) {
	return c0 + c1 * x + c2 * x*x + c3 * x*x*x;
}

double Polinome_2(double x, double c0, double c1, double c2) {
	return c0 + c1 * x + c2 * x*x;
}

double scalarMult(double &f1(double &), double &f2(double&), double * xSet, const int& setSize) {
	double suma = 0.;
	int i;
	for (i = 0; i < setSize; ++i) {
		suma += f1(xSet[i])*f2(xSet[i]);
	}
	return suma;
}

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
	double p = (3 * a*c - b * b) / (3 * a*a);
	double q = (2 * b*b*b - 9 * a*b*c + 27 * a*a*d) / (27 * a*a*a);
	double y = Kardano_Solve(p, q) - b / (3 * a);
	return y;
}

double discrete_Chebishow_1(double x, const int& setSize) {
	return 1 - 2 * x / setSize;
}

double discrete_Chebishow_2(double x, const int& setSize) {
	return 1 - 6 * x / setSize - 6 * x*x / (setSize*(setSize - 1));
}

double discrete_Chebishow_3(double x, const int& setSize) {
	//return 10 / (3 * (setSize - 2)) * ((setSize / 2 - x)*discrete_Chebishow_2(x, setSize) - (setSize + 3) / 5 * discrete_Chebishow_1(x, setSize));
	return 10 / (3 * (setSize - 2)) * ((setSize / 2 - x)*(1 - 6 * x / setSize - 6 * x*x / (setSize*(setSize - 1))) - (setSize + 3) / 5 * (1 - 2 * x / setSize));
}

double discrete_Chebishow_4(double x, const int& setSize) {
	return 7 / (2*(setSize - 3)) * ((setSize / 2 - x)*discrete_Chebishow_3(x, setSize) - 3 * (setSize + 4) / 14 * (1 - 6 * x / setSize - 6 * x*x / (setSize*(setSize - 1))));
}

double discrete_Chebishow_5(double x, const int& setSize) {
	return 18 / (5 * (setSize - 4))*((setSize / 2 - x)* discrete_Chebishow_4(x, setSize) - 2 * (setSize + 5) / 9 * discrete_Chebishow_3(x, setSize));
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
// TODO: write this functions in their ordinary view

double Polinome_Power(double x, double* coefSet, const int& power) {
	double suma = 0.;
	for (int i = 0; i < power; ++i) {
		suma += coefSet[i] * pow(x, i);
	}
	return suma;
}

double function_from_coefs(double x, double* coefs, const int& N_power, std::string func = "polinome") {
	double sum = 0.;
	if (func == "polinome") {
		for (int i = 0; i < N_power; ++i)
			sum += coefs[i] * pow(x, i);
	}
	else if (func == "exp") {
		for (int i = 0; i < N_power; ++i)
			sum += coefs[i] * (exp(-i * x) + exp(i*x));
	}
	return sum;
}


double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps = 0.000001) {
	double* FirstDerivative = new double[N - 1];
	double* SecondDerivative = new double[N - 2];
	for (int i = 0; i < N - 1; ++i) {
		FirstDerivative[i] = coefs[i + 1] * (i + 1);
	}
	for (int i = 0; i < N - 2; ++i) {
		SecondDerivative[i] = FirstDerivative[i + 2] * (i + 1);
	}
	double x0 = start, res, polinome = Polinome_Power(x0, coefs, N), firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	bool stop = false;
	while ((abs(polinome) >= Eps)){
		stop = abs(polinome) >= Eps;
		res = polinome / firstDer;
		x0 = x0 - res / (1 - res * Polinome_Power(x0, SecondDerivative, N - 2) / (2 * firstDer));
		polinome = Polinome_Power(x0, coefs, N);
		firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	}

	delete[]FirstDerivative; delete[]SecondDerivative;
	return x0;
}


double NewtonMethod(double* coefs, const int& N, const double&start, const double& Eps = 0.0001) {
	double* FirstDerivative = new double[N - 1];
	for (int i = 0; i < N - 1; ++i) {
		FirstDerivative[i] = coefs[i + 1] * (i + 1);
	}
	double x0 = start, res, polinome = Polinome_Power(x0, coefs, N), firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	while (abs(polinome) >= Eps) {
		res = polinome / firstDer;
		x0 = x0 - res ;
		polinome = Polinome_Power(x0, coefs, N);
		firstDer = Polinome_Power(x0, FirstDerivative, N - 1);
	}
	delete[]FirstDerivative; 
	return x0;
}


std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b) {
	std::unordered_set<double> roots;
	double start = a + (b - a) / (N + 1), res;
	int i = 0;
	while(i < N) {
		res = NewtonMethod(coefs, N, start);
		auto search = roots.find(res);
		if (search == roots.end()) {
			roots.insert(res);
			i++;
		}
		start = (start + (b - a) / (N + 1));
	}
	return roots;
}


double* findExtrems(double* coefs, const int& N, const double& a, const double& b) {
	double* newCoefs = new double[N - 1];
	double* solv = new double[N - 1];
	for (int i = 0; i < N - 1; ++i)
		newCoefs[i] = (i + 1)*coefs[i + 1];
	std::unordered_set<double> roots = SolvePolinome(newCoefs, N - 1, a, b);
	int j = 0;
	for (auto i = roots.begin(); i != roots.end(); ++i, ++j) {
		solv[j] = *(i);
	}
	return solv;
}

// AN ARRAY OF FUNCTION POINTERS
//typedef double(*DoubleFunctionWithOneParameter) (double a);
//
//DoubleFunctionWithOneParameter Chebishow(const int& N, const int& m) {
//	DoubleFunctionWithOneParameter* functions = new DoubleFunctionWithOneParameter[m];
//
//}