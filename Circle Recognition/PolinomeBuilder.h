#pragma once
#include "CL/cl.hpp"
double** create_approx_polinomes(double* xSet, double **matrix, const int& hight, const int& width, const int& polinome_power);
double* xCreateSet(double start, double finish, const int& N);
cl_float* xCreateCLSet(double start, double finish, const int& N);
double** PolinomeSetValues(double*x, double** PolinomeCoefs, const int& height, const int& N, const int& dots);
double** ReverseMatrix(double** matr, const int& hight, const int& wigth);
double** buidPolinome(double* x, double** Matrix, const int& MatrSize, const int& power, bool printTime);
//int buidPolinomeWithOpenCL(cl_double* x, cl_double* f_x, cl_double* C, const cl_int& MatrSize, const cl_int& power); // opencl optimization
//double Approx_Polinomes_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
//	cl_float* x_input, cl_float *f_input,
//	cl_int input_width, cl_int input_hight,
//	cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
//	cl_int polinome_power);
double Approx_Polinomes_Run_Kernel(cl::Context context, cl::Device &device, cl::Kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
	cl_int polinome_power);