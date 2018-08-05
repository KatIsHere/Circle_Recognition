#pragma once
#include <cmath>
#include <vector>

struct Point {
	double x = 0;
	double y = 0;
	double distance(Point b) {
		// eiler norm
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
		angles = nullptr;
		distances = nullptr;
	}


	Features(double* xExtr, double* yExtr, const int& len) {
		N = len;
		extremums.clear();
		for (int i = 0; i < len; i++) {
			Point X;
			X.x = xExtr[i];
			X.y = yExtr[i];
			extremums.push_back(X);
		}
		distancesNumb = len - 1;
		anglesNumb = len - 2;

		distances = new double[distancesNumb];
		angles = new float[anglesNumb];
		Distances(distances);
		Angles(angles);
		center = Center();
	}


	Features(std::vector<Point> extr, const int& len) {
		setValues(extr, len);
	}


	void setValues(std::vector<Point> extr, const int& len) {
		N = len;
		extremums = extr;
		distancesNumb = len - 1;
		anglesNumb = len - 2;

		distances = new double[distancesNumb];
		angles = new float[anglesNumb];
		Distances(distances);
		Angles(angles);
		center = Center();
	}


	const int& getLen() {
		return N;
	}

	std::vector<Point> getExtrems() {
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

	//~Features(){
	//	delete[]angles;
	//	delete[]distances;
	//}

private:
	int N;
	int anglesNumb;
	float* angles;
	int distancesNumb;
	double* distances;
	Point center;
	std::vector<Point> extremums;


	void Distances(double* Distance) {
		for (int i = 0; i < distancesNumb; i++)	{
			Distance[i] = extremums[i].distance(extremums[i + 1]);
		}
	}


	void Angles(float* Angles) {
		/* returns cos of all ancgles
		* based on law of cosines: cos C = (a**2 + b**2 - c**2)/(2ab)
		* the BIGGER the meaning ----> the SMALLER the angle
		* angle from 0 to pi
		*/
		float rb;
		for (int i = 0; i < anglesNumb; ++i) {
			rb = extremums[i].distance(extremums[i + 2]);
			Angles[i] = (distances[i] * distances[i] + distances[i + 1] * distances[i + 1] - rb*rb)/(2* distances[i]* distances[i+1]);
		}
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
	Object_Features(double* x_max_pol, double* y_max_poli, double* x_min_pol, double* y_min_poli, 
		const int& power_max, const int& power_min,
		double local_max, double local_min) {
		max_polinome = Features(x_max_pol, y_max_poli, power_max);
		min_polinome = Features(x_min_pol, y_min_poli, power_min);
		angles_n_max = max_polinome.anglNumb();
		dist_n_max = max_polinome.distNumb();
		angles_n_min = min_polinome.anglNumb();
		dist_n_min = min_polinome.distNumb();
		_local_max = local_max; _local_min = local_min;
	}

	Object_Features(const Features& max_poli, const Features& min_poli) {
		max_polinome = max_poli;
		min_polinome = min_poli;
		angles_n_max = max_polinome.anglNumb();
		dist_n_max = max_polinome.distNumb();
		angles_n_min = min_polinome.anglNumb();
		dist_n_min = min_polinome.distNumb();
	}

	// returns probability of angles similarity
	float compareAngles(Object_Features obj_2, const float Eps = 0.1) {
		int h = 0;
		const float * angles_max_2 = obj_2.max_polinome.getAngles();
		const float* angles_min_2 = obj_2.min_polinome.getAngles();
		const float* angles_max = max_polinome.getAngles();
		const float* angles_min = min_polinome.getAngles();
		for (int i = 0; i < angles_n_max; ++i) {
			if (abs(angles_max_2[i] - angles_max[i]) < Eps)
				h++;
		}
		for (int i = 0; i < angles_n_min; ++i) {
			if (abs(angles_min[i] - angles_min_2[i]) < Eps)
				h++;
		}

		delete[]angles_max_2; delete[]angles_min_2;
		delete[] angles_max; delete[]angles_min;
		return (float)h / (angles_n_min + angles_n_max);
	}

	// returns probability of distanses similarity
	float compareDistances(Object_Features obj_2, const float Eps = 0.1) {
		int h = 0;
		const double * dist_max_2 = obj_2.max_polinome.getDistances();
		const double* dist_min_2 = obj_2.min_polinome.getDistances();
		const double* dist_max = max_polinome.getDistances();
		const double* dist_min = min_polinome.getDistances();
		for (int i = 0; i < dist_n_max; ++i) {
			if (abs(dist_max_2[i] - dist_max[i]) < Eps)
				h++;
		}
		for (int i = 0; i < dist_n_min; ++i) {
			if (abs(dist_min_2[i] - dist_min[i]) < Eps)
				h++;
		}

		delete[]dist_max_2; delete[]dist_min_2;
		delete[] dist_max; delete[]dist_min;
		return (float)h / (dist_n_max + dist_n_min);
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

	const float* getAnglesMax() {
		return max_polinome.getAngles();
	}

	const double* getDistMax() {
		return max_polinome.getDistances();
	}

	const float* getAnglesMin() {
		return min_polinome.getAngles();
	}

	const double* getDistMin() {
		return min_polinome.getDistances();
	}

	int getDistNumMax(){
		return dist_n_max;
	}

	int getAnglNumMin() {
		return angles_n_min;
	}

	int getDistNumMin() {
		return dist_n_min;
	}

	int getAnglNumMax() {
		return angles_n_max;
	}

	double getMax() {
		return _local_max;
	}

	double getMin() {
		return _local_min;
	}

private:
	Features max_polinome;
	Features min_polinome;
	double _local_max, _local_min;
	int angles_n_max, angles_n_min;
	int dist_n_max, dist_n_min;
	double _AnglesTrust = 0.6, _DistTrust = 0.4;
};


struct ObjectClass {

	float AngleMaxMean, AngleMinMean;
	double Local_Max_ceil, Local_Max_floor;
	double Local_Min_floor, Local_Min_ceil;
	double dist_max, dist_min;
	int av_power;

	ObjectClass() {
		AngleMaxMean = 0; AngleMinMean = 0;
		Local_Max_ceil = 0; Local_Max_floor = 0;
		Local_Min_floor = 0; Local_Min_ceil = 0;
		dist_max = 0; dist_min = 0;
		av_power = 0;
	}

	float belongs(Object_Features obj) {
		float pos = 0;
		int count = obj.getAnglNumMax();
		for (int i = 0; i < count; ++i) {
			pos += AnglesTrust * (obj.getAnglesMax()[i] <= AngleMaxMean && obj.getAnglesMax()[i] >= AngleMinMean);
		}
		count = obj.getAnglNumMin();
		for (int i = 0; i < count; ++i) {
			pos += AnglesTrust * (obj.getAnglesMin()[i] <= AngleMaxMean && obj.getAnglesMin()[i] >= AngleMinMean);
		}

		count = obj.getDistNumMax();
		for (int i = 0; i < count; ++i) {
			pos += DistTrust * (obj.getDistMax()[i] <= dist_max && obj.getDistMax()[i] >= dist_min);
		}
		count = obj.getDistNumMin();
		for (int i = 0; i < count; ++i) {
			pos += DistTrust * (obj.getDistMin()[i] <= dist_max && obj.getDistMin()[i] >= dist_min);
		}

		pos += LocalsTrust * (obj.getMax() <= Local_Max_ceil && (obj.getMax() >= Local_Max_floor));
		pos += LocalsTrust * (obj.getMin() <= Local_Min_ceil && (obj.getMin() >= Local_Min_floor));

		return pos;
	}
private:
	const float AnglesTrust = 0.15;
	const float LocalsTrust = 0.2;
	const float DistTrust = 0.15;
};


class AvarageMeaninig {
public:
	AvarageMeaninig() {
		_AngleMax = 0.;
		_distanceMax = 0.;
		_AngleMin = 0.;
		_distanceMin = 0.;
		_LocalMax = 0.;
		_LocalMin = 0.;


		AngleMaxN = 0;
		distanceMaxN = 0;
		AngleMinN = 0;
		distanceMinN = 0;
		LocalMaxN = 0;
		LocalMinN = 0;
	}

	void avarage() {
		_AngleMax = (float)_AngleMax/AngleMaxN;
		_distanceMax = (float)_distanceMax/distanceMaxN;
		_AngleMin = (float) _AngleMin/AngleMinN;
		_distanceMin = (float)_distanceMin/distanceMinN;
		_LocalMax = (float)_LocalMax/LocalMaxN;
		_LocalMin = (float)_LocalMin/LocalMinN;
	}


	void add_one(float AngleMax, double distanceMax, float AngleMin,
		double distanceMin, double LocalMax, double LocalMin) {
		_AngleMax += AngleMax;
		_distanceMax += distanceMax;
		_AngleMin += AngleMin;
		_distanceMin += distanceMin;
		_LocalMax += LocalMax;
		_LocalMin += LocalMin;

		AngleMaxN += 1;
		distanceMaxN += 1;
		AngleMinN += 1;
		distanceMinN += 1;
		LocalMaxN++;
		LocalMinN++;
	}


	void add_mult(const float* AngleMax, const double* distanceMax, int AnglNumMax, int DistNumMax,
		const float* AngleMin, const double* distanceMin, int AnglNumMin, int DistNumMin,
		double LocalMax, double LocalMin) {
		for (int i = 0; i < AnglNumMax; i++)
		{
			_AngleMax += AngleMax[i];
		}
		for (int i = 0; i < DistNumMax; i++)
		{
			_distanceMax += distanceMax[i];
		}
		for (int i = 0; i < AnglNumMin; i++)
		{
			_AngleMin += AngleMin[i];
		}
		for (int i = 0; i < DistNumMin; i++)
		{
			_distanceMin += distanceMin[i];
		}
		_LocalMax += LocalMax;
		_LocalMin += LocalMin;

		AngleMaxN += AnglNumMax;
		distanceMaxN += DistNumMax;
		AngleMinN += AnglNumMin;
		distanceMinN += DistNumMin;
		LocalMaxN++;
		LocalMinN++;
	}


	void add_features(Object_Features features) {
		add_mult(features.getAnglesMax(), features.getDistMax(), features.getAnglNumMax(), features.getDistNumMax(),
			features.getAnglesMin(), features.getDistMin(), features.getAnglNumMin(), features.getDistNumMin(),
			features.getMax(), features.getMin());
	}


	void print() {
		avarage();
		printf("Avarage values:\n\tLocal Max = %f; Local Min = %f;\n\tAngle """
			"""Max = %f; Angle Min = %f;\n\tDistance Max = %f; Distance Min = %f;", 
			_LocalMax, _LocalMin, _AngleMax, _AngleMin, _distanceMax, _distanceMin);
	}
private:
	int AngleMaxN;
	int distanceMaxN;
	int AngleMinN;
	int distanceMinN;
	int LocalMaxN;
	int LocalMinN;

	float _AngleMax;
	double _distanceMax;
	float _AngleMin;
	double _distanceMin;
	double _LocalMax;
	double _LocalMin;
};