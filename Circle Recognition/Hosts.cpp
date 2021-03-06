#include <ctime>
#include <iostream>
#include "Hosts.h"
#include <cmath>

using namespace std;
void initializeA(cl_float* xSet, cl_double* A, const cl_int& power, const cl_int& setSize, cl_int* Y);
void initializeA(cl_float* xSet, cl_float* A, const cl_int& power, const cl_int& setSize, cl_int* Y);
inline void checkErr(cl_int err, const char * name);


// Working host
double Approx_Polinomes_Run_Kernel_DOUBLES(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_double* A_input, cl_double *B_input, cl_double *C_input, cl_int *P_input,
	cl_int polinome_power) {

	initializeA(x_input, A_input, polinome_power, input_width, P_input);
	cl_int err = CL_SUCCESS;
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
		throw  "Failed to create input data Buffer\n";
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
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem A_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_double) * input_hight * polinome_power,
		A_input,
		&err);
	checkErr(err, "A_buffer");

	if (A_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem B_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_double) * polinome_power * input_hight,
		B_input,
		&err);
	checkErr(err, "B_buffer");

	if (B_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem P_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_int) * polinome_power,
		P_input,
		&err);
	checkErr(err, "P_buffer");

	if (P_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem C_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_double) * polinome_power * input_hight,
		C_input,
		&err);
	checkErr(err, "C_buffer");

	if (C_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
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

	err = clSetKernelArg(kernel, 6, sizeof(cl_uint), &input_width);
	checkErr(err, "clSetKernelArg : width(7)");

	err = clSetKernelArg(kernel, 7, sizeof(cl_uint), &polinome_power);
	checkErr(err, "clSetKernelArg : power(3)");

	const clock_t perf_start = clock();
	int dim = 1;
	size_t global[] = { input_hight, 1, 0 };
	size_t local[] = { 1, 1, 0 };
	err = clEnqueueNDRangeKernel(queue, kernel,
		dim,
		nullptr,
		global, local,
		0, nullptr, nullptr);
	checkErr(err, "clEnqueueNDRangeKernel - Approx_Polinomes_Run_Kernel_DOUBLES");
	const clock_t perf_stop = clock();

	err = clFinish(queue);
	checkErr(err, "clFinish");

	// READING FROM BUFFER
	err = clEnqueueReadBuffer(queue, C_buffer, CL_TRUE, 0, sizeof(cl_double) * polinome_power* input_hight, C_input, NULL, NULL, NULL);
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

double Extremums_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_double* coefs_input, cl_int input_width, cl_int input_hight,
	cl_float start, cl_float finish, cl_float h,
	cl_float* extrems_x, cl_int* extrems_count) {

	cl_int err = CL_SUCCESS;

	cl_mem coefs_input_buffer = clCreateBuffer(
		context,
		CL_MEM_COPY_HOST_PTR,
		sizeof(cl_double) * input_width * input_width,
		coefs_input,
		&err);
	checkErr(err, "coefs_input_buffer");

	if (coefs_input_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}

	cl_mem x_extrems_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight *  (input_width - 1),
		extrems_x,
		&err);
	checkErr(err, "x_extrems_buffer");

	if (x_extrems_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}

	cl_mem extrems_count_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_int) * input_hight,
		extrems_count,
		&err);
	checkErr(err, "extrems_count_buffer");

	if (extrems_count_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}

	cl_int setSize = (finish - start) / h;

	

	// SETTING UP KERNEL ARGUMENTS + CHECKING FOR ERRORS
	err = clSetKernelArg(kernel, 0, sizeof(coefs_input_buffer), (void *)& coefs_input_buffer);
	checkErr(err, "clSetKernelArg : coefs_input_buffer(0)");

	err = clSetKernelArg(kernel, 1, sizeof(cl_int), &input_width);
	checkErr(err, "clSetKernelArg : input_width(1)");

	err = clSetKernelArg(kernel, 2, sizeof(cl_float), &start);
	checkErr(err, "clSetKernelArg : start_buffer(2)");

	err = clSetKernelArg(kernel, 3, sizeof(cl_float), &h);
	checkErr(err, "clSetKernelArg : finish(4)");

	err = clSetKernelArg(kernel, 4, sizeof(x_extrems_buffer), (void *)& x_extrems_buffer);
	checkErr(err, "clSetKernelArg : coefs_input_buffer(0)");

	err = clSetKernelArg(kernel, 5, sizeof(extrems_count_buffer), (void *)& extrems_count_buffer);
	checkErr(err, "clSetKernelArg : coefs_input_buffer(0)");


	const clock_t perf_start = clock();
	int dim = 2;
	size_t global[] = { input_hight, setSize, 0 };
	size_t local[] = { 1, 1, 0 };
	err = clEnqueueNDRangeKernel(queue, kernel,
		dim,
		nullptr,
		global, local,
		0, nullptr, nullptr);
	checkErr(err, "clEnqueueNDRangeKernel : Extremums_Run_Kernel");

	const clock_t perf_stop = clock();

	err = clFinish(queue);
	checkErr(err, "clFinish");

	// READING FROM BUFFER
	err = clEnqueueReadBuffer(queue, x_extrems_buffer, CL_TRUE, 0, sizeof(cl_float) *  input_hight * (input_width - 1), extrems_x, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(x)");
	err = clEnqueueReadBuffer(queue, extrems_count_buffer, CL_TRUE, 0, sizeof(cl_int) *  input_hight, extrems_count, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(x)");

	// RELEASING BUFFERS
	err = clReleaseMemObject(coefs_input_buffer);
	checkErr(err, "clReleaseMemObject : coefs");
	err = clReleaseMemObject(x_extrems_buffer);
	checkErr(err, "clReleaseMemObject : x");
	err = clReleaseMemObject(extrems_count_buffer);
	checkErr(err, "clReleaseMemObject : extrems_count_buffer");

	return (float)(perf_stop - perf_start) / CLOCKS_PER_SEC;
}


// input_width = power - 2
double Features_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_extrems_input, cl_float* y_extrems_input, cl_int input_width, cl_int input_hight,
	cl_float* distances, cl_float* angles, cl_float* x_centers, cl_float* y_centers) {

	cl_int err = CL_SUCCESS;


	cl_mem x_extrems_input_buffer = clCreateBuffer(
		context,
		CL_MEM_COPY_HOST_PTR,
		sizeof(cl_float) * input_width * input_hight,
		x_extrems_input,
		&err);
	checkErr(err, "x_extrems_input_buffer");

	if (x_extrems_input_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem y_extrems_input_buffer = clCreateBuffer(
		context,
		CL_MEM_COPY_HOST_PTR,
		sizeof(cl_float) * input_hight * input_width,
		y_extrems_input,
		&err);
	checkErr(err, "y_extrems_input_buffer");

	if (y_extrems_input_buffer == (cl_mem)0)
	{
		throw "Failed to create input data Buffer\n";
	}
	cl_mem distances_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight * (input_width - 1),
		distances,
		&err);
	checkErr(err, "distances_buffer");

	if (distances_buffer == (cl_mem)0)
	{
		throw "Failed to create input data Buffer\n";
	}
	cl_mem angles_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight * (int)(input_width + 1) / 2,
		angles,
		&err);
	checkErr(err, "angles_buffer");

	if (angles_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem x_center_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight,
		x_centers,
		&err);
	checkErr(err, "x_center_buffer");

	if (x_center_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}

	cl_mem y_center_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * input_hight,
		y_centers,
		&err);
	checkErr(err, "y_center_buffer");

	if (y_center_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}


	// SETTING UP KERNEL ARGUMENTS + CHECKING FOR ERRORS
	err = clSetKernelArg(kernel, 0, sizeof(x_extrems_input_buffer), (void *)& x_extrems_input_buffer);
	checkErr(err, "clSetKernelArg : x_extrems_input_buffer(0)");

	err = clSetKernelArg(kernel, 1, sizeof(y_extrems_input_buffer), (void *)& y_extrems_input_buffer);
	checkErr(err, "clSetKernelArg : y_extrems_input_buffer(1)");

	err = clSetKernelArg(kernel, 2, sizeof(cl_int), &input_width);
	checkErr(err, "clSetKernelArg : input_width(2)");

	err = clSetKernelArg(kernel, 3, sizeof(distances_buffer), (void *)& distances_buffer);
	checkErr(err, "clSetKernelArg : distances_buffer(4)");

	err = clSetKernelArg(kernel, 4, sizeof(angles_buffer), (void *)& angles_buffer);
	checkErr(err, "clSetKernelArg : angles_buffer(5)");

	err = clSetKernelArg(kernel, 5, sizeof(x_center_buffer), (void *)& x_center_buffer);
	checkErr(err, "clSetKernelArg : x_center_buffer(6)");

	err = clSetKernelArg(kernel, 6, sizeof(y_center_buffer), (void *)& y_center_buffer);
	checkErr(err, "clSetKernelArg : y_center_buffer(7)");


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
	err = clEnqueueReadBuffer(queue, x_center_buffer, CL_TRUE, 0, sizeof(cl_float) *  input_hight, x_centers, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(x_center_buffer)");

	err = clEnqueueReadBuffer(queue, y_center_buffer, CL_TRUE, 0, sizeof(cl_float) *  input_hight, y_centers, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(y_center_buffer)");

	err = clEnqueueReadBuffer(queue, distances_buffer, CL_TRUE, 0, sizeof(cl_float) *  input_hight * (input_width - 1), distances, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(distances_buffer)");

	err = clEnqueueReadBuffer(queue, angles_buffer, CL_TRUE, 0, sizeof(cl_float) *  input_hight * (int)(input_width + 1) / 2, angles, NULL, NULL, NULL);
	checkErr(err, "clEnqueueReadBuffer : couldn't read from buffer(angles_buffer)");


	// RELEASING BUFFERS
	err = clReleaseMemObject(x_extrems_input_buffer);
	checkErr(err, "clReleaseMemObject : x_extrems_input_buffer");
	err = clReleaseMemObject(y_extrems_input_buffer);
	checkErr(err, "clReleaseMemObject : y_extrems_input_buffer");
	err = clReleaseMemObject(distances_buffer);
	checkErr(err, "clReleaseMemObject : distances_buffer");
	err = clReleaseMemObject(angles_buffer);
	checkErr(err, "clReleaseMemObject : angles_buffer");
	err = clReleaseMemObject(x_center_buffer);
	checkErr(err, "clReleaseMemObject : x_center_buffer");
	err = clReleaseMemObject(y_center_buffer);
	checkErr(err, "clReleaseMemObject : y_center_buffer");

	return (float)(perf_stop - perf_start) / CLOCKS_PER_SEC;
}


// helper functions
cl_float* xCreateCLSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	float h = float(finish - start) / (N - 1);
	cl_float* x = new cl_float[N];
	for (int i = 0; i < N; ++i) {
		x[i] = (cl_float)start + h * i;
	}
	return x;
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

void initializeA(cl_float* xSet, cl_float* A, const cl_int& power, const cl_int& setSize, cl_int* Y) {
	int i, j, k;
	float suma;
	float normalizing = (float)1 / (setSize + 1);

	for (i = 0; i < power; ++i) {
		for (j = 0; j < power; ++j) {
			A[i * power + j] = 0;
			suma = (float)0.;
			for (k = 0; k < setSize; ++k) {
				suma += pow(xSet[k], i + j);
			}
			A[i * power + j] = normalizing * suma;
		}
	}

	int i_max;
	float maxA, absA;
	cl_float* T = new cl_float[power];
	for (i = 0; i < power; i++)
		Y[i] = i;					//Unit permutation matrix
	
	for (i = 0; i < power; i++) {
		maxA = 0.;
		i_max = i;

		for (k = i; k < power; k++) {
			if ((absA = fabs(A[k * power + i])) > maxA) {
				maxA = absA;
				i_max = k;
			}
		}
		if (maxA < 0.01)
			printf("\nMatrix is degenerate\n");
		if (i_max != i) {
			//pivoting P
			j = Y[i];
			Y[i] = Y[i_max];
			Y[i_max] = j;

			//pivoting rows of A
			for (j = 0; j < power; ++j) {
				T[j] = A[i * power + j];
				A[i * power + j] = A[i_max * power + j];
				A[i_max * power + j] = T[j];
			}
		}

		for (j = i + 1; j < power; j++) {
			A[j * power + i] /= A[i * power + i];

			for (k = i + 1; k < power; k++)
				A[j * power + k] -= A[j * power + i] * A[i * power + k];
		}
	}
	delete[]T;
}

void initializeA(cl_float* xSet, cl_double* A, const cl_int& power, const cl_int& setSize, cl_int* Y) {
	/*
	* Creates decomposed A matrix, wich is the same for every polinome
	* Works fine, bugs not sighted
	*/
	int i, j, k;
	float suma;
	float normalizing = (float)1 / (setSize + 1);

	for (i = 0; i < power; ++i) {
		for (j = 0; j < power; ++j) {
			A[i * power + j] = 0;
			suma = (float)0.;
			for (k = 0; k < setSize; ++k) {
				suma += pow(xSet[k], i + j);
			}
			A[i * power + j] = normalizing * suma;
		}
	}

	int i_max;
	float maxA, absA;
	cl_double* T = new cl_double[power];
	for (i = 0; i < power; i++)
		Y[i] = i;					//Unit permutation matrix
	for (i = 0; i < power; i++) {
		maxA = 0.;
		i_max = i;

		for (k = i; k < power; k++) {
			if ((absA = fabs(A[k * power + i])) > maxA) {
				maxA = absA;
				i_max = k;
			}
		}
		if (maxA < 0.01)
			printf("\nMatrix is degenerate\n");
		if (i_max != i) {
			//pivoting P
			j = Y[i];
			Y[i] = Y[i_max];
			Y[i_max] = j;

			//pivoting rows of A
			for (j = 0; j < power; ++j) {
				T[j] = A[i * power + j];
				A[i * power + j] = A[i_max * power + j];
				A[i_max * power + j] = T[j];
			}
		}

		for (j = i + 1; j < power; j++) {
			A[j * power + i] /= A[i * power + i];

			for (k = i + 1; k < power; k++)
				A[j * power + k] -= A[j * power + i] * A[i * power + k];
		}
	}
	delete[]T;
}

// Other host functions
double Approx_Polinomes_Run_Kernel(cl_command_queue &queue, cl_context context, cl_device_id &device, cl_kernel &kernel,
	cl_float* x_input, cl_float *f_input,
	cl_int input_width, cl_int input_hight,
	cl_float* A_input, cl_float *B_input, cl_float *C_input, cl_int *P_input,
	cl_int polinome_power) {
	initializeA(x_input, A_input, polinome_power, input_width, P_input);
	cl_int err = CL_SUCCESS;
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
		throw  "Failed to create input data Buffer\n";
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
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem A_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power * polinome_power * input_hight,
		A_input,
		&err);
	checkErr(err, "A_buffer");

	if (A_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem B_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_float) * polinome_power * input_hight,
		B_input,
		&err);
	checkErr(err, "B_buffer");

	if (B_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
	}
	cl_mem P_buffer = clCreateBuffer(
		context,
		CL_MEM_USE_HOST_PTR,
		sizeof(cl_int) * (polinome_power + 1),
		P_input,
		&err);
	checkErr(err, "P_buffer");

	if (P_buffer == (cl_mem)0)
	{
		throw  "Failed to create input data Buffer\n";
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
		throw  "Failed to create input data Buffer\n";
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

	err = clSetKernelArg(kernel, 6, sizeof(cl_uint), &input_width);
	checkErr(err, "clSetKernelArg : width(7)");

	err = clSetKernelArg(kernel, 7, sizeof(cl_uint),  &polinome_power);
	checkErr(err, "clSetKernelArg : power(3)");

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
