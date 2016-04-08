from math import sin, cos
from generateConstants import generateConstants
from convForHex import convForHex

def stage2(transcr, transcb, numOfFractionalBits):
	const = generateConstants(14)
	leftSub = transcb - const['Cx']
	rightSub = const['Cy'] - transcr
	
	# print('sub: 0x%s, 0x%s' %(convForHex(leftSub,numOfFractionalBits,8), \
	# 	convForHex(rightSub,numOfFractionalBits,8)))

	leftMult1 = const['NSint'] * leftSub
	leftMult2 = leftSub * const['Cost']
	rightMult1 = const['Cost'] * rightSub
	rightMult2 = rightSub * const['Sint']

	# print('LeftMult: 0x%s, 0x%s' %(convForHex(leftMult1,numOfFractionalBits,8), \
	# 	convForHex(leftMult2,numOfFractionalBits,8)))
	# print('RightMult: 0x%s, 0x%s' %(convForHex(rightMult1,numOfFractionalBits,8), \
	# 	convForHex(rightMult2,numOfFractionalBits,8)))


	out1 =  leftMult2 + rightMult2
	out2 =  leftMult1 + rightMult1

	print("Stage2: 0x%s, 0x%s" %(convForHex(out1,numOfFractionalBits,8), \
		convForHex(out2,numOfFractionalBits,8)))


stage2(1,1,6)
