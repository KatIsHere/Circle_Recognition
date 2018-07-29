#pragma once
#include<string>
#include "CL/cl.hpp"
double** loadMatrix(std::string filename, const int& height, const int& width);
double* loadMatrix_ToVector(std::string filename, const int& height, const int& width);
void printVectorScreen(double* arr, const int& size, std::string type = "vector");
cl_float* cl_loadFunc(const int& height, const int& width, std::string filename);
void printMatrixScreen(double** matr, const int& height, const int& width, std::string typePrint = "vector", bool one_function = false);
double** loadMatrix(std::string filename, const int& height, const int& width);