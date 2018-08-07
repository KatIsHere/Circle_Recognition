#pragma once
#include "CL/cl.hpp"
#include "CL/cl.h"
cl_float* xCreateCLSet(double start, double finish, const int& N);
inline void checkErr(cl_int err, const char * name);
double Approx_Polinomes_Run_Kernel_DOUBLES(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_double* A_input, cl_double *B_input, cl_double *C_input, cl_int *P_input,
	cl_int polinome_power);
double Extremums_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
			cl_double* coefs_input, cl_int input_width, cl_int input_hight,
			cl_float start, cl_float finish, cl_float h,
			cl_float* extrems_x, cl_int* extrems_count);