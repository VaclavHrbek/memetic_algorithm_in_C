#pragma once

#include <stdio.h>
#include <string>

typedef enum { TERMINAL, FUNCTION } Type ;
typedef enum  { CONST, VAR } Flag;
typedef enum { ADD, SUB, DIV, MUL, X, Y, PLEFT, PRIGHT } Variable;

typedef struct node {
	Type type;
	Flag flag;
	union Value {
		Variable variable;
		float constant;
	} value;
} Node;

void print_node(Node* n);
std::string node_value(Node* n);
