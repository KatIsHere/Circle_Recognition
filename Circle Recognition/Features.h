#pragma once
#include <cmath>
struct Point {
	double x = 0;
	double y = 0;
	double distance(Point b) {
		//eiler norm
		return sqrt((x - b.x)*(x - b.x) + (y - b.y)*(y - b.y));
	}
	Point operator=(Point b) {
		x = b.x; y = b.y;
		return *this;
	}
};


class Features {
public:
	Features(Point* extr, const int& len) {
		N = len;
		extrems = new Point[len];
		for (int i = 0; i < len; i++)
			extrems[i] = extr[i];
		distancesNumb = len - 1;
		anglesNumb = int(len + 1) / 2;

		distances = Distances();
		angles = Angles();
		center = Center();
	}


	const Point getCenter() {
		return center;
	}

	const double* getDistances() {
		return distances;
	}

	const int distNumb() {
		return distancesNumb;
	}

	const double* getAngles() {
		return angles;
	}

	const int anglNumb() {
		return anglesNumb;
	}

private:
	Point * extrems;
	int N;
	int anglesNumb;
	double* angles;
	int distancesNumb;
	double* distances;
	Point center;


	double* Distances() {
		double* Distance = new double[distancesNumb];
		for (int i = 0; i < distancesNumb; i++)	{
			Distance[i] = extrems[i].distance(extrems[i + 1]);
		}
		return Distance;
	}


	double* Angles() {
		// returns cos of all ancgles
		// based on law of cosines: cos C = (a**2 + b**2 - c**2)/(2ab)
		// the BIGGER the meaning ----> the SMALLER the angle
		// angle from 0 to pi
		double* Angles = new double[anglesNumb];
		for (int i = 0; i < anglesNumb; ++i) {
			Angles[i] = (distances[i] * distances[i] + distances[i + 1] * distances[i + 1] - 
						extrems[i].distance(extrems[i + 2]))/(2* distances[i]* distances[i+1]);
		}
		return Angles;
	}


	Point Center() {
		Point P;
		P.x = extrems[0].x + (extrems[N - 1].x - extrems[0].x);
		float sum = 0;
		for (int i = 0; i < N; ++i) {
			sum += extrems[i].y;
		}
		P.y = sum;
		return P;
	}
};