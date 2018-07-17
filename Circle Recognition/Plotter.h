#pragma once
#include "Plotter.h"
#include<iostream>
#include <cstring>
#include <sstream>
#include "glutdlls37beta/glut.h"
template<typename T>
float normalizeNumber(T value, T a, T b, float move = 0.1) {
	double midl = double(b - a) / 2;
	double res = double(value - a - midl) / (midl + midl * move);
	return res;
}


template<typename T>
void plotFunctionWithOrtho2D(T* xSet, T* Fset, const int& setSize,
	T maxX, T minX, T maxY, T minY,
	float colorRed = 0.5, float colorGreen = 0.5, float colorBlue = 0.5,
	float thikness = 1.2) {
	float x, f;
	glLineWidth(thikness);
	glBegin(GL_LINE_STRIP);
	for (int i = 0; i < setSize; ++i) {
		x = normalizeNumber(xSet[i], minX, maxX);
		f = normalizeNumber(Fset[i], minY, maxY);
		glVertex3f(x, f, 0.0);
		glColor3f(colorRed, colorGreen, colorBlue);
	}
	glEnd();
}


template<typename T>
void plotPointsWithOrtho2D(T* xSet, T* Fset, const int& setSize,
	T maxX, T minX, T maxY, T minY,
	float colorRed = 1.0, float colorGreen = 0.5, float colorBlue = 0.0,
	float thikness = 2) {
	float x, f;
	glPointSize(thikness);
	glBegin(GL_POINTS);
	for (int i = 0; i < setSize; ++i) {
		x = normalizeNumber(xSet[i], minX, maxX);
		f = normalizeNumber(Fset[i], minY, maxY);
		glVertex3f(x, f, 0.0);
		glColor3f(colorRed, colorGreen, colorBlue);
	}
	glEnd();
}


template<typename T>
inline void plotFunctionWithOrtho3D(T* xSet, T* ySet, T*zSet, const int& setSize,
	T maxX, T minX, T maxY, T minY, T maxZ, T minZ,
	float colorRed = 0.5, float colorGreen = 0.5, float colorBlue = 0.5,
	float thikness = 1) {
	glLineWidth(thikness);
	glBegin(GL_LINE_STRIP);
	for (int i = 0; i < setSize; ++i) {
		glVertex3f((float)xSet[i], (float)ySet[i], (float)zSet[i]);
		glColor3f(colorRed, colorGreen, colorBlue);
	}
	glEnd();
}


inline void RenderString(float x, float y, char* str, const int& len) {
	glRasterPos2f(x, y);
	for (int i = 0; i < len; ++i) {
		glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_10, str[i]);
	}
}

inline void RenderString(float x, float y, std::string str) {
	glRasterPos2f(x, y);
	int len = str.size();
	for (int i = 0; i < len; ++i) {
		glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_10, str[i]);
	}
}


void Draw_XY_Axis(double xFrom, double xTo, double yFrom, double yTo,
	double xZero, double yZero, const int& divisions = 15) {
	float minXaxis = normalizeNumber(xFrom, xFrom, xTo);
	float minYaxis = normalizeNumber(yFrom, yFrom, yTo);
	float maxXaxis = normalizeNumber(xTo, xFrom, xTo);
	float maxYaxis = normalizeNumber(yTo, yFrom, yTo);
	xZero = (float)normalizeNumber(xZero, xFrom, xTo);
	yZero = (float)normalizeNumber(yZero, yFrom, yTo);

	// X AXIS
	glLineWidth(1);
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(minXaxis - 0.05, yZero, 0.0f);
	glVertex3f(maxXaxis + 0.05, yZero, 0.0f);
	glEnd();
	// Y AXIS
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(xZero, minYaxis - 0.05, 0.0f);
	glVertex3f(xZero, maxYaxis + 0.05, 0.0f);
	glEnd();


	// X AXIS ARROWS
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(maxXaxis + 0.03, yZero + 0.025, 0.0f);
	glVertex3f(maxXaxis + 0.05, yZero, 0.0f);
	glEnd();
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(maxXaxis + 0.03, yZero - 0.025, 0.0f);
	glVertex3f(maxXaxis + 0.05, yZero, 0.0f);
	glEnd();

	// X AXIS ARROWS
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(xZero + 0.015, maxYaxis + 0.025, 0.0f);
	glVertex3f(xZero, maxYaxis + 0.05, 0.0f);
	glEnd();
	glBegin(GL_LINES);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(xZero - 0.015, maxYaxis + 0.025, 0.0f);
	glVertex3f(xZero, maxYaxis + 0.05, 0.0f);
	glEnd();

	// RENDERING VALUES ON AXISES
	std::string strX, strY;
	float posX, posY;
	float hxPos = (maxXaxis - minXaxis) / (divisions - 1), hyPos = (maxYaxis - minYaxis) / (divisions - 1);
	float xH = (xTo - xFrom) / divisions, yH = (yTo - yFrom) / divisions;
	int valueX, valueY;
	for (int i = 0; i < divisions; ++i) {
		posX = minXaxis + i * hxPos;
		posY = minYaxis + i * hyPos;
		valueX = (float)xFrom + (float)i * xH;
		valueY = (float)yFrom + (float)i * yH;
		strX = std::to_string(valueX);
		strY = std::to_string(valueY);

		RenderString(posX, yZero + 0.01, strX);
		RenderString(xZero - 0.05, posY, strY);

		glBegin(GL_LINES);
		glColor3f(0.0f, 0.0f, 0.0f);
		glVertex3f(posX, yZero + 0.005, 0.0f);
		glVertex3f(posX, yZero - 0.005, 0.0f);
		glEnd();
		glBegin(GL_LINES);
		glColor3f(0.0f, 0.0f, 0.0f);
		glVertex3f(xZero + 0.005, posY, 0.0f);
		glVertex3f(xZero - 0.005, posY, 0.0f);
		glEnd();
	}
}