from math import sin, cos
from convForHex import convForHex

def generateConstants(numOfFractionalBits, printFlag = 0):

	constDict = { 'W_Cb' : 46.97 , 'WL_Cb' : 23, 'WH_Cb' : 14, \
		'W_Cr' : 38.76, 'WL_Cr' : 20, 'WH_Cr' : 10, \
		'K_l' : 125, 'K_h' : 188, \
		'Cx' : 109.38, 'Cy' : 152.02, \
		'ECx' : 1.60, 'ECy' : 2.41, \
		'InvA' : (1/25.39), 'InvB' : (1/14.03), \
		'Y_min' : 16, 'Y_max' : 235 };

	constDict['Sint'] = sin(2.53)
	constDict['Cost'] = cos(2.53)
	constDict['NSint'] = -1 * sin(2.53)

	if (printFlag):
		[print('`define %s 16\'h%s' %(key, convForHex(constDict[key],numOfFractionalBits))) \
			for key in constDict]

	return constDict

generateConstants(6,1)


	
