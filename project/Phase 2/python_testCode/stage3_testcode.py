from math import sin, cos
from generateConstants import generateConstants
from convForHex import convForHex
from convForDec import convForDec

def stage3(leftIn, rightIn, printFlag = 0, numOfFractionalBits = 14):
	const = generateConstants(numOfFractionalBits)

	leftMult = pow(const['ECx'] - leftIn, 2)
	rightMult = pow(rightIn - const['ECy'], 2)

	out1 = leftMult * const['InvA'] + const['InvB'] * rightMult 

	if(printFlag):
		print("Stage3: add_out = %s" %convForDec(out1))

	return out1

# stage3(1,1)
