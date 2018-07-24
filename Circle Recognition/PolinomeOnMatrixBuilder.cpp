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
const int SIZE_SMALL = 17;
const int SIZE_MEDDIUM = 28;
const int SIZE_LARGE = 32;
const int POLINOME_POWER = 7;
const double TOLERANCE = 0.5;

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

// kernel one
double Approx_Polinomes_Run_Kernel(OpenCLBasic &oclobjects, OpenCLProgramOneKernel &executable, 
									cl_double* x_input, cl_double *f_input, 
									cl_int input_width, cl_int input_hight,
									cl_double* A_input, cl_double *B_input, cl_double *C_input, cl_double *P_input,
									cl_int polinome_power) {
	double   perf_start;
	double   perf_stop;

	cl_int err = CL_SUCCESS;
	cl_int numStages = 0;
	cl_uint temp;

	cl_int stage;
	cl_int passOfStage;

	// CREATING BUFFERS FOR x, f, A, b, P and C
	// AND CHECKING FOR ERRORS
	cl_mem x_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * input_width, oclobjects.device),
		x_input,
		&err);
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem f_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * input_hight * input_width, oclobjects.device),
		f_input,
		&err);
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem A_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * input_hight * polinome_power, oclobjects.device),
		A_input,
		&err);
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem B_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * polinome_power, oclobjects.device),
		B_input,
		&err);
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem P_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * input_hight * polinome_power, oclobjects.device),
		P_input,
		&err);
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}
	cl_mem C_input_buffer = clCreateBuffer(
		oclobjects.context,
		CL_MEM_USE_HOST_PTR,
		zeroCopySizeAlignment(sizeof(cl_double) * polinome_power, oclobjects.device),
		C_input,
		&err);
	// checking for errors
	SAMPLE_CHECK_ERRORS(err);

	if (x_input_buffer == (cl_mem)0)
	{
		throw Error("Failed to create input data Buffer\n");
	}


	for (temp = input_hight; temp > 2; temp >>= 1)
	{
		numStages++;
	}
	

	// SETTING UP KERNEL ARGUMENTS + CHECKING FOR ERRORS
	err = clSetKernelArg(executable.kernel, 0, sizeof(cl_mem), (void *)&x_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 1, sizeof(cl_mem), (void *)&f_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 2, sizeof(cl_mem), (void *)&C_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 3, sizeof(cl_uint), (void *)&polinome_power);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 4, sizeof(cl_mem), (void *)&A_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 5, sizeof(cl_mem), (void *)&B_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 6, sizeof(cl_mem), (void *)&P_input_buffer);
	SAMPLE_CHECK_ERRORS(err);

	err = clSetKernelArg(executable.kernel, 7, sizeof(cl_uint), (void *)&input_width);
	SAMPLE_CHECK_ERRORS(err);


	perf_start = time_stamp();
	const int TS = 8;
	const size_t local[2] = { TS, TS };
	const size_t global[2] = { input_hight, input_width };
	err = clEnqueueNDRangeKernel(oclobjects.queue, executable.kernel,
		2,		// Two dimensions
		nullptr,
		global,
		local,
		0, nullptr, nullptr);
	SAMPLE_CHECK_ERRORS(err);

	perf_stop = time_stamp();

	void* tmp_ptr = nullptr;
	tmp_ptr = clEnqueueMapBuffer(oclobjects.queue, C_input_buffer, true, CL_MAP_READ, 0, sizeof(cl_double) * polinome_power, 0, nullptr, nullptr, &err);
	SAMPLE_CHECK_ERRORS(err);
	if (tmp_ptr != C_input)
	{
		throw Error("clEnqueueMapBuffer failed to return original pointer\n");
	}

	err = clFinish(oclobjects.queue);
	SAMPLE_CHECK_ERRORS(err);

	err = clEnqueueUnmapMemObject(oclobjects.queue, C_input_buffer, tmp_ptr, 0, NULL, NULL);
	SAMPLE_CHECK_ERRORS(err);

	// RELEASING BUFFERS
	err = clReleaseMemObject(x_input_buffer);
	SAMPLE_CHECK_ERRORS(err); 
	err = clReleaseMemObject(f_input_buffer);
	SAMPLE_CHECK_ERRORS(err); 
	err = clReleaseMemObject(A_input_buffer);
	SAMPLE_CHECK_ERRORS(err); 
	err = clReleaseMemObject(B_input_buffer);
	SAMPLE_CHECK_ERRORS(err); 
	err = clReleaseMemObject(P_input_buffer);
	SAMPLE_CHECK_ERRORS(err); 
	err = clReleaseMemObject(C_input_buffer);

	return (float)(perf_stop - perf_start);
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

cl_double* xCreateCLSet(double start, double finish, const int& N) {
	if (finish < start)
		throw "invalid argument";
	double h = double(finish - start) / (N - 1);
	cl_double* x = new cl_double[N];
	for (int i = 0; i < N; ++i) {
		x[i] = (cl_double)start + h * i;
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
		time = double(end - begin) / CLOCKS_PER_SEC;
		std::cout << "\n ELAPCED TIME: " << time << "\n";
	}

	return polinomes;
}



/*
* Builds a set of approximation polinomes on a matrix --- one polinome per a row
* Uses OpenCl for optimization
* Counts computational time, and prints it, if (printTime == true)
* Returns a matrix of polinome coeficients
*/
int buidPolinomeWithOpenCL(int argc, const char** argv, cl_double* x, cl_double* f_x, cl_double* C, const cl_int& MatrSize, const cl_int& power) {
	int ret = EXIT_SUCCESS;
	cl_int* p_input = NULL;
	cl_int* p_ref = NULL;
	try
	{
		// Define and parse command-line arguments.
		CmdParserCommon cmdparser(argc, argv);

		CmdOption<bool> reverse_sort(cmdparser, 0, "reverse-sort", "", "performs descending sort (default is ascending).", false);

		CmdOption<int> array_size(cmdparser, 's', "size", "<integer>", "input/output array size.", 33554432);
		cmdparser.parse();

		// Immediatly exit if user wanted to see the usage information only.
		if (cmdparser.help.isSet())
		{
			return EXIT_SUCCESS;
		}

		// Create the necessary OpenCL objects up to device queue.
		OpenCLBasic oclobjects(
			cmdparser.platform.getValue(),
			cmdparser.device_type.getValue(),
			cmdparser.device.getValue()
		);

		// Build kernel
		OpenCLProgramOneKernel executable(oclobjects, L"Kernel.cl", "", "build_polinome");
		
		cl_double* A = new cl_double[power*power];
		cl_double* B = new cl_double[power];
		cl_double* P = new cl_double[power];
		

		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel(oclobjects, executable, x, f_x, MatrSize, MatrSize, A, B, C, P, power);

		//bool result = true;
		//printf("Performing verification...\n");
		//for (cl_int i = 0; i < array_size.getValue(); i++)
		//{
		//	if (p_input[i] != p_ref[i])
		//	{
		//		result = false;
		//		break;
		//	}
		//}
		//if (!result)
		//{
		//	printf("ERROR: Verification failed.\n");
		//	ret = EXIT_FAILURE;
		//}
		//else
		//{
		//	printf("Verification succeeded.\n");
		//}
		printf("NDRange perf. counter time %f ms.\n", 1000.0f*ocl_time);
	}
	catch (const CmdParser::Error& error)
	{
		cerr
			<< "[ ERROR ] In command line: " << error.what() << "\n"
			<< "Run " << argv[0] << " -h for usage info.\n";
		ret = EXIT_FAILURE;
	}
	catch (const Error& error)
	{
		cerr << "[ ERROR ] Sample application specific error: " << error.what() << "\n";
		ret = EXIT_FAILURE;
	}
	catch (const std::exception& error)
	{
		cerr << "[ ERROR ] " << error.what() << "\n";
		ret = EXIT_FAILURE;
	}
	catch (...)
	{
		cerr << "[ ERROR ] Unknown/internal error happened.\n";
		ret = EXIT_FAILURE;
	}

	aligned_free(p_ref);
	aligned_free(p_input);
	return ret;
}
