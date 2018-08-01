#pragma once
#include "CL/cl.hpp"
#include "CL/cl.h"
cl_float* xCreateCLSet(double start, double finish, const int& N);
inline void checkErr(cl_int err, const char * name);
double Approx_Polinomes_Kernel_squareRoot(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_float* A, cl_float *B, cl_float *C_output, cl_float *K,
	cl_int polinome_power,
	cl_float* S);
double Approx_Polinomes_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
	cl_int polinome_power,
	cl_float* T);
double Approx_Polinomes_Run_Kernel(cl::Context context, cl::Device &device, cl::Kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
	cl_int polinome_power,
	cl_float* T);
double Approx_Polinomes_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_double* x_input, cl_double *f_input,
	cl_int input_width, cl_int input_hight,
	cl_double* A_input, cl_double *B_input, cl_double *C_input, cl_double *P_input,
	cl_int polinome_power,
	cl_double* T);