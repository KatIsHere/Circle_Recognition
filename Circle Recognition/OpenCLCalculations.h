#pragma once
#include "Hosts.h"
#include <fstream>
#include <string>
using namespace std;

char* read_source(const char *file_name, size_t* file_size);

// Settimg up working kernels
// Choosing the platform --->
//								 0 - GPU
//								 1 - CPU
void setUpKernel(cl_command_queue &queue, cl_context& context, cl_device_id &default_device, 
	cl_kernel &kernel_polinomes, cl_kernel &kernel_extrems){

	const int GCPU = 1;
	const cl_int available_platforms = 2;
	cl_int err;

	// get default platform
	cl_platform_id platformList[available_platforms];
	err = clGetPlatformIDs(available_platforms, platformList, NULL);
	checkErr(err, "clGetPlatformID");
	cl_platform_id default_platform = platformList[GCPU];
	char *patformName = new char[2024];
	err = clGetPlatformInfo(default_platform, CL_PLATFORM_NAME, 1024, patformName, NULL);
	checkErr(err, "clGetDeviceInfo");
	std::cout << "Using platform: " << patformName << "\n";
	delete[]patformName;

	// get default device of the default platform
	cl_device_id deviceList[3];
	err = clGetDeviceIDs(default_platform, CL_DEVICE_TYPE_ALL, available_platforms, deviceList, NULL);
	checkErr(err, "clGetDeviceIDs");
	if (deviceList == nullptr) {
		std::cout << " No devices found. Check OpenCL installation!\n";
		std::cin.get();
		exit(1);
	}
	default_device = deviceList[GCPU];
	char *deviceName = new char[1024];
	err = clGetDeviceInfo(default_device, CL_DEVICE_NAME, 1024, deviceName, NULL);
	checkErr(err, "clGetDeviceInfo");
	std::cout << "Using device: " << deviceName << "\n";
	delete[]deviceName;

	// platform vendor info
	char * platformVendor = new char[1024];
	err = clGetPlatformInfo(default_platform, (cl_platform_info)CL_PLATFORM_VENDOR, 1024, platformVendor, NULL);
	checkErr(err, "clGetPlatformInfo");
	std::cerr << "Platform is by: " << platformVendor << "\n";
	delete[]platformVendor;

	// create context
	printf("\nCreating a compute context for the required device\n");
	context = clCreateContext(NULL, 1, &default_device, NULL, NULL, &err);
	checkErr(err, "clCreateContext");
	printf("\nCreating the compute program from source\n");

	// create kernel
	string CLFileName = "Kernels.cl";
	size_t file_size;

	char * kernel_source = read_source(CLFileName.c_str(), &file_size);

	if (NULL == kernel_source)
	{
		printf("Error: Failed to read kernel source code from file name: %s!\n", CLFileName.c_str());
		clReleaseContext(context);
		std::cin.get();
		exit(1);
	}

	cl_program program = clCreateProgramWithSource(context, 1, (const char **)&kernel_source, NULL, &err);

	queue = clCreateCommandQueue(context, default_device, 0, &err);

	free(kernel_source);
	checkErr(err, "clCreateProgramWithSource");
	printf("\nCompiling the program executable\n");

	err = clBuildProgram(program, 0, NULL, "-g -s Kernels.cl", NULL, NULL);
	//err = clBuildProgram(program, 0, NULL, "Kernels.cl", NULL, NULL);
	if (err != CL_SUCCESS) {
		char *buildFailre = new char[1024];
		clGetProgramBuildInfo(program, default_device, CL_PROGRAM_BUILD_LOG, 1024, buildFailre, NULL);
		std::cerr << "Build Failure: " << buildFailre
			<< "\n Press Enter to exit the program...";
		cin.get();
		delete[]buildFailre;
		exit(1);
	}

	kernel_polinomes = clCreateKernel(program, "build_polinome_double", &err); 
	checkErr(err, "clCreateKernel - build_polinome_double");
	
	kernel_extrems = clCreateKernel(program, "PolinomeFindRoots", &err);	
	checkErr(err, "clCreateKernel - PolinomeFindRoots");
}

// Using a kernel
void calculatingKernel_poli(cl_command_queue &queue, cl_context context, cl_device_id &default_device, cl_kernel &kernel, 
				cl_float* x, cl_float*f_x, cl_double* Polinomes, const int& hight, const int& width, const int power) {
	// Build kernel
	int ret = EXIT_SUCCESS;
	cl_double* A = new cl_double[power*power];
	cl_double* B = new cl_double[power*hight];
	cl_int* P = new cl_int[power];
	try
	{
		//printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel_DOUBLES(queue, context, default_device, kernel,
			x, f_x, width, hight, A, B, Polinomes, P, power);
		//printf("\nNDRange perf. counter time %f s.\n", ocl_time);

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
	delete[]A; delete[]B; delete[]P;
}


void calculatingKernel_extrems(cl_command_queue &queue, cl_context context, cl_device_id &default_device, cl_kernel &kernel,
	cl_double* coefs, cl_float* roots, cl_int* root_count,
	const cl_int& width, const cl_int& hight,
	const double& start, const double& finish, const float& h) {
	// Build kernel
	int ret = EXIT_SUCCESS;
	try
	{
		printf("Executing OpenCL kernel...\n");
		float ocl_time = Extremums_Run_Kernel(queue, context, default_device, kernel,
			coefs, width, hight, start, finish, h, roots, root_count);
		printf("\nNDRange perf. counter time %f s.\n", ocl_time);

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
}


// Helper function
char* read_source(const char *file_name, size_t* file_size)
{
	FILE *file;
	file = fopen(file_name, "rb");
	if (!file) {
		printf("Error: Failed to open file '%s'\n", file_name);
		return NULL;
	}

	if (fseek(file, 0, SEEK_END))
	{
		printf("Error: Failed to seek file '%s'\n", file_name);
		fclose(file);
		return NULL;
	}
	size_t size = ftell(file);
	if (size == 0)
	{
		printf("Error: Failed to check position on file '%s'\n", file_name);
		fclose(file);
		return NULL;
	}

	rewind(file);

	char *src = (char *)malloc(sizeof(char) * size + 1);
	if (!src)
	{
		printf("Error: Failed to allocate memory for file '%s'\n", file_name);
		fclose(file);
		return NULL;
	}
	printf("Reading file '%s' (size %ld bytes)\n", file_name, size);

	size_t res = fread(src, 1, sizeof(char) * size, file);
	if (res != sizeof(char) * size)
	{
		printf("Error: Failed to read file '%s'\n", file_name);
		fclose(file);
		free(src);
		return NULL;
	}

	src[size] = '\0'; // NULL terminated  
	fclose(file);

	*file_size = size;
	return src;
};