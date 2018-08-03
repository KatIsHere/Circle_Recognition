#pragma once
#include <cmath>


struct Point {
	double x = 0;
	double y = 0;
	double distance(Point b) {
		//eiler norm
		return sqrt((x - b.x)*(x - b.x) + (y - b.y)*(y - b.y));
	}
	Point& operator=(Point b) {
		x = b.x; y = b.y;
		return *this;
	}
};


/* 
* Creates a set of common features from an array of polinomes(polinome extreme points)
*/
class Features {
public:
	Features() {
		distancesNumb = 0;
		anglesNumb = 0;
		N = 0;
		extremums = nullptr; 
		angles = nullptr;
		distances = nullptr;
	}

	Features(double* xExtr, double* yExtr, const int& len) {
		N = len;
		extremums = new Point[len];
		for (int i = 0; i < len; i++) {
			extremums[i].x = xExtr[i];
			extremums[i].y = yExtr[i];
		}
		distancesNumb = len - 1;
		anglesNumb = int(len + 1) / 2;

		distances = Distances();
		angles = Angles();
		center = Center();
	}


	Features(Point* extr, const int& len) {
		setValues(extr, len);
	}

	Features(double* distance, float* angle, const int&len, double x_center, double y_center) {
		N = len;
		extremums = new Point[len];
		distancesNumb = len - 1;
		anglesNumb = int(len + 1) / 2;
		distances = distance;
		angles = angle;
		center.x = x_center; center.y = y_center;
	}

	void setValues(Point* extr, const int& len) {
		N = len;
		extremums = new Point[len];
		for (int i = 0; i < len; i++)
			extremums[i] = extr[i];
		distancesNumb = len - 1;
		anglesNumb = int(len + 1) / 2;

		distances = Distances();
		angles = Angles();
		center = Center();
	}

	const int& getLen() {
		return N;
	}

	Point* getExtrems() {
		return extremums;
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

	const float* getAngles() {
		return angles;
	}

	const int anglNumb() {
		return anglesNumb;
	}

	Features& operator=(Features other_feature) {
		setValues(other_feature.getExtrems(), other_feature.getLen());
		return *this;
	}

	~Features(){
		delete[]extremums;
		delete[]angles;
		delete[]distances;
	}

private:
	int N;
	int anglesNumb;
	float* angles;
	int distancesNumb;
	double* distances;
	Point center;
	Point* extremums;


	double* Distances() {
		double* Distance = new double[distancesNumb];
		for (int i = 0; i < distancesNumb; i++)	{
			Distance[i] = extremums[i].distance(extremums[i + 1]);
		}
		return Distance;
	}


	float* Angles() {
		/* returns cos of all ancgles
		* based on law of cosines: cos C = (a**2 + b**2 - c**2)/(2ab)
		* the BIGGER the meaning ----> the SMALLER the angle
		* angle from 0 to pi
		*/
		float* Angles = new float[anglesNumb];
		for (int i = 0; i < anglesNumb; ++i) {
			Angles[i] = (distances[i] * distances[i] + distances[i + 1] * distances[i + 1] - 
				extremums[i].distance(extremums[i + 2]))/(2* distances[i]* distances[i+1]);
		}
		return Angles;
	}


	Point Center() {
		Point P;
		P.x = (extremums[N - 1].x + extremums[0].x) / 2;
		double sum = 0;
		for (int i = 0; i < N; ++i) {
			sum += extremums[i].y;
		}
		P.y = sum;
		return P;
	}
};


// TODO: add center comparation
/*
* Some of the features that define the object
*/
class Object_Features {
public:
		// Ways to compare two polinomes:
		// can compare only two rows of matrixes(with local max and local min)
		// when we have these two: compare angles, and distances (probably with some deviation)
		// can use probability: 60% for angles and 40% for distances
		// Extrems consists of two polinomes: with local min and local max
	Object_Features(double* x_max_pol, double* y_max_poli, double* x_min_pol, double* y_min_poli, const int& power, 
		double local_max, double local_min) {
		max_polinome = Features(x_max_pol, y_max_poli, power);
		min_polinome = Features(x_min_pol, y_min_poli, power);
		angles_n = max_polinome.anglNumb();
		dist_n = max_polinome.distNumb();
		_local_max = local_max; _local_min = local_min;
	}

	Object_Features(const Features& max_poli, const Features& min_poli) {
		max_polinome = max_poli;
		min_polinome = min_poli;
		angles_n = max_polinome.anglNumb();
		dist_n = max_polinome.distNumb();
	}

	// returns probability of angles similarity
	float compareAngles(Object_Features obj_2, const float Eps = 0.1) {
		int h = 0;
		const float * angles_max_2 = obj_2.max_polinome.getAngles();
		const float* angles_min_2 = obj_2.min_polinome.getAngles();
		const float* angles_max = max_polinome.getAngles();
		const float* angles_min = min_polinome.getAngles();
		for (int i = 0; i < angles_n; ++i) {
			if (abs(angles_max_2[i] - angles_max[i]) < Eps)
				h++;
			if (abs(angles_min[i] - angles_min_2[i]) < Eps)
				h++;
		}

		delete[]angles_max_2; delete[]angles_min_2;
		delete[] angles_max; delete[]angles_min;
		return (float)h / (2 * angles_n);
	}

	// returns probability of distanses similarity
	float compareDistances(Object_Features obj_2, const float Eps = 0.1) {
		int h = 0;
		const double * dist_max_2 = obj_2.max_polinome.getDistances();
		const double* dist_min_2 = obj_2.min_polinome.getDistances();
		const double* dist_max = max_polinome.getDistances();
		const double* dist_min = min_polinome.getDistances();
		for (int i = 0; i < dist_n; ++i) {
			if (abs(dist_max_2[i] - dist_max[i]) < Eps)
				h++;
			if (abs(dist_min_2[i] - dist_min[i]) < Eps)
				h++;
		}

		delete[]dist_max_2; delete[]dist_min_2;
		delete[] dist_max; delete[]dist_min;
		return (float)h / (2 * dist_n);
	}


	bool small_obj(const double& threshold_max, const double& threshold_min) {
		return (_local_max < threshold_max && _local_min > threshold_min);
	}


	bool operator==(const Object_Features& obj_2) {
		double percentage = 0;
	}


	Features getMax_Polinome() {
		return max_polinome;
	}


	Features getMin_Polinome() {
		return min_polinome;
	}

private:
	Features max_polinome;
	Features min_polinome;
	double _local_max, _local_min;
	int angles_n;
	int dist_n;
	double _AnglesTrust = 0.6, _DistTrust = 0.4;
};