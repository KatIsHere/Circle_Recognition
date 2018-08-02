#include "Features.h"
#include "LoaderAndPrinter.h"
#include "InterpolationAndApproximation.h"
#include "LinearEquations.h"
#include "PolinomeBuilder.h"
#include "Polinoms.h"
#include "Drawing.h"
#include "Hosts.h"
#include <vector>
#include <fstream>
using namespace std;

//#define RENDER_CENTER

const int SIZE_SMALL = 17;
const int SIZE_MEDDIUM = 28;
const int SIZE_LARGE = 32;
//const int POLINOME_POWER_SMALL = 5;
const int POLINOME_POWER_LARGE = 6;
const int POLINOME_POWER_MEDDIUM = 6;
const int POLINOME_POWER = 6;
const int DOTS = 100;

void RenderApproximation(void);
void RenderPoints(void);
void RenderReversed(void);
void Draw(int argc, char ** argv);
void RenderFast(void);

int main(int argc, char ** argv) {
	//Excecute();
	Draw(argc, argv);
	system("pause");
	return 1;
}



void Draw(int argc, char ** argv) {
	int WindowPosX = 70, WindowPosY = 70;
	int WindowHeight = 700, WindowWidth = 1200;

	// Render fast approximation using opencl
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX, WindowPosY);
	glutCreateWindow("Approximation graph, Opencl");
	glutDisplayFunc(RenderFast);

	// Render simple approximation
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX, WindowPosY);
	glutCreateWindow("Approximation graph");
	glutDisplayFunc(RenderApproximation);

	// Points
	//glutInit(&argc, argv);
	//glutInitWindowSize(WindowWidth, WindowHeight);
	//glutInitWindowPosition(WindowPosX + 60, WindowPosY + 60);
	//glutCreateWindow("Real data graph");
	//glutDisplayFunc(RenderPoints);

	// Reversed polinomes
	//glutInit(&argc, argv);
	//glutInitWindowSize(WindowWidth, WindowHeight);
	//glutInitWindowPosition(WindowPosX + 100, WindowPosY + 160);
	//glutCreateWindow("Reversed data graph");
	//glutDisplayFunc(RenderReversed);

	glutMainLoop();
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

void openclCalculatiog_v2(float* x, float*f_x, float* Polinomes, const int& hight, const int& width, const int power) {
	cl_int err;
	cl_int GCPU = 0;
	std::vector< cl::Platform > platformList;
	cl::Platform::get(&platformList);
	checkErr(platformList.size() != 0 ? CL_SUCCESS : -1, "cl::Platform::get");
	cl::Platform default_platform = platformList[GCPU];
	std::cout << "Using platform: " << default_platform.getInfo<CL_PLATFORM_NAME>() << "\n";
	// get default device of the default platform
	std::vector<cl::Device> all_devices;
	default_platform.getDevices(CL_DEVICE_TYPE_ALL, &all_devices);
	if (all_devices.size() == 0) {
		std::cout << " No devices found. Check OpenCL installation!\n";
		exit(1);
	}
	cl::Device default_device = all_devices[GCPU];
	std::cout << "Using device: " << default_device.getInfo<CL_DEVICE_NAME>() << "\n";
	// platform vendor info and create context
	std::string platformVendor;
	platformList[GCPU].getInfo((cl_platform_info)CL_PLATFORM_VENDOR, &platformVendor);
	std::cerr << "Platform is by: " << platformVendor << "\n";
	cl_context_properties cprops[3] = { CL_CONTEXT_PLATFORM, (cl_context_properties)(platformList[GCPU])(), 0 };
	cl::Context context(
		default_device,
		cprops,
		nullptr,
		nullptr,
		&err);
	checkErr(err, "Conext::Context()");

	std::ifstream file("Kernels.cl");
	checkErr(file.is_open() ? CL_SUCCESS : -1, "Kernels.cl");

	std::string prog(
	std::istreambuf_iterator<char>(file),
	(std::istreambuf_iterator<char>()));

	cl::Program::Sources source(
	1,
	std::make_pair(prog.c_str(), prog.length() + 1));

	cl::Program program(context, source);
	err = program.build({default_device});								// for GPU
	err = program.build({ default_device }, "-g -s ..\\..\\Kernels.cl", nullptr);	// for CPU
	if (err == -11) {
	// Determine the size of the log
	auto buildInfo = program.getBuildInfo<CL_PROGRAM_BUILD_LOG>({ default_device }, &err);
	std::cerr << buildInfo << std::endl ;

	}
	checkErr(err, "Program::build()");
	cl::Kernel kernel(program, "build_polinome", &err);
	checkErr(err, "Kernel::Kernel()");
	
	
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
	std::cout<< "Using platform: " << patformName << "\n";
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
	checkErr(err, "clCreateKernel");

	int ret = EXIT_SUCCESS;
		
	// Build kernel
	cl_double* A = new cl_double[power*power];
	cl_double* B = new cl_double[power*hight];
	cl_int* P = new cl_int[power];
	cl_double* T = new cl_double[power];
	try
	{
		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel_DOUBLES(queue, context, default_device, kernel, x, f_x, width, hight, A, B, Polinomes, P, power);
		printf("\nNDRange perf. counter time %f s.\n", ocl_time);

		//cout << "\n\nPolinomes second:\n";
		//for (int i = 0; i < hight; ++i) {
		//	for (int j = 0; j < power; ++j)
		//		cout << Polinomes[i*power + j] << "\t";
		//	cout << "\n";
		//}
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
	delete[]A; delete[]B; delete[]P; delete[]T;
}

//-------------------------------------------------------------------------------------------------------
// SCENE RENDERING

void RenderApproximation(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	//string filepath_LARGE_2 = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=12.txt";
	//string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";
	//double** MatrixSMALL = loadMatrix(filepath_SMALL, SIZE_SMALL, SIZE_SMALL);
	//double* x_SMALL = xCreateSet(0, SIZE_SMALL, SIZE_SMALL);
	//double** polinomes_SMALL = buidPolinome(x_SMALL, MatrixSMALL, SIZE_SMALL, POLINOME_POWER_SMALL, 0); 

	// CONVENTIONAL METHOD
	double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 1);
	//double** MatrixLARGE_2 = loadMatrix(filepath_LARGE_2, SIZE_LARGE, SIZE_LARGE);
	//double* x_LARGE_2 = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	//double** polinomes_LARGE_2 = buidPolinome(x_LARGE_2, MatrixLARGE_2, SIZE_LARGE, POLINOME_POWER_LARGE, 1);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();

	cout << "\nApproximation polinome: \n\n";
	for (int i = 0; i < SIZE_LARGE; ++i) {
		for (int j = 0; j < POLINOME_POWER_LARGE; ++j) {
			printf("C[%d][%d] = %f \t", i, j, polinomes_LARGE[i][j]);
		}
		cout << "\n";
	}

	drawFunctionSet(polinomes_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	//drawFunctionSet(polinomes_LARGE_2, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i) {
		delete[]polinomes_LARGE[i];
		delete[]MatrixLARGE[i];
		//delete[]polinomes_LARGE_2[i];
	}
	delete[]polinomes_LARGE;
	delete[]x_LARGE;
	delete[]MatrixLARGE;
	// delete[]MatrixLARGE_2;

	//for (int i = 0; i < SIZE_SMALL; ++i)
	//	delete[]polinomes_SMALL[i];
	//delete[]polinomes_SMALL;
	//for (int i = 0; i < SIZE_SMALL; ++i)
	//	delete[]MatrixSMALL[i];
	//delete[]MatrixSMALL;
	//delete[]x_SMALL;
}


void RenderReversed(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	double** Matrix = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	double** MatrixLARGE = ReverseMatrix(Matrix, SIZE_LARGE, SIZE_LARGE);
	double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();
	//glOrtho(0, 1, -1, 1, 0.0, 0.0);
	//drawPointsSet(MatrixLARGE, SIZE_LARGE, SIZE_LARGE, 0, SIZE_LARGE);
	drawFunctionSet(polinomes_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]polinomes_LARGE[i];
	delete[]polinomes_LARGE;
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]Matrix[i];
	delete[]Matrix;
	delete[]x_LARGE;
}


void RenderPoints(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	//string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";

	double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glOrtho(0, 1, -1, 1, 0.0, 0.0);
	drawPointsSet(MatrixLARGE, SIZE_LARGE, SIZE_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
}


void RenderFast(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	cl_float* MatrixLARGE = cl_loadFunc(SIZE_LARGE, SIZE_LARGE, filepath_LARGE);
	cl_float* x_LARGE = xCreateCLSet(0, SIZE_LARGE, SIZE_LARGE);
	cl_double* polinomes = new cl_double[POLINOME_POWER_LARGE*SIZE_LARGE];
	openclCalculating(x_LARGE, MatrixLARGE, polinomes, SIZE_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE);


	double** polinomes_LARGE = new double*[SIZE_LARGE];
	//cout << "\n\nPolinomes final:\n";
	float ser = 0;
	for (int i = 0; i < SIZE_LARGE; ++i) {
		polinomes_LARGE[i] = new double[POLINOME_POWER_LARGE];
		for (int j = 0; j < POLINOME_POWER_LARGE; ++j) {
			polinomes_LARGE[i][j] = polinomes[i*SIZE_LARGE + j];
			//cout << polinomes_LARGE[i][j] << "\t";
		}
		//cout << "\n";
	}

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();

	drawFunctionSet(polinomes_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	//drawFunctionSet(polinomes_LARGE_2, SIZE_LARGE, POLINOME_POWER_LARGE, 0, SIZE_LARGE);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < SIZE_LARGE; ++i) {
		delete[]polinomes_LARGE[i];
		//delete[]polinomes_LARGE_2[i];
	}
	delete[]polinomes_LARGE;
	delete[]polinomes;
	delete[]MatrixLARGE;
}