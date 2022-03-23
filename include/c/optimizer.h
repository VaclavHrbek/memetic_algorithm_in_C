#pragma once

#include <string.h>
#include <float.h>

//#include "c/data_structures.h"
#include "c/fitness.h"
#include "c/equation.h"
#include "c/genetic_operation.h"
#include "c/population.h"

#define NUM_OF_OPTIMIZATION (size_t) 10 // cycles
#define SIZE_FOR_OPTIMIZATION (size_t) 10 // number of ind

Population optimize(Population pop);

