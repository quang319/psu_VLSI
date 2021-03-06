from math import sin, cos
from generateConstants import generateConstants
from convForHex import convForHex
from convForDec import convForDec

def stage2(transcr, transcb, printFlag = 0, numOfFractionalBits = 14):
	const = generateConstants(numOfFractionalBits)
	leftSub = transcb - const['Cx']
	rightSub = const['Cy'] - transcr

	# print('sub: %s, %s' %(convForDec(leftSub,numOfFractionalBits,8), \
	# 	convForDec(rightSub,numOfFractionalBits,8)))

	leftMult1 = const['NSint'] * leftSub
	leftMult2 = leftSub * const['Cost']
	rightMult1 = const['Cost'] * rightSub
	rightMult2 = rightSub * const['Sint']

	# print('LeftMult: %s, %s' %(convForDec(leftMult1,numOfFractionalBits,8), \
	# 	convForDec(leftMult2,numOfFractionalBits,8)))
	# print('RightMult: %s, %s' %(convForDec(rightMult1,numOfFractionalBits,8), \
	# 	convForDec(rightMult2,numOfFractionalBits,8)))


	out1 =  leftMult2 + rightMult2
	out2 =  leftMult1 + rightMult1

	if(printFlag):
		print("Stage2: add_left = %s, add_right = %s" %(convForDec(out1), convForDec(out2)))

	return (out1, out2)


# stage2(1,1)
