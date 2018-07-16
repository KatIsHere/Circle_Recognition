/* INTERPOLATION
	Used in mathematics to find values of the  
	intermediate dots, using a table of given dots/values.
	RETURNS: a value in a given dot
*/

double li(double x, double* Xset, const int & setSize, const int& i);

double interpolation_Lagrange(double x, double* xSet, double* fSet, const int& setSize) {
	// implements Lagrange function interpolation
	int i;
	double suma = 0.;
	for (i = 0; i < setSize; ++i) {
		suma += fSet[i] * li(x, xSet, setSize, i);
	}
	return suma;
}

double li(double x, double* Xset, const int & setSize, const int& i) {
	int j;
	double mult = 1.;
	for (j = 0; j < setSize; ++j) {
		if (j != i) {
			mult *= double(x - Xset[j]) / (Xset[i] - Xset[j]);
		}
	}
	return mult;
}