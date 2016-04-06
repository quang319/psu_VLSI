#######################################
#
#
#		APPENDIX A
#
#
#######################################


#include "SkinToneDetector.h"

unsigned char get_skinscore(unsigned char* image_ptr, int col, int row)
{
	double skinScore;
	double cost, sint;
	double TCr, TCb;
	double xx, yy;
	double A2, B2;
	float radius = 0.5;
	float fac = 255.0/radius;
	unsigned char Y;
	unsigned char Cr;
	unsigned char Cb;
	int pixel_index;
	  
	cost = cos(Theta);
	sint = sin(Theta);
	A2 = A*A;
	B2 = B*B;			
	
	pixel_index = ((row*IMAGE_WIDTH) + col) * 3;
    Y = *((int)image_ptr + pixel_index);
    Cr = *((int)image_ptr + pixel_index + 1);
    Cb = *((int)image_ptr + pixel_index + 2);


   if( K_l <= Y && Y <= K_h)
		TCr = Cr;
		TCb = Cb;
	else
		double MeanCr_Y;
		double MeanCb_Y;
		double WidthCr;
		double WidthCb;
		double MeanCr_K_h;
		double MeanCb_K_h;

		if(Y <= K_l)
			MeanCr_Y = 154.0 + 10.0*(K_l - Y)/(K_l - Y_min);
			MeanCb_Y = 108 + 10*(K_l - Y)/(K_l - Y_min);
			WidthCr = WL_Cr + (Y - Y_min)*(W_Cr - WL_Cr)/(K_l - Y_min);
			WidthCb = WL_Cb + (Y - Y_min)*(W_Cb - WL_Cb)/(K_l - Y_min);
			
		else if(K_h <= Y)
			MeanCr_Y = 154.0 + 22.0*(Y - K_h)/(Y_max - K_h);
			MeanCb_Y = 108 + 10*(Y - K_h)/(Y_max - K_h);
			WidthCr = WH_Cr + (Y_max - Y)*(W_Cr - WH_Cr)/(Y_max - K_h);
			WidthCb = WH_Cb + (Y_max - Y)*(W_Cb - WH_Cb)/(Y_max - K_h);
			
		else
			MeanCr_Y = 0.0;
			MeanCb_Y = 0.0;
			WidthCr = 0.0;
			WidthCb = 0.0

		if(K_h <= K_l)
			MeanCr_K_h = 154.0 + 10.0*(K_l - K_h)/(K_l - Y_min);
			MeanCb_K_h = 108 + 10*(K_l - K_h)/(K_l - Y_min);
		else
			MeanCr_K_h = 154.0;
			MeanCb_K_h = 108;


		TCr = (Cr - MeanCr_Y) * (W_Cr / WidthCr) + MeanCr_K_h;
		TCb = (Cb - MeanCb_Y) * (W_Cb / WidthCb) + MeanCb_K_h;

    xx = cost*(TCb - Cx) + sint*(TCr - Cy);
    yy = -sint*(TCb - Cx) + cost*(TCr - Cy); 

	skinScore = (xx - ECx)*(xx - ECx)/A2 + (yy - ECy)*(yy - ECy)/B2;

    if(skinScore<=radius)
		return (unsigned char)(fac*(radius-skinScore));
	else
		return (unsigned char)0;
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