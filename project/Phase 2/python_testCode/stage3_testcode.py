from math import sin, cos
from generateConstants import generateConstants
from convForHex import convForHex
from convForDec import convForDec

def stage3(leftIn, rightIn, numOfFractionalBits = 14):
	const = generateConstants(numOfFractionalBits)

	leftMult = pow(const['ECx'] - leftIn, 2)
	rightMult = pow(rightIn - const['ECy'], 2)

	out1 = leftMult * const['InvA'] + const['InvB'] * rightMult 

	print("Stage3: %s" %convForDec(out1,numOfFractionalBits,8))

	return out1

stage3(1,1)
