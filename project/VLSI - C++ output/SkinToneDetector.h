
#ifndef SKINTONEDETECTOR_H
#define SKINTONEDETECTOR_H
#include "math.h"


unsigned char get_skinscore(unsigned char Y, unsigned char Cr, unsigned char Cb);
double MeanCr(unsigned char Y);
double MeanCb(unsigned char Y);
double WidthCr(unsigned char Y);
double WidthCb(unsigned char Y);
double TransCr(unsigned char Y, unsigned char Cr);
double TransCb(unsigned char Y, unsigned char Cb);

#define W_Cb 46.97
#define WL_Cb 23
#define WH_Cb 14
#define W_Cr 38.76
#define WL_Cr 20
#define WH_Cr 10
#define K_l 125
#define K_h 188

#define Cx 109.38
#define Cy 152.02
#define Theta 2.53
#define ECx 1.60
#define ECy 2.41
#define A 25.39
#define B 14.03
#define Y_min 16
#define Y_max 235
//#define Y_min 1000
//#define Y_max 3000
#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 240

#endif