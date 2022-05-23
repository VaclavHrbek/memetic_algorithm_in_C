#include "c/data.h"

Data* malloc_data(void){
	Data* data = (Data*)(malloc(sizeof(Data)));
	*data = load_data(); 
	return data;
}
/*
Data load_data(void){
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

/*
Data load_data(void){
	// data for Keijzer 4 f(x) = 0.3 * x *sin(2 * PI * x)
	return data{
		{	0.35	,
			-0.29   ,
			-0.27   ,
			-0.3    ,
			-0.23   ,
			-0.9    ,
			-0.01   ,
			0.27    ,
			-0.13   ,
			0.65    ,
			0.06    ,
			0.44    ,
			-0.41   ,
			-0.68   ,
			-0.52   ,
			-0.62   ,
			-0.72   ,
			0.62    ,
			0.71    ,
			-0.86   ,
			0.86    }, // x
			{0.084946784 ,
				0.084266735 ,
				0.080361291 ,
				0.085595086 ,
				0.068455914 ,
				-0.158702018,
				0.000188372 ,
				0.080361291 ,
				0.028429776 ,
				-0.157758314,
				0.006626242 ,
				0.048592441 ,
				0.065906696 ,
				-0.184584719,
				-0.019551984,
				-0.127325762,
				-0.212174046,
				-0.127325762,
				-0.206308213,
				-0.198792417,
				-0.198792417             
			}, // y
		21 // size of data
	};
	*/

Data load_data(void){
	// data for Keijzer 8 f(x) = log(x)
	return data{
		{	0.96 ,
			0.84         ,
			0.56         ,
			0.47         ,
			0.85         ,
			0.73         ,
			0.13         ,
			0.76         ,
			0.84         ,
			0.01         ,
			0.66         ,
			0.39         ,
			0.54         ,
			0.62         ,
			0.34         ,
			0.42         ,
			0.88         ,
			0.2          ,
			0.19         ,
			0.59         ,
			0.62         
		},	// x
			{
				-0.017728767,
				-0.075720714            ,
				-0.251811973            ,
				-0.327902142            ,
				-0.070581074            ,
				-0.13667714             ,
				-0.886056648            ,
				-0.119186408            ,
				-0.075720714            ,
				-2                      ,
				-0.180456064            ,
				-0.408935393            ,
				-0.26760624             ,
				-0.207608311            ,
				-0.468521083            ,
				-0.37675071             ,
				-0.055517328            ,
				-0.698970004            ,
				-0.721246399            ,
				-0.229147988            ,
				-0.207608311
			} ,// y
			21 // size of data
	};
}
