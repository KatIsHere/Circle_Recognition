#pragma once
#include "Hosts.h"
#include <fstream>
#include <string>
using namespace std;
//void openclCalculatiog_v2(float* x, float*f_x, float* Polinomes, const int& hight, const int& width, const int power) {
//	cl_int err;
//	cl_int GCPU = 0;
//	std::vector< cl::Platform > platformList;
//	cl::Platform::get(&platformList);
//	checkErr(platformList.size() != 0 ? CL_SUCCESS : -1, "cl::Platform::get");
//	cl::Platform default_platform = platformList[GCPU];
//	std::cout << "Using platform: " << default_platform.getInfo<CL_PLATFORM_NAME>() << "\n";
//	// get default device of the default platform
//	std::vector<cl::Device> all_devices;
//	default_platform.getDevices(CL_DEVICE_TYPE_ALL, &all_devices);
//	if (all_devices.size() == 0) {
//		std::cout << " No devices found. Check OpenCL installation!\n";
//		exit(1);
//	}
//	cl::Device default_device = all_devices[GCPU];
//	std::cout << "Using device: " << default_device.getInfo<CL_DEVICE_NAME>() << "\n";
//	// platform vendor info and create context
//	std::string platformVendor;
//	platformList[GCPU].getInfo((cl_platform_info)CL_PLATFORM_VENDOR, &platformVendor);
//	std::cerr << "Platform is by: " << platformVendor << "\n";
//	cl_context_properties cprops[3] = { CL_CONTEXT_PLATFORM, (cl_context_properties)(platformList[GCPU])(), 0 };
//	cl::Context context(
//		default_device,
//		cprops,
//		nullptr,
//		nullptr,
//		&err);
//	checkErr(err, "Conext::Context()");
//
//	std::ifstream file("Kernels.cl");
//	checkErr(file.is_open() ? CL_SUCCESS : -1, "Kernels.cl");
//
//	std::string prog(
//		std::istreambuf_iterator<char>(file),
//		(std::istreambuf_iterator<char>()));
//
//	cl::Program::Sources source(
//		1,
//		std::make_pair(prog.c_str(), prog.length() + 1));
//
//	cl::Program program(context, source);
//	err = program.build({ default_device });								// for GPU
//	err = program.build({ default_device }, "-g -s ..\\..\\Kernels.cl", nullptr);	// for CPU
//	if (err == -11) {
//		// Determine the size of the log
//		auto buildInfo = program.getBuildInfo<CL_PROGRAM_BUILD_LOG>({ default_device }, &err);
//		std::cerr << buildInfo << std::endl;
//
//	}
//	checkErr(err, "Program::build()");
//	cl::Kernel kernel(program, "build_polinome", &err);
//	checkErr(err, "Kernel::Kernel()");
//
//
//}
char* read_source(const char *file_name, size_t* file_size);

void openclCalculating_with_extremums(cl_float* x, cl_float*f_x, cl_double* Polinomes, const int& hight, const int& width, const int power, const float& xTo, const float& xFrom, 
						cl_float* x_extrems, cl_float* y_extrems) {
	// Choosing the platform --->
	//  0 - GPU
	//  1 - CPU
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
	cl_device_id default_device = deviceList[GCPU];
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
	cl_context context = clCreateContext(NULL, 1, &default_device, NULL, NULL, &err);
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

	cl_command_queue queue_polinomes = clCreateCommandQueue(context, default_device, 0, &err);
	//cl_command_queue queue_extrems = clCreateCommandQueue(context, default_device, 0, &err);

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

	cl_kernel kernel = clCreateKernel(program, "build_polinome_double", &err);
	checkErr(err, "clCreateKernel - build_polinome_double");
	//cl_kernel kernel_extremums = clCreateKernel(program, "Extremums_Newton", &err);
	//checkErr(err, "clCreateKernel - Extremums_Newton");
	int ret = EXIT_SUCCESS;

	// Build kernel
	cl_double* A = new cl_double[power*power];
	cl_double* B = new cl_double[power*hight];
	cl_int* P = new cl_int[power];
	cl_float* firstDer = new cl_float[hight*(power - 1)];
	cl_float* secDer = new cl_float[hight*(power - 2)];
	//cl_float* start = new cl_float[hight];
	/*for (int i = 0; i < hight; ++i)
		start[i] = xFrom;*/
	try
	{
		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel_DOUBLES(queue_polinomes, context, default_device, kernel, 
					x, f_x, width, hight, A, B, Polinomes, P, power);
		//ocl_time += Extremums_Run_Kernel(queue_extrems, context, default_device, kernel_extremums, 
		//			Polinomes, power, hight, xFrom, xTo, firstDer, secDer, x_extrems, y_extrems, 0.0001);
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
	clReleaseKernel(kernel);
	clReleaseCommandQueue(queue_polinomes);
	//clReleaseCommandQueue(queue_extrems);
	//clReleaseKernel(kernel_extremums);

	clReleaseProgram(program);
	clReleaseContext(context);
	delete[]A; delete[]B; delete[]P; 
}


void openclCalculating(cl_float* x, cl_float*f_x, cl_double* Polinomes, const int& hight, const int& width, const int power) {
	// Choosing the platform --->
	//  0 - GPU
	//  1 - CPU
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
	cl_device_id default_device = deviceList[GCPU];
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
	cl_context context = clCreateContext(NULL, 1, &default_device, NULL, NULL, &err);
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

	cl_command_queue queue = clCreateCommandQueue(context, default_device, 0, &err);

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

	cl_kernel kernel = clCreateKernel(program, "build_polinome_double", &err);
	checkErr(err, "clCreateKernel - build_polinome_double");
	int ret = EXIT_SUCCESS;

	// Build kernel
	cl_double* A = new cl_double[power*power];
	cl_double* B = new cl_double[power*hight];
	cl_int* P = new cl_int[power];
	try
	{
		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel_DOUBLES(queue, context, default_device, kernel, 
					x, f_x, width, hight, A, B, Polinomes, P, power);
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
	clReleaseKernel(kernel);
	clReleaseCommandQueue(queue);

	clReleaseProgram(program);
	clReleaseContext(context);
	delete[]A; delete[]B; delete[]P;
}

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


void setUpKernel(cl_command_queue &queue, cl_context& context, cl_device_id &default_device, cl_kernel &kernel){
	//, string CLFileName, char* kernel_func) {
	// Choosing the platform --->
	//  0 - GPU
	//  1 - CPU
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

	kernel = clCreateKernel(program, "build_polinome_double", &err); //"build_polinome_double"
	checkErr(err, "clCreateKernel - build_polinome_double");
	int ret = EXIT_SUCCESS;

	/*
	clReleaseKernel(kernel);
	clReleaseCommandQueue(queue);

	clReleaseProgram(program);
	clReleaseContext(context);*/
}

void calculatingKernel(cl_command_queue &queue, cl_context context, cl_device_id &default_device, cl_kernel &kernel, 
				cl_float* x, cl_float*f_x, cl_double* Polinomes, const int& hight, const int& width, const int power) {
	// Build kernel
	int ret = EXIT_SUCCESS;
	cl_double* A = new cl_double[power*power];
	cl_double* B = new cl_double[power*hight];
	cl_int* P = new cl_int[power];
	try
	{
		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel_DOUBLES(queue, context, default_device, kernel,
			x, f_x, width, hight, A, B, Polinomes, P, power);
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
	//clReleaseKernel(kernel);
	//clReleaseCommandQueue(queue);

	//clReleaseProgram(program);
	//clReleaseContext(context);
	delete[]A; delete[]B; delete[]P;
}


