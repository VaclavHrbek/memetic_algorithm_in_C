#pragma once

#include <terminal.h>
#include <function.h>

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>

char* create_population(size_t size, size_t depth_ind);

void initialize_population(char* pop, size_t num_of_nodes, size_t size_pop);

void create_individual(char* pop, size_t num_of_nodes, size_t offset);

void print_population(const char* pop, const float* fit, size_t depth_ind, size_t size_pop);



