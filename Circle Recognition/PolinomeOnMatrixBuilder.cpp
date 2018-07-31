#pragma OPENCL EXTENSION cl_intel_printf : enable
#include <string>
#include <iostream>
#include "InterpolationAndApproximation.h"
#include "Polinoms.h"

#include "basic.hpp"
#include "cmdparser.hpp"
#include "oclobject.hpp"

#include <ctime>
#include "CL/cl.hpp"
#include "CL/cl.h"
//
//const int SIZE_SMALL = 17;
//const int SIZE_MEDDIUM = 28;
//const int SIZE_LARGE = 32;
//const int POLINOME_POWER = 7;
//const double TOLERANCE = 0.5;

double* normalizePolinoms(double** vectorSet, const int& vectorCount, const int& vectorSize, std::string norm = "avarage") {
	int i, j;
	double* normalizedPol = new double[vectorSize];
	if (norm == "avarage") {
		double suma;
		for (j = 0; j < vectorSize; ++j) {
			suma = 0.;
			for (i = 0; i < vectorCount; ++i) {
				suma += vectorSet[i][j];
			}
			normalizedPol[j] = suma / vectorCount;
		}
	}
	return normalizedPol;
}

double* X_Set(const int& vectorSize, const int& start = 0) {
	double* xset = new double[vectorSize];
	for (int i = 0; i < vectorSize; ++i)
		xset[i] = i + start;
	return xset;
}


double* choseSubvector(double* vector, const int& vectorSize, const int& start, const int& finish) {
	if (start > vectorSize || finish > vectorSize || start > finish)
		throw "Invalid Argument";
	double* subVector = new double[finish - start];
	for (int i = start; i < finish; ++i)
		subVector[i - start] = vector[i];
	return subVector;
}


double** create_approx_polinomes(double* xSet, double **matrix, const int& hight, const int& width, const int& polinome_power) {
	double** polinomes = new double*[hight];
	for (int i = 0; i < hight; ++i) {
		polinomes[i] = new double[polinome_power];
		polinomes[i] = approximation_polinome(xSet, matrix[i], width, polinome_power);
	}
	return polinomes;
}



double** PolinomeSetValues(double*x, double** PolinomeCoefs, const int& height, 
	const int& N, const int& dots) {
	// PLOTS A SET OF POLINOMES OF POWER N ON ONE GRAPH
	int i, j;
	//double* x = xCreateSet(xFrom, xTo, dots);
	double** fx = new double*[height];
	for (i = 0; i < height; ++i) {
		fx[i] = new double[dots];
		for (j = 0; j < dots; ++j) {
			fx[i][j] = function_from_coefs(x[j], PolinomeCoefs[i], N);
		}
	}

	return fx;
}


double* xCreateSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	double h = double(finish - start) / (N - 1);
	double* x = new double[N];
	for (int i = 0; i < N; ++i) {
		x[i] = start + h * i;
	}
	return x;
}

cl_float* xCreateCLSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	double h = double(finish - start) / (N - 1);
	cl_float* x = new cl_float[N];
	for (int i = 0; i < N; ++i) {
		x[i] = (cl_float)start + h * i;
	}
	return x;
}


double** ReverseMatrix(double** matr, const int& hight, const int& wigth) {
	double** matrRev = new double*[wigth];
	for (int i = 0; i < wigth; ++i) {
		matrRev[i] = new double[hight];
		for (int j = 0; j < hight; ++j) {
			matrRev[i][j] = matr[j][i];
		}
	}
	return matrRev;
}



/*
* Builds a set of approximation polinomes on a matrix --- one polinome per a row
* Counts computational time, and prints it, if (printTime == true)
* Returns a matrix of polinome coeficients
*/
double** buidPolinome(double* x, double** Matrix, const int& MatrSize, const int& power, bool printTime) {
	clock_t begin = clock();
	double** polinomes = create_approx_polinomes(x, Matrix, MatrSize, MatrSize, power);
	clock_t end = clock();
	double time = 0;
	if (printTime) {
		time = (float)(end - begin) / CLOCKS_PER_SEC;
		std::cout << "\n ELAPCED TIME: " << time << "\n";
	}

	return polinomes;
}

inline void
checkErr(cl_int err, const char * name)
{
	if (err != CL_SUCCESS) {
		//std::cerr << "ERROR: " << name
		//	<< " (" << err << ")" << std::endl;

		std::cout << "ERROR: " << name
			<< " (" << err << ")\n" << "Press Enter to continue..." << std::endl;
		std::cin.get();
		exit(EXIT_FAILURE);
	}
}


double Approx_Polinomes_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
					cl_float* x_input, cl_float *f_input,
					cl_int input_width, cl_int input_hight,
					cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
					cl_int polinome_power,
					cl_float* T) {
	cl_int err = CL_SUCCESS;
	cl_int numStages = 0;
	cl_uint temp;

	cl_int stage;
	cl_int passOfStage;

	// CREATING BUFFERS FOR x, f, A, b, P, T and C
	// AND CHECKING FOR ERRORS

	cl_mem x_input_buffer = clCreateBuffer(
		context,
		CL_MEM_COPY_HOST_PTR,
		sizeof(cl_float) * input_width,
		x_input,
		&err);
	checkErr(err, "x_input_buffer");

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem f_input_buffer = clCreateBuffer(
		context,
		CL_MEM_COPY_HOST_PTR,
		sizeof(cl_float) * input_hight * input_width,
		f_input,
		&err);
	checkErr(err, "f_input_buffer");

	if (f_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem A_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight * polinome_power,
		A_input,
		&err);
	checkErr(err, "A_buffer");

	if (A_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem B_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power,
		B_input,
		&err);
	checkErr(err, "B_buffer");

	if (B_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem P_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power,
		P_input,
		&err);
	checkErr(err, "P_buffer");

	if (P_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem C_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power * input_hight,
		C_input,
		&err);
	checkErr(err, "C_buffer");

	if (C_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}

	cl_mem T_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power,
		T,
		&err);
	checkErr(err, "T_buffer");

	if (T_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}


	// SETTING UP KERNEL ARGUMENTS + CHECKING FOR ERRORS
	err = clSetKernelArg(kernel, 0, sizeof(x_input_buffer), (void *)& x_input_buffer);
	checkErr(err, "clSetKernelArg : x(0)");

	err = clSetKernelArg(kernel, 1, sizeof(f_input_buffer), (void *)& f_input_buffer);
	checkErr(err, "clSetKernelArg : f(1)");

	err = clSetKernelArg(kernel, 2, sizeof(C_buffer), (void *)& C_buffer);
	checkErr(err, "clSetKernelArg : C(2)");

	err = clSetKernelArg(kernel, 3, sizeof(A_buffer), (void *)& A_buffer);
	checkErr(err, "clSetKernelArg : A(4)");

	err = clSetKernelArg(kernel, 4, sizeof(B_buffer), (void *)& B_buffer);
	checkErr(err, "clSetKernelArg : B(5)");

	err = clSetKernelArg(kernel, 5, sizeof(P_buffer), (void *)& P_buffer);
	checkErr(err, "clSetKernelArg : P(6)");

	err = clSetKernelArg(kernel, 6, sizeof(cl_uint),  &input_width);
	checkErr(err, "clSetKernelArg : width(7)");

	err = clSetKernelArg(kernel, 7, sizeof(T_buffer), (void *)& T_buffer);
	checkErr(err, "clSetKernelArg : T(8)");

	//err = clSetKernelArg(kernel, 8, sizeof(cl_uint),  &polinome_power);
	//checkErr(err, "clSetKernelArg : power(3)");


	const clock_t perf_start = clock();
	int dim = 1;
	size_t global[] = { input_hight, 1, 0 };
	size_t local[] = { 1, 1, 0 };
	err = clEnqueueNDRangeKernel(queue, kernel,
		dim,		
		nullptr,
		global, local,
		0, nullptr, nullptr); 
	checkErr(err, "clEnqueueNDRangeKernel");

	const clock_t perf_stop = clock();

	err = clFinish(queue);
	checkErr(err, "clFinish");

	// READING FROM BUFFER
	err = clEnqueueReadBuffer(queue, C_buffer, CL_TRUE, 0, sizeof(cl_float) * polinome_power* input_hight, C_input, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer");

	// RELEASING BUFFERS
	err = clReleaseMemObject(x_input_buffer);
	checkErr(err, "clReleaseMemObject : x");
	err = clReleaseMemObject(f_input_buffer);
	checkErr(err, "clReleaseMemObject : f");
	err = clReleaseMemObject(A_buffer);
	checkErr(err, "clReleaseMemObject : A");
	err = clReleaseMemObject(B_buffer);
	checkErr(err, "clReleaseMemObject : B");
	err = clReleaseMemObject(P_buffer);
	checkErr(err, "clReleaseMemObject : P");
	err = clReleaseMemObject(C_buffer);
	checkErr(err, "clReleaseMemObject : C");

	return (float)(perf_stop - perf_start) / CLOCKS_PER_SEC;
}



// kernel one
double Approx_Polinomes_Run_Kernel(cl::Context context, cl::Device &device, cl::Kernel &kernel,
				cl_float* x_input, cl_float *f_input,
				cl_int input_width, cl_int input_hight,
				cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_float *P_input,
				cl_int polinome_power,
				cl_float* T) {
	const clock_t   perf_start = clock();
	// CREATING BUFFERS FOR x, f, A, b, P and C


	cl::CommandQueue queue(context, device);

	cl::Buffer x_buffer(context, CL_MEM_READ_ONLY, sizeof(cl_float) * input_width);
	queue.enqueueWriteBuffer(x_buffer, CL_TRUE, 0, sizeof(cl_float) * input_width, x_input);


	cl::Buffer f_buffer(context, CL_MEM_READ_ONLY, sizeof(cl_float) * input_hight * input_width);
	queue.enqueueWriteBuffer(f_buffer, CL_TRUE, 0, sizeof(cl_float) * input_width * input_hight, f_input);


	cl::Buffer A_buffer(context, CL_MEM_READ_WRITE, sizeof(cl_float) * input_hight *  polinome_power);
	queue.enqueueWriteBuffer(A_buffer, CL_TRUE, 0, sizeof(cl_float) *  polinome_power * input_hight, A_input);


	cl::Buffer B_buffer(context, CL_MEM_READ_WRITE, sizeof(cl_float) * polinome_power);
	queue.enqueueWriteBuffer(B_buffer, CL_TRUE, 0, sizeof(cl_float) *  polinome_power, B_input);


	cl::Buffer P_buffer(context, CL_MEM_READ_WRITE, sizeof(cl_float) * (polinome_power + 1));
	queue.enqueueWriteBuffer(P_buffer, CL_TRUE, 0, sizeof(cl_float) *  (polinome_power + 1), P_input);

	cl::Buffer C_buffer(context, CL_MEM_WRITE_ONLY, sizeof(cl_float) * polinome_power* input_hight);
	queue.enqueueWriteBuffer(C_buffer, CL_TRUE, 0, sizeof(cl_float) *  polinome_power * input_hight, C_input);

	cl::Buffer T_buffer(context, CL_MEM_READ_WRITE, sizeof(cl_float) * polinome_power * input_hight);
	queue.enqueueWriteBuffer(T_buffer, CL_TRUE, 0, sizeof(cl_float) *  polinome_power * input_hight, T);

	// SETTING UP KERNEL ARGUMENTS + CHECKING FOR ERRORS
	// (void *)&
	kernel.setArg(0,  x_buffer);
	kernel.setArg(1,  f_buffer);
	kernel.setArg(2,  C_buffer);
	kernel.setArg(3,  polinome_power);
	kernel.setArg(4,  A_buffer);
	kernel.setArg(5,  B_buffer);
	kernel.setArg(6,  P_buffer);
	kernel.setArg(7,  input_width);
	kernel.setArg(8,  T_buffer);

	//const int TS = 4;
	//const size_t local[2] = { TS, TS };
	//const size_t global[2] = { input_hight, input_width };
	// cl::NullRange, cl::NDRange(input_hight), cl::NullRange
	//queue.enqueueNDRangeKernel(kernel, 1, cl::NullRange, cl::NDRange(input_hight), nullptr, 0);
	cl_int err;
	err = queue.enqueueNDRangeKernel(kernel, cl::NullRange, cl::NDRange(input_hight), cl::NullRange);
	if (CL_SUCCESS != err)
	{
		printf("Error: Failed to execute kernel!\n");
		printf("Error number: %d", err);
		std::cin.get();
		exit(1);
	}
	queue.finish();


	queue.enqueueReadBuffer(C_buffer, CL_TRUE, 0, sizeof(cl_float) * polinome_power* input_hight, C_input);

	const clock_t perf_stop = clock();

	//for (int i = 0; i < polinome_power * input_hight; ++i)
	//	std::cout<<"C["<< i <<"] = "<<C_input[i]<<"\t";

	return (float)(perf_stop - perf_start) / CLOCKS_PER_SEC;
}


/*
* Builds a set of approximation polinomes on a matrix --- one polinome per a row
* Uses OpenCl for optimization
* Counts computational time, and prints it, if (printTime == true)
* Returns a matrix of polinome coeficients
*/
//int buidPolinomeWithOpenCL(cl_double* x, cl_double* f_x, cl_double* C, const cl_int& MatrSize, const cl_int& power) {
//	int ret = EXIT_SUCCESS;
//	cl_int* p_input = NULL;
//	cl_int* p_ref = NULL;
//	try
//	{
//		// Build kernel
//		//OpenCLProgramOneKernel executable(oclobjects, L"Kernel.cl", "", "build_polinome");
//		
//		cl_double* A = new cl_double[power*power];
//		cl_double* B = new cl_double[power];
//		cl_double* P = new cl_double[power];
//		
//
//		printf("Executing OpenCL kernel...\n");
//		//float ocl_time = Approx_Polinomes_Run_Kernel(oclobjects, executable, x, f_x, MatrSize, MatrSize, A, B, C, P, power);
//
//		//bool result = true;
//		//printf("Performing verification...\n");
//		//for (cl_int i = 0; i < array_size.getValue(); i++)
//		//{
//		//	if (p_input[i] != p_ref[i])
//		//	{
//		//		result = false;
//		//		break;
//		//	}
//		//}
//		//if (!result)
//		//{
//		//	printf("ERROR: Verification failed.\n");
//		//	ret = EXIT_FAILURE;
//		//}
//		//else
//		//{
//		//	printf("Verification succeeded.\n");
//		//}
//		//printf("NDRange perf. counter time %f ms.\n", 1000.0f*ocl_time);
//	}
//	catch (const Error& error)
//	{
//		cerr << "[ ERROR ] Sample application specific error: " << error.what() << "\n";
//		ret = EXIT_FAILURE;
//	}
//	catch (const std::exception& error)
//	{
//		cerr << "[ ERROR ] " << error.what() << "\n";
//		ret = EXIT_FAILURE;
//	}
//	catch (...)
//	{
//		cerr << "[ ERROR ] Unknown/internal error happened.\n";
//		ret = EXIT_FAILURE;
//	}
//
//	aligned_free(p_ref);
//	aligned_free(p_input);
//	return ret;
//}
