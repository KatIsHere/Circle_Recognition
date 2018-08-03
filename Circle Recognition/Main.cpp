#include "Features.h"
#include "LoaderAndPrinter.h"
#include "InterpolationAndApproximation.h"
#include "LinearEquations.h"
#include "PolinomeBuilder.h"
#include "Polinoms.h"
#include "Drawing.h"
#include "OpenCLCalculations.h"
#include <vector>
#include <fstream>
//#include <experimental/filesystem>
#include <filesystem>
using namespace std;
namespace fs = std::experimental::filesystem::v1;
std::string FILEPATH = "Image_recognition/";


//#define RENDER_CENTER

const int POLINOME_POWER_LARGE = 6;
const int DOTS = 100;
cl_command_queue queue_; cl_context context_; cl_device_id device_; cl_kernel kernel_;

void RenderApproximation(void);
void RenderPoints(void);
void RenderReversed(void);
void Draw(int argc, char ** argv);
void RenderFast(void);
void RenderOnePoints(string filepath, const int& height, const int& width);
void RenderOneFast(string filepath, const int& height, const int& width);
void RenderOneApproximation(string filepath, const int& height, const int& width);
void RenderOneReversed(string filepath, const int& height, const int& width);
void parse_path(const string& filepath, int& height, int& width);
void Keyboard(unsigned char key, int x, int y);

int main(int argc, char ** argv) {
	//Excecute();
	setUpKernel(queue_, context_, device_, kernel_);
	Draw(argc, argv);
	clReleaseKernel(kernel_);
	clReleaseCommandQueue(queue_);
	clReleaseContext(context_);
	return 1;
}

int Pos;
vector<string> files;


//-------------------------------------------------------------------------------------------------------
// main glut loop
void Draw(int argc, char ** argv) {
	int WindowPosX = 70, WindowPosY = 70;
	int WindowHeight = 700, WindowWidth = 1200;
	// All files to render
	//vector<string> files;
	string path;
	for (auto& file : fs::directory_iterator(FILEPATH))
	{
		path = file.path().string();
		files.push_back(path);
	}

	Pos = 0;

	// Render fast approximation using opencl
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(WindowPosX, WindowPosY);
	glutCreateWindow("Approximation graph, Opencl");
	glutDisplayFunc(RenderFast);

	//// Render simple approximation
	//glutInit(&argc, argv);
	//glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	//glutInitWindowSize(WindowWidth, WindowHeight);
	//glutInitWindowPosition(WindowPosX, WindowPosY);
	//glutCreateWindow("Approximation graph");
	//glutDisplayFunc(RenderApproximation);

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

	glutKeyboardFunc(Keyboard);

	glutMainLoop();
}


//-------------------------------------------------------------------------------------------------------
/// SCENE RENDERING, ALL OBJECTS

// CONVENTIONAL METHOD
void RenderApproximation(void) {
	// string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	// string filepath_LARGE = "Image_recognition\\25_x=15_y=54_h=15_w=20.txt";
	// double height = 24;
	// double width = 20;
	 //string filepath_LARGE = "Image_recognition\\5_x=16_y=57_h=15_w=12.txt";
	 //double height = 15;
	 //double width = 12;
	//string filepath_LARGE = "Image_recognition\\32_h=28_w=26.txt";
	//double height = 28;
	//double width = 26;

	string filepath = files[Pos];
	int height, width;
	parse_path(filepath, height, width);
	RenderOneApproximation(filepath, height, width);
}


// Fast method
void RenderFast(void) {
	//string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	/*string filepath_LARGE = "Image_recognition\\25_x=52_y=127_h=32_w=29.txt"; 
	double height = 32;
	double width = 29;*/

	string filepath = files[Pos];
	int height, width;
	parse_path(filepath, height, width);
	RenderOneFast(filepath, height, width);
}


void RenderReversed(void) {
	string filepath = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	int height, width;
	parse_path(filepath, height, width);
	RenderOneReversed(filepath, height, width);
}


void RenderPoints(void) {
	string filepath = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	//string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";

	int height = 32, width = 32;
	RenderOnePoints(filepath, height, width);
}


//-------------------------------------------------------------------------------------------------------
/// ONE OBJECT RENDERING:
void RenderOneApproximation(string filepath, const int& height, const int& width) {
	double** MatrixLARGE = loadMatrix(filepath, height, width);
	double* x_LARGE = xCreateSet(0, width, width);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, height, width, POLINOME_POWER_LARGE, 1);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();

	drawFunctionSet(polinomes_LARGE, height, POLINOME_POWER_LARGE, 0, width);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < height; ++i) {
		delete[]polinomes_LARGE[i];
		delete[]MatrixLARGE[i];
	}
	delete[]polinomes_LARGE;
	delete[]x_LARGE;
	delete[]MatrixLARGE;
}


void RenderOneFast(string filepath, const int& height, const int& width) {
	cl_float* MatrixLARGE = cl_loadFunc(height, width, filepath);
	cl_float* x_LARGE = xCreateCLSet(0, width, width);
	cl_double* polinomes = new cl_double[POLINOME_POWER_LARGE*height];

	//openclCalculating(x_LARGE, MatrixLARGE, polinomes, height, width, POLINOME_POWER_LARGE);
	calculatingKernel(queue_, context_, device_, kernel_, x_LARGE, MatrixLARGE, polinomes, height, width, POLINOME_POWER_LARGE);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();

	drawFunctionSet(polinomes, height, POLINOME_POWER_LARGE, 0, width); //, extremums_x, extremums_y);
	glutSwapBuffers();

	// DELETE ALL DATA
	delete[]polinomes;
	delete[]MatrixLARGE;
	delete[]x_LARGE;
}


void RenderOneReversed(string filepath, const int& height, const int& width) {
	double** Matrix = loadMatrix(filepath, height, width);
	double** MatrixLARGE = ReverseMatrix(Matrix, height, width);
	double* x_LARGE = xCreateSet(0, height, height);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, width, height, POLINOME_POWER_LARGE, 0);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Reset transformations
	glLoadIdentity();
	drawFunctionSet(polinomes_LARGE, width, POLINOME_POWER_LARGE, 0, height);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < width; ++i)
		delete[]polinomes_LARGE[i];
	delete[]polinomes_LARGE;
	for (int i = 0; i < width; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
	for (int i = 0; i < height; ++i)
		delete[]Matrix[i];
	delete[]Matrix;
	delete[]x_LARGE;
}


void RenderOnePoints(string filepath, const int& height, const int& width) {
	double** MatrixLARGE = loadMatrix(filepath, height, width);

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glOrtho(0, 1, -1, 1, 0.0, 0.0);
	drawPointsSet(MatrixLARGE, height, width, 0, width);
	glutSwapBuffers();

	// DELETE ALL DATA
	for (int i = 0; i < height; ++i)
		delete[]MatrixLARGE[i];
	delete[]MatrixLARGE;
}


// filename parser
void parse_path(const string& filepath, int& height, int& width) {
	bool flag_h, flag_w;
	int h_d, w_d;
	for (int i = 0; i < filepath.size() - 4; ++i) {
		if (filepath[i] == '_' &&  filepath[i + 2] == '=') {
			if (filepath[i + 1] == 'h') {
				h_d = (filepath[i + 3] <= '9' && filepath[i + 3] >= '0') * ((int)filepath[i + 3] - int('0'));
				if (filepath[i + 4] <= '9' && filepath[i + 4] >= '0')
					height = h_d * 10 + ((int)filepath[i + 4] - int('0'));
				else
					height = h_d;
			}
			if (filepath[i + 1] == 'w') {
				w_d = (filepath[i + 3] <= '9' && filepath[i + 3] >= '0') * ((int)filepath[i + 3] - int('0'));
				if (filepath[i + 4] <= '9' && filepath[i + 4] >= '0')
					width = w_d * 10 + ((int)filepath[i + 4] - int('0'));
				else
					width = w_d;
			}
		}
	}
}


// Keyboard functions
void Keyboard(unsigned char key, int x, int y){
	switch (key) {
	case 13:	// 'Enter'
		Pos++;
		cout << "Enter registered\n";
		glutPostRedisplay();
		break;
	case ' ':	// 'Space'
		cout << "Space registered\n";
		glutPostRedisplay();
		break;
	case 8:		//'Backspace'
		Pos--;
		cout << "Backspace registered\n";
		glutPostRedisplay();
		break;
	//case 27:	// esc
	//	glutLeaveGameMode();
	//	//glutLeaveMainLoop();
	//	break;
	default:
		break;
	}
}