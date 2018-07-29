#include "Features.h"
#include "LoaderAndPrinter.h"
#include "InterpolationAndApproximation.h"
#include "LinearEquations.h"
#include "PolinomeBuilder.h"
#include "Polinoms.h"
#include "Drawing.h"
#include <vector>
#include <fstream>
using namespace std;

//#define RENDER_CENTER

const int SIZE_SMALL = 17;
const int SIZE_MEDDIUM = 28;
const int SIZE_LARGE = 32;
const int POLINOME_POWER_SMALL = 5;
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
	return 1;
}



void Draw(int argc, char ** argv) {
	int WindowPosX = 70, WindowPosY = 70;
	int WindowHeight = 700, WindowWidth = 1200;

	// Draw a window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX, WindowPosY);
	glutCreateWindow("Approximation graph");
	glutDisplayFunc(RenderFast);

	glutInit(&argc, argv);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX + 60, WindowPosY + 60);
	glutCreateWindow("Real data graph");
	glutDisplayFunc(RenderPoints);

	//glutInit(&argc, argv);
	//glutInitWindowSize(WindowWidth, WindowHeight);
	//glutInitWindowPosition(WindowPosX + 100, WindowPosY + 160);
	//glutCreateWindow("Reversed data graph");
	//glutDisplayFunc(RenderReversed);

	glutMainLoop();
}


inline void
checkErr(cl_int err, const char * name)
{
	if (err != CL_SUCCESS) {
		std::cerr << "ERROR: " << name
			<< " (" << err << ")" << std::endl;
		exit(EXIT_FAILURE);
	}
}

void openclCalculating(float* x, float*f_x, float* Polinomes, const int& hight, const int& width, const int power) {

	// the default platform
	cl_int err;
	std::vector< cl::Platform > platformList;
	cl::Platform::get(&platformList);
	checkErr(platformList.size() != 0 ? CL_SUCCESS : -1, "cl::Platform::get");
	cl::Platform default_platform = platformList[0];
	std::cout << "Using platform: " << default_platform.getInfo<CL_PLATFORM_NAME>() << "\n";
	
	// get default device of the default platform
	std::vector<cl::Device> all_devices;
	default_platform.getDevices(CL_DEVICE_TYPE_ALL, &all_devices);
	if (all_devices.size() == 0) {
		std::cout << " No devices found. Check OpenCL installation!\n";
		exit(1);
	}
	cl::Device default_device = all_devices[0];
	std::cout << "Using device: " << default_device.getInfo<CL_DEVICE_NAME>() << "\n";

	std::string platformVendor;
	platformList[0].getInfo((cl_platform_info)CL_PLATFORM_VENDOR, &platformVendor);
	std::cerr << "Platform is by: " << platformVendor << "\n";
	cl_context_properties cprops[3] =
	{ CL_CONTEXT_PLATFORM, (cl_context_properties)(platformList[0])(), 0 };

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
	err = program.build({default_device});
	checkErr(file.is_open() ? CL_SUCCESS : -1, "Program::build()");
	cl::Kernel kernel(program, "build_polinome", &err);
	checkErr(err, "Kernel::Kernel()");

	int ret = EXIT_SUCCESS;
	cl_int* p_input = NULL;
	cl_int* p_ref = NULL;
	try
	{
		// Build kernel
		cl_float* A = new cl_float[power*power];
		cl_float* B = new cl_float[power];
		cl_float* P = new cl_float[power];

		printf("Executing OpenCL kernel...\n");
		float ocl_time = Approx_Polinomes_Run_Kernel(context, default_device, kernel, x, f_x, width, hight, A, B, Polinomes, P, power);

		printf("NDRange perf. counter time %f ms.\n", 1000.0f*ocl_time);
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
	//double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	//double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	//double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 1);
	//double** MatrixLARGE_2 = loadMatrix(filepath_LARGE_2, SIZE_LARGE, SIZE_LARGE);
	//double* x_LARGE_2 = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	//double** polinomes_LARGE_2 = buidPolinome(x_LARGE_2, MatrixLARGE_2, SIZE_LARGE, POLINOME_POWER_LARGE, 1);


	//Optimized OPENCL methods

	cl_float* MatrixLARGE = cl_loadFunc( SIZE_LARGE, SIZE_LARGE, filepath_LARGE);
	cl_float* x_LARGE = xCreateCLSet(0, SIZE_LARGE, SIZE_LARGE);
	cl_float* polinomes= new cl_float[POLINOME_POWER_LARGE*SIZE_LARGE];
	//buidPolinomeWithOpenCL(x_LARGE, MatrixLARGE, polinomes, SIZE_LARGE, POLINOME_POWER_LARGE);

	double** polinomes_LARGE = new double*[SIZE_LARGE];
	for (int i = 0; i < SIZE_LARGE; ++i) {
		polinomes_LARGE[i] = new double[POLINOME_POWER_LARGE];
		for (int j = 0; j < POLINOME_POWER_LARGE; ++j) {
			polinomes_LARGE[i][j] = polinomes[i*SIZE_LARGE + j];
		}
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
	//delete[]C;
	//for (int i = 0; i < SIZE_SMALL; ++i)
	//	delete[]polinomes_SMALL[i];
	//delete[]polinomes_SMALL;
	//for (int i = 0; i < SIZE_LARGE; ++i) {
		//delete[]MatrixLARGE[i];
		//delete[]MatrixLARGE_2[i];
	//}
	 // delete[]MatrixLARGE_2;
	//for (int i = 0; i < SIZE_SMALL; ++i)
	//	delete[]MatrixSMALL[i];
	//delete[]MatrixSMALL;
	//delete[]x_LARGE;
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
	//delete[]x_LARGE;
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
	cl_float* polinomes = new cl_float[POLINOME_POWER_LARGE*SIZE_LARGE];
	openclCalculating(x_LARGE, MatrixLARGE, polinomes, SIZE_LARGE, SIZE_LARGE, POLINOME_POWER_LARGE);


	double** polinomes_LARGE = new double*[SIZE_LARGE];
	for (int i = 0; i < SIZE_LARGE; ++i) {
		polinomes_LARGE[i] = new double[POLINOME_POWER_LARGE];
		for (int j = 0; j < POLINOME_POWER_LARGE; ++j) {
			polinomes_LARGE[i][j] = polinomes[i*SIZE_LARGE + j];
		}
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