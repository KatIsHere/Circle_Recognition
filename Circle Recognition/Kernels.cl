// First kernell drafts

__kernel void Add_and_Assighn(
	__global const float *a,
	__global float *c) {
	int id = get_global_id(0);
	c[id] = c[id] + a[id];
}


__kernel void Divide(
	__global const float *a,
	__global const float *b,
	__global float *c) {
	int id = get_global_id(0);
	c[id] = a[id] / b[id];
}


__kernel void Mult_and_Subtract(
	__global const float *a,
	__global const float *b,
	__global float *c) {
	int id = get_global_id(0);
	c[id] = c[id] - a[id] * b[id];
}


__kernel void Multiply(
	__global const float *a,
	__global const float *b,
	__global float *c){ 
	int id = get_global_id(0);
	c[id] = a[id] * b[id];
}

__kernel void Add_Pow(
	__global const float *a,
	__global const float x,
	__global float c) {
	
}