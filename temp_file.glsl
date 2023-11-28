
#[compute]
#version 450

// Invocations in the (x, y, z) dimension
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

// A binding to the buffer we create in our script
layout(binding = 0) buffer Data0 {
	int data_0[];
};

layout(binding = 1) buffer Data1 {
	int data_1[];
};

layout(binding = 2) buffer Params {
	int current_pass;
};

	

// Write your code HERE
void main() {
	uint x = gl_GlobalInvocationID.x;
	uint y = gl_GlobalInvocationID.y;
	uint p = x + y * 128;
	
	data_0[p] = data_0[p] / 2;
	data_1[p] = data_1[p] + 1024;
	
	//if (current_pass == 0)
	//    data_1[p] += 10;
	//if (current_pass == 1)
	//    data_1[p] -= 10;
	
}
