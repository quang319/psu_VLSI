from math import sin, cos
from generateConstants import generateConstants
from convForHex import convForHex

def stage2(transcr, transcb, numOfFractionalBits):
	const = generateConstants(6)
	leftSub = transcb - const['Cx']
	rightSub = const['Cy'] - transcr
	out1 = leftSub * const['Cost'] + rightSub * const['Sint']
	out2 = const['NSint'] * leftSub + const['Cost'] * rightSub

	print("Stage2: 0x%s, 0x%s" %(convForHex(out1,numOfFractionalBits), convForHex(out2,numOfFractionalBits)))


stage2(1,1,6)

