#define __CL_ENABLE_EXCEPTIONS
#include <CL/cl.hpp>
#include <string>

// CONTEXT FOR A DEVICE
cl::Context context(CL_DEVICE_TYPE_DEFAULT);

// COMMAND QUEUE FOR THE FIRST DEVICE IN THE CONTEXT
cl::CommandQueue queue(context);

std::string KernelSource = "";
cl::Program program(context, KernelSource, true);