#include "SkinToneDetector.h"
#include <string>
#include <fstream>
#include <iostream>
#include <sys/io.h>
using namespace std;

unsigned char get_skinscore(unsigned char Y, unsigned char Cr, unsigned char Cb)
{
	double skinScore;
	double cost, sint;
	double TCr, TCb;
	double xx, yy;
	double A2, B2;
	float radius = 0.5;
	float fac = 255.0/radius;
	int pixel_index;
		  
	cost = cos(Theta);
	sint = sin(Theta);
	A2 = A*A;
	B2 = B*B;			


    TCr = TransCr(Y, Cr);
    TCb = TransCb(Y, Cb);
	ofstream file;
	file.open("stage1.csv", fstream::app);
	file << (int)Y << "," << (int)Cr << "," << (int)Cb << "," << TCr << "," << TCb << "\n";
	file.close();

    xx = cost*(TCb - Cx) + sint*(TCr - Cy);
    yy = -sint*(TCb - Cx) + cost*(TCr - Cy); 
	file.open("stage2.csv", fstream::app);
	file << (int)Y << "," << (int)Cr << "," << (int)Cb << "," << xx << "," << yy << "\n";
	file.close();

	skinScore = (xx - ECx)*(xx - ECx)/A2 + (yy - ECy)*(yy - ECy)/B2;
	file.open("stage3.csv", fstream::app);
	file << (int)Y << "," << (int)Cr << "," << (int)Cb << "," << skinScore << "\n";
	file.close();

	if (skinScore <= radius) {
		file.open("stage4.csv", fstream::app);
		file << (int)Y << "," << (int)Cr << "," << (int)Cb << "," << (unsigned int)(fac*(radius - skinScore)) << "\n";
		file.close();
		return (unsigned char)(fac*(radius - skinScore));
	}
	else {
		file.open("stage4.csv", fstream::app);
		file << (int)Y << "," << (int)Cr << "," << (int)Cb << "," << (unsigned int)0 << "\n";
		file.close();
		return (unsigned char)0;
	}
}

double MeanCr(unsigned char Y)
{
	if(Y <= K_l)
		return 154.0 + 10.0*(K_l - Y)/(K_l - Y_min);
	else if(K_h <= Y)
		return 154.0 + 22.0*(Y - K_h)/(Y_max - K_h);
	else
		return 0.0;
}

double MeanCb(unsigned char Y)
{
	if(Y <= K_l)
		return 108 + 10*(K_l - Y)/(K_l - Y_min);
	else if(K_h <= Y)
		return 108 + 10*(Y - K_h)/(Y_max - K_h);
	else
		return 0.0;
}

double WidthCr(unsigned char Y)
{
	if(Y <= K_l)
		return WL_Cr + (Y - Y_min)*(W_Cr - WL_Cr)/(K_l - Y_min);
	else if(K_h <= Y)
		return WH_Cr + (Y_max - Y)*(W_Cr - WH_Cr)/(Y_max - K_h);
	else
		return 0.0;
}

double WidthCb(unsigned char Y)
{
	if(Y <= K_l)
		return WL_Cb + (Y - Y_min)*(W_Cb - WL_Cb)/(K_l - Y_min);
	else if(K_h <= Y)
		return WH_Cb + (Y_max - Y)*(W_Cb - WH_Cb)/(Y_max - K_h);
	else
		return 0.0;
}

double TransCr(unsigned char Y, unsigned char Cr)
{
	if( K_l <= Y && Y <= K_h)
		return Cr;
	else
		return (Cr - MeanCr(Y)) * (W_Cr / WidthCr(Y)) + MeanCr(K_h);
}

double TransCb(unsigned char Y, unsigned char Cb)
{
	if( K_l <= Y && Y <= K_h)
		return Cb;
	else
		return (Cb - MeanCb(Y)) * (W_Cb / WidthCb(Y)) + MeanCb(K_h);
}

