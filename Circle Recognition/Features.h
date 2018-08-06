#pragma once
#define VALUE_RESTRICTION 9000
#include <cmath>
#include <vector>
#include "LoaderAndPrinter.h"
#include <fstream>
#include <sstream>

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
		setValues(extremums, len);
	}


	Features(std::vector<Point> extr, const int& len) {
		setValues(extr, len);
	}


	void setValues(std::vector<Point> extr, const int& len) {
		N = len;
		extremums = extr;
		distancesNumb = (len - 1 >= 0? len - 1 : 0);
		anglesNumb = (len - 2 >= 0 ? len - 2 : 0);

		distances = new double[distancesNumb];
		angles = new float[anglesNumb];
		Distances(distances);
		Angles(angles);
	}


	const int& getLen() {
		return N;
	}

	std::vector<Point> getExtrems() {
		return extremums;
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
	std::vector<Point> extremums;

	/*
	* returns distances between extremums
	*/
	void Distances(double* Distance) {
		for (int i = 0; i < distancesNumb; i++)	{
			Distance[i] = extremums[i].distance(extremums[i + 1]);
		}
	}


	/*
	* returns cos of all ancgles
	* based on law of cosines: cos C = (a**2 + b**2 - c**2)/(2ab)
	* the BIGGER the meaning ----> the SMALLER the angle
	* angle from 0 to pi
	*/
	void Angles(float* Angles) {
		float rb;
		for (int i = 0; i < anglesNumb; ++i) {
			rb = extremums[i].distance(extremums[i + 2]);
			Angles[i] = (distances[i] * distances[i] + distances[i + 1] * distances[i + 1] - rb*rb)/(2* distances[i]* distances[i+1]);
		}
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
		_powerMax = power_max;
		_powerMin = power_min;
		max_extr_value = y_max_poli;
		min_extr_value = y_min_poli;
	}

	//Object_Features(const Features& max_poli, const Features& min_poli) {
	//	max_polinome = max_poli;
	//	min_polinome = min_poli;
	//	angles_n_max = max_polinome.anglNumb();
	//	dist_n_max = max_polinome.distNumb();
	//	angles_n_min = min_polinome.anglNumb();
	//	dist_n_min = min_polinome.distNumb();
	//}

	//// returns probability of angles similarity
	//float compareAngles(Object_Features obj_2, const float Eps = 0.1) {
	//	int h = 0;
	//	const float * angles_max_2 = obj_2.max_polinome.getAngles();
	//	const float* angles_min_2 = obj_2.min_polinome.getAngles();
	//	const float* angles_max = max_polinome.getAngles();
	//	const float* angles_min = min_polinome.getAngles();
	//	for (int i = 0; i < angles_n_max; ++i) {
	//		if (abs(angles_max_2[i] - angles_max[i]) < Eps)
	//			h++;
	//	}
	//	for (int i = 0; i < angles_n_min; ++i) {
	//		if (abs(angles_min[i] - angles_min_2[i]) < Eps)
	//			h++;
	//	}

	//	delete[]angles_max_2; delete[]angles_min_2;
	//	delete[] angles_max; delete[]angles_min;
	//	return (float)h / (angles_n_min + angles_n_max);
	//}

	//// returns probability of distanses similarity
	//float compareDistances(Object_Features obj_2, const float Eps = 0.1) {
	//	int h = 0;
	//	const double * dist_max_2 = obj_2.max_polinome.getDistances();
	//	const double* dist_min_2 = obj_2.min_polinome.getDistances();
	//	const double* dist_max = max_polinome.getDistances();
	//	const double* dist_min = min_polinome.getDistances();
	//	for (int i = 0; i < dist_n_max; ++i) {
	//		if (abs(dist_max_2[i] - dist_max[i]) < Eps)
	//			h++;
	//	}
	//	for (int i = 0; i < dist_n_min; ++i) {
	//		if (abs(dist_min_2[i] - dist_min[i]) < Eps)
	//			h++;
	//	}

	//	delete[]dist_max_2; delete[]dist_min_2;
	//	delete[] dist_max; delete[]dist_min;
	//	return (float)h / (dist_n_max + dist_n_min);
	//}


	//bool small_obj(const double& threshold_max, const double& threshold_min) {
	//	return (_local_max < threshold_max && _local_min > threshold_min);
	//}

	const double* getMin_extr() {
		return min_extr_value;
	}

	const double* getMax_extr() {
		return max_extr_value;
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

	const int& getPowerMax() {
		return _powerMax;
	}

	const int& getPowerMin() {
		return _powerMin;
	}

private:
	Features max_polinome;
	Features min_polinome;
	double _local_max, _local_min;
	int angles_n_max, angles_n_min;
	int dist_n_max, dist_n_min;
	double _AnglesTrust = 0.6, _DistTrust = 0.4;
	int _powerMax, _powerMin;
	double* max_extr_value;
	double* min_extr_value;
};


class ObjectClass {
public:

	ObjectClass() {
		AngleMaxMean = 0; AngleMinMean = 0;
		Local_Max_ceil = 0; Local_Max_floor = 0;
		Local_Min_floor = 0; Local_Min_ceil = 0;
		dist_max = 0; dist_min = 0;
		av_power = 0;
	}

	ObjectClass(float _AngleMaxMean, float _AngleMinMean,
		double _Local_Max_ceil, double _Local_Max_floor,
		double _Local_Min_floor, double _Local_Min_ceil,
		double _dist_max, double _dist_min,
		int _av_power) {
		AngleMaxMean = _AngleMaxMean; AngleMinMean = _AngleMinMean;
		Local_Max_ceil = _Local_Max_ceil; Local_Max_floor = _Local_Max_floor;
		Local_Min_floor = _Local_Min_floor; Local_Min_ceil = _Local_Min_ceil;
		dist_max = _dist_max; dist_min = _dist_min;
		av_power = _av_power;
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
		
		pos -= (PowTrust * (obj.getPowerMax() == av_power) + PowTrust * (obj.getPowerMin() == av_power));
		return pos;
	}
private:
	const float AnglesTrust = 0.25;
	const float LocalsTrust = 0.5;
	const float DistTrust = 0.25;
	const float PowTrust = 0.3;

	float AngleMaxMean, AngleMinMean;
	double Local_Max_ceil, Local_Max_floor;
	double Local_Min_floor, Local_Min_ceil;
	double dist_max, dist_min;
	int av_power;
};


class AvarageMeaninig {
public:
	AvarageMeaninig(const int& PoliPower) {
		polinome_power = PoliPower;

		counter = 0;

		avarage_extremum_count = 0;
		extremum_power_sum = 0;
		_LocalMax.resize(polinome_power);
		LocalMaxN.resize(polinome_power);
		_AngleMax.resize(polinome_power - 2);
		AngleMaxN.resize(polinome_power - 2);
		_distanceMax.resize(polinome_power - 1);
		distanceMaxN.resize(polinome_power - 1);
	}
	
	AvarageMeaninig() {
		clear();
	}

	void clear() {
		polinome_power = 0;

		counter = 0;

		avarage_extremum_count = 0;
		extremum_power_sum = 0;
		_LocalMax.clear();
		LocalMaxN.clear();
		_AngleMax.clear();
		AngleMaxN.clear();
		_distanceMax.clear();
		distanceMaxN.clear();
		avaraged = false;
	}

	void setNewObj(const int& PoliPower) {
		clear();
		polinome_power = PoliPower;

		counter = 0;

		avarage_extremum_count = 0;
		extremum_power_sum = 0;
		_LocalMax.resize(polinome_power);
		LocalMaxN.resize(polinome_power);
		_AngleMax.resize(polinome_power - 2);
		AngleMaxN.resize(polinome_power - 2);
		_distanceMax.resize(polinome_power - 1);
		distanceMaxN.resize(polinome_power - 1);
		avaraged = false;
	}

	void avarage() {
		if (!avaraged) {
			avarage_extremum_count = (float)avarage_extremum_count / counter;
			for (int i = 0; i < polinome_power - 2; ++i) {
				_LocalMax[i] = (double)_LocalMax[i] / LocalMaxN[i];
				_AngleMax[i] = (double)_AngleMax[i] / AngleMaxN[i];
				_distanceMax[i] = (double)_distanceMax[i] / distanceMaxN[i];
			}
			_distanceMax[polinome_power - 2] = (double)_distanceMax[polinome_power - 2] / distanceMaxN[polinome_power - 2];
			_LocalMax[polinome_power - 2] = (double)_LocalMax[polinome_power - 2] / LocalMaxN[polinome_power - 2];
			_LocalMax[polinome_power - 1] = (double)_LocalMax[polinome_power - 1] / LocalMaxN[polinome_power - 1];
			avaraged = true;
		}
	}


	void add_mult(const float* AngleMax, const double* distanceMax, int AnglNumMax, int DistNumMax,
		const double* LocalMax, const int& count_max) {
		bool flag;
		for (int i = 0; i < AnglNumMax; i++)
		{
			_AngleMax[i] += AngleMax[i];
			AngleMaxN[i] ++;
		}

		for (int i = 0; i < DistNumMax; i++)
		{
			flag = (distanceMax[i] <= VALUE_RESTRICTION && distanceMax[i] >= -VALUE_RESTRICTION);
			_distanceMax[i] += distanceMax[i] * flag;
			distanceMaxN[i] += flag;
		}

		for (int i = 0; i < count_max; i++)
		{
			flag = (LocalMax[i] <= VALUE_RESTRICTION && LocalMax[i] >= -VALUE_RESTRICTION);
			_LocalMax[i] += LocalMax[i] * flag;
			LocalMaxN[i] += flag;
			avarage_extremum_count += flag;
		}
		counter++;
	}


	void add_features(Object_Features features) {
		add_mult(features.getAnglesMax(), features.getDistMax(), features.getAnglNumMax(), features.getDistNumMax(),
			features.getMax_extr(),  features.getPowerMax());
	}


	void print() {
		avarage();
		printf("Avarage values: \nExtremum count: %f;", avarage_extremum_count);
		printf("\nLocal max polinome: ");
		printVectorScreen(_LocalMax);
		printf("\nDistances: ");
		printVectorScreen(_distanceMax);
		printf("\nAngles: ");
		printVectorScreen(_AngleMax);
	}

	void toFile(std::ofstream&  file, const int& className, const bool& is_pressed) {
		avarage();
		std::string obj;
		obj = "Class_" + std::to_string(className) + "_" + std::to_string(is_pressed) + ":" + std::to_string(avarage_extremum_count) + ";";
		for (int i = 0; i < polinome_power - 1; ++i) {
			obj+=std::to_string(_LocalMax[i]) + "\t";
		};
		obj += std::to_string(_LocalMax[polinome_power - 1]) + ";";

		for (int i = 0; i < polinome_power - 2; ++i) {
			obj += std::to_string(_distanceMax[i]) + "\t";
		};
		obj += std::to_string(_distanceMax[polinome_power - 2]) + ";";

		// for precision
		std::ostringstream oss;
		oss.precision(std::numeric_limits<double>::digits10);
		
		for (int i = 0; i < polinome_power - 3; ++i) {
			oss << std::fixed << _AngleMax[i];
			obj += oss.str() + "\t";
			oss.clear();
		};
		obj += std::to_string(_AngleMax[polinome_power - 3]) + ";\n";
		file << obj;
	}

private:
	std::vector<int> AngleMaxN;
	std::vector<int> distanceMaxN;
	int counter;

	std::vector<float> _AngleMax;
	std::vector<double> _distanceMax;

	std::vector<int> LocalMaxN;
	std::vector<double> _LocalMax;

	int polinome_power;
	int extremum_power_sum;
	double avarage_extremum_count;

	bool avaraged;
};