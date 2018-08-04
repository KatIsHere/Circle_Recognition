#pragma once
#include <cmath>
#include "Polinoms.h"
// -------------------------------------------------------------------------------------------------------------
// ROOT FINDING ALGORYTHMS
double polinome_fast(double x, double* coefSet, const int& power);
/*
* A root-finding algorithm used for functions of one real variable
* with a continuous second derivative
* has ~cubic speed
*/
double HalleyMethodPolinome(double* coefs, const int& N, const double&start, const double& Eps ) {

	double* FirstDerivative = polinome_derivative(coefs, N);
	double* SecondDerivative = polinome_derivative(FirstDerivative, N - 1);

	double x0 = start, res, polinome = Polinome(x0, coefs, N), firstDer = Polinome(x0, FirstDerivative, N - 1);
	bool stop = false;
	while ((abs(polinome) >= Eps)) {
		stop = abs(polinome) >= Eps;
		res = polinome / firstDer;
		x0 = x0 - res / (1 - res * Polinome(x0, SecondDerivative, N - 2) / (2 * firstDer));
		polinome = Polinome(x0, coefs, N);
		firstDer = Polinome(x0, FirstDerivative, N - 1);
	}

	delete[]FirstDerivative; delete[]SecondDerivative;
	return x0;
}


/*
* A method for finding approximations to the roots of a real-valued function
* one of the fastests methods for root finding
*/
double NewtonMethod(double* coefs, const int& N, const double& start,
	const double& finish, const double& Eps) {
	double* FirstDerivative = polinome_derivative(coefs, N);
	double x0 = 0.5*(finish - start), res, polinome = Polinome(x0, coefs, N),
		firstDer = Polinome(x0, FirstDerivative, N - 1);
	while (abs(polinome) >= Eps) {
		res = polinome / firstDer;
		x0 = x0 - res;
		polinome = Polinome(x0, coefs, N);
		firstDer = Polinome(x0, FirstDerivative, N - 1);
	}
	delete[]FirstDerivative;
	return x0;
}


/*
*  Bisection method for normalized polinome
*/
double BisectionMethod_Fast(int power, double edgeNegativ, double edgePositiv, double *coefs, const double& Eps)
{
	//double x = 0.5 * (edgeNegativ + edgePositiv);
	//double polinome = Polinome(x, coefs, power);
	//while (polinome >= Eps)
	//{
	//	if (polinome < 0)
	//		edgeNegativ = x;
	//	else
	//		edgePositiv = x;
	//	x = 0.5 * (edgeNegativ + edgePositiv);
	//	polinome = Polinome(x, coefs, power);
	//}
	//return x;
	double x = 0.5*(edgeNegativ + edgePositiv);
	while (abs(edgePositiv - edgeNegativ) >= Eps) {
		if (/*Polinome(x, coefs, power) < 0*/ polinome_fast(x, coefs, power) < 0)
			edgeNegativ = x;
		else
			edgePositiv = x;
		x = 0.5*(edgeNegativ + edgePositiv);
	}
	return x;
}

/*
*  Basic method for root finding
*  Repeatedly bisects an interval and then selects a subinterval
*  in which a root must lie for further processing
*  Compared to Newton it's slow
*/
double BisectionMethod(int power, double edgeNegativ, double edgePositiv, double *coefs, const double& Eps)
{
	double x = 0.5*(edgeNegativ + edgePositiv);
	while (abs(edgePositiv - edgeNegativ) >= Eps) {
		if (Polinome(x, coefs, power) < 0)
			edgeNegativ = x;
		else
			edgePositiv = x;
		x = 0.5*(edgeNegativ + edgePositiv);
	}
	return x;
}

// Fast polinome calculating
double polinome_fast(double x, double* coefSet, const int& power) {
	double s = 1;
	for (int i = power - 1; i >= 0; i--)
		s = s * x + coefSet[i];
	return s;
}

// FINDING ALL ROOTS IN A POLINOME
std::unordered_set<double> SolvePolinome(double* coefs, const int& N, const double& a, const double& b) {
	std::unordered_set<double> roots;
	double h = (b - a) / (N - 1);
	double res, start = a;//+ (b - a) / (N - 1);
	int i = 0;
	while (i < N) {
		res = NewtonMethod(coefs, N, start, b, 0.000001);
		i = i + (roots.find(res) == roots.end());				// 4 KERNEL
		roots.insert(res);
		start = start + h;								// 5 KERNEL
	}
	return roots;
}


void findRootIteration(int iteration, double **A, double **B, int *RootsCount)
{	
	// current signs of polinome on left and right edges
	int signLeft, signRight;

	// left and right edges
	double edgeLeft, edgeRight;

	//	edges of the segment
	double edgeNegativ, edgePositiv;

	double major = 0; double root;
	for (int i = 0; i < iteration; i++)
	{
		double s = abs(A[iteration][i]);
		if (s > major)
			major = s;
	}
	major += 1.0;

	RootsCount[iteration] = 0; 
	for (int i = 0; i <= RootsCount[iteration - 1]; i++)
	{
		// creating left and right edges
		if (i == 0)
			edgeLeft = -major;
		else 
			edgeLeft = B[iteration - 1][i - 1];

		root = polinome_fast(edgeLeft, A[iteration], iteration);

		// check if root found
		if (abs(root) < 0.000001){
			B[iteration][RootsCount[iteration]] = edgeLeft;
			RootsCount[iteration]++;
			continue;
		}

		if (root > 0)
			signLeft = 1;
		else
			signLeft = -1;

		if (i == RootsCount[iteration - 1])
			edgeRight = major;
		else
			edgeRight = B[iteration - 1][i];

		root = polinome_fast(edgeRight, A[iteration], iteration);

		// check if root found
		if (abs(root) < 0.000001){
			B[iteration][RootsCount[iteration]] = edgeRight;
			RootsCount[iteration]++;
			continue;
		}

		if (root > 0)
			signRight = 1;
		else
			signRight = -1;

		// if signs on edges are the same, no root present
		if (signLeft == signRight)
			continue;

		// can create edges
		if (signLeft < 0) {
			edgeNegativ = edgeLeft; edgePositiv = edgeRight;
		}
		else {
			edgeNegativ = edgeRight; edgePositiv = edgeLeft;
		}

		// find root with root-finding methods
		// B[iteration][RootsCount[iteration]] = NewtonMethod(A[iteration], iteration, edgeNegativ, edgePositiv, 0.00001);
		root = BisectionMethod_Fast(iteration, edgeNegativ, edgePositiv, A[iteration], 0.0000001);
		if (abs(root) < 0.0001)
			B[iteration][RootsCount[iteration]] = root;
		B[iteration][RootsCount[iteration]] = root;
		RootsCount[iteration]++;
	}
	return;
}

void findRootIterationOnSegment(int iteration, double **A, double **B, int *RootsCount, const double& start, const double& finish)
{
	// current signs of polinome on left and right edges
	int signLeft, signRight;

	// left and right edges
	double edgeLeft, edgeRight;

	//	edges of the segment
	double edgeNegativ, edgePositiv;
	double root;

	RootsCount[iteration] = 0;
	for (int i = 0; i <= RootsCount[iteration - 1]; i++)
	{
		// creating left and right edges
		if (i == 0)
			edgeLeft = start;
		else
			edgeLeft = B[iteration - 1][i - 1];

		root = polinome_fast(edgeLeft, A[iteration], iteration);

		// check if root found
		if (abs(root) < 0.000001) {
			B[iteration][RootsCount[iteration]] = edgeLeft;
			RootsCount[iteration]++;
			continue;
		}

		if (root > 0)
			signLeft = 1;
		else
			signLeft = -1;

		if (i == RootsCount[iteration - 1])
			edgeRight = finish;
		else
			edgeRight = B[iteration - 1][i];

		root = polinome_fast(edgeRight, A[iteration], iteration);

		// check if root found
		if (abs(root) < 0.000001) {
			B[iteration][RootsCount[iteration]] = edgeRight;
			RootsCount[iteration]++;
			continue;
		}

		if (root > 0)
			signRight = 1;
		else
			signRight = -1;

		// if signs on edges are the same, no root present
		if (signLeft == signRight)
			continue;

		// can create edges
		if (signLeft < 0) {
			edgeNegativ = edgeLeft; edgePositiv = edgeRight;
		}
		else {
			edgeNegativ = edgeRight; edgePositiv = edgeLeft;
		}

		// find root with root-finding methods
		// B[iteration][RootsCount[iteration]] = NewtonMethod(A[iteration], iteration, edgeNegativ, edgePositiv, 0.00001);
		root = BisectionMethod_Fast(iteration, edgeNegativ, edgePositiv, A[iteration], 0.0000001);
		if (root >= start && root <= finish) {
			B[iteration][RootsCount[iteration]] = root;
			RootsCount[iteration]++;
		}
	}
	return;
}

// Function finds all roots of a polinome, if they are real
void polynomRealRoots(int n, double *coefs, double *rootsArray, int &rootsCount, const double& start, const double& finish)
{
	//используются вспомогательные массивы A и B, имеющие следующее содержание
	//A это коэффициенты а B корни производных полиномов
	//все A-полиномы нормируются так,
	//чтобы коэффициент при старшей степени был равен единице
	//A[n] - это массив нормированных коэффициентов исходного полинома
	//B[n] - это массив корней исходного полинома
	//A[n-1] - это массив нормированных коэффициентов производного полинома
	//B[n-1] - это массив корней производного полинома
	//аналогичным образом
	//A[n-2] и B[n-2] - это коэффициенты и корни дважды производного полинома
	//наконец A[1] - это массив коэффициентов последнего полинома
	//в цепочке производных полиномов
	//это линейный полином и B[1] - это массив его корней,
	//представленный единственным значимым элементом

	double **A = new double *[n + 1];
	double **B = new double *[n + 1];

	int *RootsCount = new int[n + 1];

	for (int i = 1; i <= n; i++)
	{
		A[i] = new double[i];
		B[i] = new double[i];
	}

	// normalizing the polinome to: x^n + c[n - 1]*x^{n -1}.....
	for (int i = 0; i<n; i++)
		A[n][i] = coefs[i] / coefs[n];

	// calculating derivatives											// DERIVATIVE
	for (int i1 = n, i = n - 1; i>0; i1 = i, i--)
	{
		for (int j1 = i, j = i - 1; j >= 0; j1 = j, j--)
		{
			A[i][j] = A[i1][j1] * j1 / i1;
		}
	}

	RootsCount[1] = 1;
	B[1][0] = -A[1][0];
	
	for (int i = 2; i <= n; i++)
		findRootIterationOnSegment(i, A, B, RootsCount, start, finish);

	// Resoult reading
	rootsCount = RootsCount[n];
	for (int i = 0; i<rootsCount; i++)
		rootsArray[i] = B[n][i];

	// Deleting unneeded data
	for (int i = 1; i <= n; i++)
	{
		delete[]A[i];
		delete[]B[i];
	}
	delete[]A;
	delete[]B;
	delete[]RootsCount;
	return;
}


void FindAllRootsOnSegment(int power, double *coefs, double *rootsArray, int &rootsCount, const double& edgeLeft, const double& edgeRight, const int& segments_numb_mult) {

	int segment = segments_numb_mult * power;
	double pace = (edgeRight - edgeLeft) / segment;
	double Left = edgeLeft - pace, Right;
	double root;
	double *A = new double [power];
	double negativeEdge, positiveEdge;

	/*for (int i = 0; i < power; i++) {
		A[i] = coefs[i] / coefs[power - 1];
	}*/

	int signLeft, signRight;
	for (int i = 0, j = 0; i <= segment && j < (power - 1); ++i) {
		Left += pace; 
		Right = Left + pace;
		//root = polinome_fast(Left, A, power);
		root = Polinome(Left, coefs, power);
		if (abs(root) < 0.001) {
			rootsArray[j] = Left;
			rootsCount = j;
			j++;
			continue;
		}

		if (root > 0)
			signLeft = 1;
		else
			signLeft = -1;

		//root = polinome_fast(Right, A, power);
		root = Polinome(Right, coefs, power);
		if (abs(root) < 0.001) {
			rootsArray[j] = Right;
			rootsCount = j;
			j++;
			continue;
		}

		if (root > 0)
			signRight = 1;
		else
			signRight = -1;

		// if signs on edges are the same, no root present
		if (signLeft == signRight)
			continue;

		// can create edges
		if (signLeft < 0) {
			negativeEdge = edgeLeft; positiveEdge = edgeRight;
		}
		else {
			negativeEdge = edgeRight; positiveEdge = edgeLeft;
		}

		root = BisectionMethod(power, negativeEdge, positiveEdge, coefs, 0.0001);
		rootsArray[j] = root;
		rootsCount = j;
		j++;
	}
	delete[]A;
}