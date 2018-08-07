#include "Features.h"
#include "Polinoms.h"
#include "Drawing.h"
#include "OpenCLCalculations.h"
#include <vector>
#include <fstream>
#include "Classify.h"
#include <filesystem>
using namespace std;
namespace fs = std::experimental::filesystem::v1;
#define POLINOME_POWER_LARGE 6


// GLOBAL VARIABLES
std::string FILEPATH = "train_data/";
const int DOTS = 100;
const int CLASS_COUNT = 7;
int CLASS = 2;
bool PRESED = 1;
AvarageMeaninig AVARAGE(POLINOME_POWER_LARGE - 2);
cl_command_queue queue_; 
cl_context context_; 
cl_device_id device_; 
cl_kernel kernel_poli, kernel_extr;
int Pos;
vector<string> files;
std::vector<ObjectClass> OBJS;


// FUNCTIONS
void RenderApproximation(void);
void RenderPoints(void);
void Draw(int argc, char ** argv);
void RenderFast(void);
void RenderOnePoints(string filepath, const int& height, const int& width);
void RenderOneFast(string filepath, const int& height, const int& width);
void RenderOneApproximation(string filepath, const int& height, const int& width);
int parse_path(const string& filepath, int& height, int& width, int clas, int presed);
void ParseOneClass(AvarageMeaninig& Av, int& startPos, const int& class_count, const bool& pressed, std::ofstream&  file);
void Keyboard(unsigned char key, int x, int y);
void CreateClassificatoin();


int main(int argc, char ** argv) {
	setUpKernel(queue_, context_, device_, kernel_poli, kernel_extr);
	string filename = "Classes.txt";
	OBJS = Read_Classification(filename, POLINOME_POWER_LARGE - 1);

	Draw(argc, argv);
	//CreateClassificatoin();
	clReleaseKernel(kernel_poli);
	clReleaseKernel(kernel_extr);
	clReleaseCommandQueue(queue_);
	clReleaseContext(context_);
	printf("\nPress Enter to exit...");
	cin.get();
	return 1;
}


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

	glutKeyboardFunc(Keyboard);

	glutMainLoop();
}



//-------------------------------------------------------------------------------------------------------
/// SCENE RENDERING, ALL OBJECTS

// Conventional mathod(on CPU)
void RenderApproximation(void) {
	string filepath = files[Pos];
	int height, width;
	int s = parse_path(filepath, height, width, CLASS, PRESED);
	while (s == 0)
	{
		Pos++;
		filepath = files[Pos];
		s = parse_path(filepath, height, width, CLASS, PRESED);
	}
	if (s == -1) {
		cin.get();
		exit(0);
	}
	RenderOneApproximation(filepath, height, width);
}


// Fast method
void RenderFast(void) {
	string filepath = files[Pos];
	int sizeS = files.size();
	int height, width;
	int s = parse_path(filepath, height, width, CLASS, PRESED);
	while (s == 0)
	{
		Pos++;
		filepath = files[Pos];
		s = parse_path(filepath, height, width, CLASS, PRESED);
		if (s == -1) {
			cin.get();
			exit(0);
		}
	}
	RenderOneFast(filepath, height, width);
}


// Render raw data
void RenderPoints(void) {
	string filepath = files[Pos];
	int height, width;
	int s = parse_path(filepath, height, width, CLASS, PRESED);
	while (!s)
	{
		Pos++;
		filepath = files[Pos];
		s = parse_path(filepath, height, width, CLASS, PRESED);
		if (s == -1) {
			AVARAGE.print();
			cin.get();
			exit(0);
		}
	}
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

	drawFunctionSet(polinomes_LARGE, height, POLINOME_POWER_LARGE, 0, width, AVARAGE);
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

	calculatingKernel_poli(queue_, context_, device_, kernel_poli, x_LARGE, MatrixLARGE, polinomes, height, width, POLINOME_POWER_LARGE);
	

	//cl_float* roots = new cl_float[height * (POLINOME_POWER_LARGE - 2)];
	//cl_int* roots_count = new cl_int[height];
	//cl_double* coefs = new cl_double[height * (POLINOME_POWER_LARGE - 1)];
	//for (int i = 0; i < height; ++i) {
	//	roots[i] = 0; roots_count[i] = 0;
	//}

	//for (int i = height; i < height * POLINOME_POWER_LARGE - height; ++i) {
	//	roots[i] = 0; 
	//}

	//for (int i = 0; i < height; ++i) {
	//	for (int j = 0; j < POLINOME_POWER_LARGE - 1; ++j) {
	//		coefs[i*(POLINOME_POWER_LARGE) + j] = polinomes[i*(POLINOME_POWER_LARGE) + j + 1] * (j + 1);
	//		cout << coefs[i*(POLINOME_POWER_LARGE) + j] << "\t";
	//	}
	//}

	//calculatingKernel_extrems(queue_, context_, device_, kernel_extr, coefs, roots, roots_count, (POLINOME_POWER_LARGE - 1), height, 1, width, 1);

	//for (int i = 0; i < height * (POLINOME_POWER_LARGE - 1); ++i) {
	//	cout << roots[i] << "\t";
	//}
	//cout << "\n";
	//for (int i = 0; i < height; ++i)
	//	cout << roots_count[i] << "\t";

	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClearColor(0.98f, 0.98f, 0.98f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();

	drawFunctionSet(polinomes, height, POLINOME_POWER_LARGE, 0, width, CLASS, AVARAGE, OBJS); 
	glutSwapBuffers();

	// DELETE ALL DATA
	delete[]polinomes;
	delete[]MatrixLARGE;
	delete[]x_LARGE;
	// delete[]roots;
	// delete[]roots_count;
	// delete[]coefs;
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


// Filename parser
int parse_path(const string& filepath, int& height, int& width, int clas, int pressed) {
	int _count = 0;
	if (filepath[FILEPATH.size()] == char(clas) + '0' && filepath[FILEPATH.size() + 2] == char(pressed) + '0') {
		for (int i = FILEPATH.size(); i < filepath.size() - 5; ++i) {
			if (filepath[i] == '_')
				_count++;
			if (_count == 3)
			{
				height = (int(filepath[i + 1]) - int('0')) * 10 + int(filepath[i + 2]) - int('0');
				width = (int(filepath[i + 4]) - int('0')) * 10 + int(filepath[i + 5]) - int('0');
				return 1;
			}
		}
	}
	if (filepath[FILEPATH.size()] > char(clas) + '0')// || filepath[FILEPATH.size() + 2] != char(pressed) + '0')
		return -1;
	return 0;
}


// Keyboard functions for GLUT
void Keyboard(unsigned char key, int x, int y){
	switch (key) {
	case 13:	// 'Enter'
		Pos++;
		glutPostRedisplay();
		break;
	case 8:		//'Backspace'
		Pos--;
		glutPostRedisplay();
		break;
	case '1':
		CLASS = 1;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '2':
		CLASS = 2;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '3':
		CLASS = 3;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '4':
		CLASS = 4;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '5':
		CLASS = 5;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '6':
		CLASS = 6;
		Pos = 0;
		glutPostRedisplay();
		break;
	case '7':
		CLASS = 7;
		Pos = 0;
		glutPostRedisplay();
		break;
	case 'p':
		PRESED = true;
		Pos = 0;
		glutPostRedisplay();
		break;
	case ' ':
		PRESED = false;
		Pos = 0;
		glutPostRedisplay();
		break;
	default:
		break;
	}
}


// Classify objects
void CreateClassificatoin() {
	string path;
	std::ofstream  file("Classes.txt", std::ofstream::out);
	for (auto& file : fs::directory_iterator(FILEPATH))
	{
		path = file.path().string();
		files.push_back(path);
	}
	int startPos = 0;
	AvarageMeaninig Av;
	for (int i = 1; i <= CLASS_COUNT; ++i) {
		ParseOneClass(Av, startPos, i, false, file);
		ParseOneClass(Av, startPos, i, true, file);
		printf("Computed class %d!\n", i);
	}
	file.close();
}

void ParseOneClass(AvarageMeaninig& Av, int& startPos, const int& class_count, const bool& pressed, std::ofstream&  file) {
	Av.setNewObj(POLINOME_POWER_LARGE - 2);
	string filepath = files[startPos];
	int height, width;
	int position = startPos;
	int s = parse_path(filepath, height, width, class_count, pressed);
	int numb = 1;
	while (s != -1 && position < files.size() - 1)
	{
		if (s == 1) {
			cl_float* MatrixLARGE = cl_loadFunc(height, width, filepath);
			cl_float* x_LARGE = xCreateCLSet(0, width, width);
			cl_double* polinomes = new cl_double[POLINOME_POWER_LARGE*height];

			calculatingKernel_poli(queue_, context_, device_, kernel_poli, x_LARGE, MatrixLARGE, polinomes, height, width, POLINOME_POWER_LARGE);
			Calculate(polinomes, height, POLINOME_POWER_LARGE, 0, width, class_count, Av, OBJS);
			delete[]polinomes;
			delete[]MatrixLARGE;
			delete[]x_LARGE;
		}
		position++;
		filepath = files[position];
		s = parse_path(filepath, height, width, class_count, pressed);
	}
	startPos = position;
	Av.toFile(file, class_count, pressed);
	// Av.print();
}