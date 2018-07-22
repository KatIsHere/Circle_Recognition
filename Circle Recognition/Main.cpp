#include "Features.h"
#include "LoaderAndPrinter.h"
#include "InterpolationAndApproximation.h"
#include "LinearEquations.h"
#include "PolinomeBuilder.h"
#include "Polinoms.h"
#include "Drawing.h"
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

int main(int argc, char ** argv) {
	//Excecute();
	Draw(argc, argv);
	return 1;
}

void Excecute(){
	
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
	glutDisplayFunc(RenderApproximation);

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


//-------------------------------------------------------------------------------------------------------
// SCENE RENDERING

void RenderApproximation(void) {
	string filepath_LARGE = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=32.txt";
	//string filepath_LARGE_2 = "idle_test_data_set\\idle_4\\2_x=52_y=125_sz=12.txt";
	string filepath_SMALL = "idle_test_data_set\\idle_1\\10_x=45_y=22_sz=17.txt";

	double** MatrixLARGE = loadMatrix(filepath_LARGE, SIZE_LARGE, SIZE_LARGE);
	double** MatrixSMALL = loadMatrix(filepath_SMALL, SIZE_SMALL, SIZE_SMALL);
	double* x_LARGE = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	double* x_SMALL = xCreateSet(0, SIZE_SMALL, SIZE_SMALL);
	double** polinomes_LARGE = buidPolinome(x_LARGE, MatrixLARGE, SIZE_LARGE, POLINOME_POWER_LARGE, 1);
	double** polinomes_SMALL = buidPolinome(x_SMALL, MatrixSMALL, SIZE_SMALL, POLINOME_POWER_SMALL, 0); 
	
	//double** MatrixLARGE_2 = loadMatrix(filepath_LARGE_2, SIZE_LARGE, SIZE_LARGE);
	//double* x_LARGE_2 = xCreateSet(0, SIZE_LARGE, SIZE_LARGE);
	//double** polinomes_LARGE_2 = buidPolinome(x_LARGE_2, MatrixLARGE_2, SIZE_LARGE, POLINOME_POWER_LARGE, 1);
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
	for (int i = 0; i < SIZE_SMALL; ++i)
		delete[]polinomes_SMALL[i];
	delete[]polinomes_SMALL;
	for (int i = 0; i < SIZE_LARGE; ++i) {
		delete[]MatrixLARGE[i];
		//delete[]MatrixLARGE_2[i];
	}
	delete[]MatrixLARGE;// delete[]MatrixLARGE_2;
	for (int i = 0; i < SIZE_SMALL; ++i)
		delete[]MatrixSMALL[i];
	delete[]MatrixSMALL;
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

