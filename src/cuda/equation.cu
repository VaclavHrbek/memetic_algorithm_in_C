#include "cuda/equation.cuh"

__device__
float device_equation(const Individual ind){
	 Data data = device_load_data();
	float* arr = (float*) malloc(sizeof(size_t) * data.size);
	for(size_t i = 0; i != data.size; i++){
		Individual new_ind = ind;
		size_t a = new_ind.size;
		do{
			a--;
			if(new_ind.node[a].flag == VAR && new_ind.node[a].type == TERMINAL){
				new_ind.node[a].value.constant = data.x[i];
				new_ind.node[a].flag = CONST;
			} 
			if(new_ind.node[a].flag == VAR && new_ind.node[a].type == FUNCTION){
				new_ind.node[a].value.constant = device_compute_tree_node(new_ind.node[a], new_ind.node[(a*2)+1], new_ind.node[(a*2)+2]);
				new_ind.node[a].flag = CONST;
			}
		}while(a != 0);
		arr[i] = new_ind.node[0].value.constant;
	}
	float fitness = device_sum_square_roots_of_deviation(arr, data.y, data.size);
	free(arr);
	return fitness;
}

__device__
float device_equation_xy(const Individual ind){
	Data_xy data = device_load_data_xy();
	float* arr = (float*) malloc(sizeof(size_t) * data.size);
	for(size_t i = 0; i != data.size; i++){
		Individual new_ind = ind;
		size_t a = new_ind.size;
		do{
			a--;
			if(new_ind.node[a].flag == VAR && new_ind.node[a].type == TERMINAL){
				if(new_ind.node[a].value.variable == X){
					new_ind.node[a].value.constant = data.x[i];
				}
				else if(new_ind.node[a].value.variable == Y){
					new_ind.node[a].value.constant = data.y[i];
				}
				else{
				}
				new_ind.node[a].flag = CONST;
			} 
			if(new_ind.node[a].flag == VAR && new_ind.node[a].type == FUNCTION){
				new_ind.node[a].value.constant = device_compute_tree_node(new_ind.node[a], new_ind.node[(a*2)+1], new_ind.node[(a*2)+2]);
				new_ind.node[a].flag = CONST;
			}
		}while(a != 0);
		arr[i] = new_ind.node[0].value.constant;
	}
	float fitness = device_sum_square_roots_of_deviation_xy(arr, data);
	free(arr);
	return fitness;
}
//__device__
//Data device_load_data(){
//	Data data = {
//		{1, 2, 3},	// x
//		{2, 3, 4},	// y
//		3			//size of the array
//	};
//	return data;
//}

/*
__device__
Data device_load_data(){
	// sextic data are for: ax^6+bx^5+cx^4+dx^3+ex^2+fx+g=y
	Data data = {
		{-0.41, 0.39, 0.85, 0.96, -0.48, 0.14, 0.22, -0.99, -0.98, 0.36, -0.02, -0.39, -0.81, 0.34, 0.61, -0.82, 0.71, 0.57, -0.7, -0.35, -0.54},	// x
		{5.171167694,
		10.42874281,
		20.99957889,
		25.86848686,
		4.950154277,
		7.950243574,
		8.612763786,
		4.00059208,
		4.002337267,
		10.0592825,
		6.881968474,
		5.238101134,
		4.171210286,
		9.825937969,
		14.06423886,
		4.155420265,
		16.46344058,
		13.25658689,
		4.379809,
		5.377352641,
		4.776197586},	// y
		21			//size of the array
	};
	return data;
}
*/

__device__
Data_xy device_load_data_xy(void){
	// data for Keijzer 11 f(x,y) = x^y
	return data_xy{
		{	0.22 ,
			0.96          ,
			0.64          ,
			0.11          ,
			0.03          ,
			0.09          ,
			0.36          ,
			0.25          ,
			0.07          ,
			0.75          ,
			0.93          ,
			0.23          ,
			0.61          ,
			0.5           ,
			0.38          ,
			0.62          ,
			0.95          ,
			0.35          ,
			0.5           ,
			0.54          ,
			0.96
		}, // x
			{
				0.05 ,
				-0.4          ,
				-0.33         ,
				0.87          ,
				-0.54         ,
				-0.14         ,
				-0.63         ,
				-0.46         ,
				0.21          ,
				0.27          ,
				-0.94         ,
				0.84          ,
				0.53          ,
				0.61          ,
				0.35          ,
				-0.94         ,
				0.35          ,
				-0.44         ,
				0.49          ,
				-0.89         ,
				0.95
			}, // y
			{	
				0.927088372,
				1.016462841         ,
				1.158672257         ,
				0.146558711         ,
				6.642851171         ,
				1.400896495         ,
				1.903397193         ,
				1.892115293         ,
				0.572098209         ,
				0.925265866         ,
				1.070597015         ,
				0.290972123         ,
				0.769528684         ,
				0.655196702         ,
				0.712728719         ,
				1.567298839         ,
				0.982207536         ,
				1.587121082         ,
				0.712025098         ,
				1.730491832         ,
				0.961961457
			}, // f(x,y)
			21 // size of data
	};
}

/*
__device__
Data device_load_data(){
	// sextic data are for: ax^6+bx^5+cx^4+dx^3+ex^2+fx+g=y
	Data data = {
		{-0.41, 0.39, 0.85, 0.96, -0.48, 0.14, 0.22, -0.99, -0.98, 0.36, -0.02, -0.39, -0.81, 0.34, 0.61, -0.82, 0.71, 0.57, -0.7, -0.35, -0.54},	// x
		{5.171167694,
		10.42874281,
		20.99957889,
		25.86848686,
		4.950154277,
		7.950243574,
		8.612763786,
		4.00059208,
		4.002337267,
		10.0592825,
		6.881968474,
		5.238101134,
		4.171210286,
		9.825937969,
		14.06423886,
		4.155420265,
		16.46344058,
		13.25658689,
		4.379809,
		5.377352641,
		4.776197586},	// y
		21			//size of the array
	};
	return data;
}
*/

__device__
float device_compute_tree_node(const Node par, const Node ch_1, const Node ch_2){
	switch(par.value.variable){
		case ADD:
			return (ch_1.value.constant + ch_2.value.constant);
		case SUB:
			return (ch_1.value.constant - ch_2.value.constant);
		case MUL:
			return (ch_1.value.constant * ch_2.value.constant);
		case PLEFT:
			return ch_1.value.constant;
		case PRIGHT:
			return ch_2.value.constant;
		case DIV:
			if(ch_2.value.constant == 0){
				return ch_1.value.constant;
			}
			else{
				return (ch_1.value.constant / ch_2.value.constant);
			};
		default:
			return ch_1.value.constant;
	}
}

__device__
float device_sum_square_roots_of_deviation(const float* fit_arr, const float* y,const size_t fit_case){
	float sum = 0;
	for(size_t i = 0; i != fit_case; i++){
		sum += (fit_arr[i] - y[i]) * (fit_arr[i] - y[i]);
	}
	return sum;
}

__device__
float device_sum_square_roots_of_deviation_xy(const float* fit_arr, const Data_xy& data){
	float sum = 0;
	for(size_t i = 0; i != data.size; i++){
		sum += (fit_arr[i] - data.f_xy[i]) * (fit_arr[i] - data.f_xy[i]);
	}
	return sum;
}
