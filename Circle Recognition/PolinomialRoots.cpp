#pragma once
#include <cmath>
#include "Polinoms.h"
// -------------------------------------------------------------------------------------------------------------
// ROOT FINDING ALGORYTHMS

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
*  Basic method for root finding
*  Repeatedly bisects an interval and then selects a subinterval
*  in which a root must lie for further processing
*  Compared to Newton it's slow
*/
double BisectionMethod(int power, double edgeNegativ, double edgePositiv, double *coefs, const double& Eps)
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
	while (x != edgeNegativ && x != edgePositiv /*(edgePositiv - edgeNegativ) >= Eps*/) {
		if (Polinome(x, coefs, power)<0)
			edgeNegativ = x;
		else
			edgePositiv = x;
		x = 0.5*(edgeNegativ + edgePositiv);
	}
	return x;
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



void findRootOnSegment(int iteration,  double **A, double **B, int *currentRootsCount)
{
	
	double major = 0;
	for (int i = 0; i<iteration; i++)
	{
		double s = abs(A[iteration][i]);
		if (s>major)major = s;
	}
	major += 1.0;

	currentRootsCount[iteration] = 0; 
	for (int i = 0; i <= currentRootsCount[iteration - 1]; i++)
	{
	 //signLeft signRight - знаки текущего A-полинома на левой и правой границе интервала монотонности
		int signLeft, signRight;

		//предварительная левая и правая границы интервала поиска
		double edgeLeft, edgeRight;

		//границы интервала монотонности, несущие информацию о знаке полинома на них
		double edgeNegativ, edgePositiv;

		//формирование левой границы поиска
		if (i == 0)edgeLeft = -major;
		else edgeLeft = B[iteration - 1][i - 1];

		//значение текущего A-полинома на левой границе
		//double rb = Polinome(edgeLeft, A[iteration], iteration);

		double rb = Polinome(edgeLeft, A[iteration], iteration);

		if (rb < 0.000001)
		{//маловероятный случай попадания в корень
			B[iteration][currentRootsCount[iteration]] = edgeLeft;
			currentRootsCount[iteration]++;
			continue;
		}//маловероятный случай попадания в корень

		 //запомнить знак текущего A-полинома на левой границе
		if (rb>0)
			signLeft = 1;
		else
			signLeft = -1;

		//формирование правой границы поиска
		if (i == currentRootsCount[iteration - 1])
			edgeRight = major;
		else
			edgeRight = B[iteration - 1][i];

		//значение текущего A-полинома на правой границе
		//rb = Polinome(edgeRight, A[iteration], iteration);
		rb = Polinome(edgeRight, A[iteration], iteration);

		if (rb < 0.000001)
		{//маловероятный случай попадания в корень
			B[iteration][currentRootsCount[iteration]] = edgeRight;
			currentRootsCount[iteration]++;
			continue;
		}//маловероятный случай попадания в корень

		 //запомнить знак текущего A-полинома на правой границе
		if (rb>0)
			signRight = 1;
		else
			signRight = -1;

		//если знаки полинома на границах интервала монотонности совпадают,
		//то корня нет
		if (signLeft == signRight)
			continue;

		//теперь можно определить плюс границу и минус границу поиска корня
		if (signLeft<0) {
			edgeNegativ = edgeLeft; edgePositiv = edgeRight;
		}
		else {
			edgeNegativ = edgeRight; edgePositiv = edgeLeft;
		}

		//всё готово для локализации корня методом деления пополам интервала поиска
		B[iteration][currentRootsCount[iteration]] = NewtonMethod(A[iteration], iteration, edgeNegativ, edgePositiv);
			///BisectionMethod(iteration, edgeNegativ, edgePositiv, A[iteration], 0.000001);
		currentRootsCount[iteration]++;
	}
	return;
}


// Function finds all roots of a polinome, if they are real
void polynomRealRoots(int n, double *coefs, double *rootsArray, int &rootsCount)
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

	int *currentRootsCount = new int[n + 1];

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

	currentRootsCount[1] = 1;
	B[1][0] = -A[1][0];
	
	for (int i = 2; i <= n; i++)
		findRootOnSegment(i, A, B, currentRootsCount);

	// Resoult reading
	rootsCount = currentRootsCount[n];
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
	delete[]currentRootsCount;
	return;
}
