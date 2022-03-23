#pragma once

#include <stddef.h>
#include <stdbool.h>
#include <float.h>

#include "c/population.h"
#include "cuda/equation.cuh"

#ifdef __cplusplus
extern "C" {
#endif

void cuda_calculate_fitness(Population* pop);

#ifdef __cplusplus
}
#endif




