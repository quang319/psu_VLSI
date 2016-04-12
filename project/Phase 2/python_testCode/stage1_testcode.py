from genLUT import *
from generateConstants import generateConstants
from convForHex import convForHex
from convForDec import convForDec

def stage1(Y, Cr, Cb, printFlag = 0, numOfFractionalBits = 14):
	const = generateConstants(14)

	if( const['K_l'] <= Y and Y <= const['K_h']):
		if(printFlag):
			print("Stage1: Cr = %s, Cb = %s" %(convForDec(0),convForDec(0) ) )
		return (Cr, Cb)
	else:
		tempCr = (Cr - MeanCr(Y)) * (const['W_Cr'] / WidthCr(Y)) + MeanCr(const['K_h'])
		tempCb = (Cb - MeanCb(Y)) * (const['W_Cb'] / WidthCb(Y)) + MeanCb(const['K_h'])
		if(printFlag):
			print("Stage1: Cr = %s, Cb = %s" %(convForDec(tempCr),convForDec(tempCb) ) )
		return (tempCr, tempCb)

# stage1(1,1,1,1)