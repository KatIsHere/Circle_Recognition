#pragma once
#include "CL/cl.hpp"
double** create_approx_polinomes(double* xSet, double **matrix, const int& hight, const int& width, const int& polinome_power);
double* xCreateSet(double start, double finish, const int& N);
cl_double* xCreateCLSet(double start, double finish, const int& N);
double** PolinomeSetValues(double*x, double** PolinomeCoefs, const int& height, const int& N, const int& dots);
double** ReverseMatrix(double** matr, const int& hight, const int& wigth);
double** buidPolinome(double* x, double** Matrix, const int& MatrSize, const int& power, bool printTime);
int buidPolinomeWithOpenCL(int argc, const char** argv, cl_double* x, cl_double* f_x, cl_double* C, const cl_int& MatrSize, const cl_int& power); // opencl optimization