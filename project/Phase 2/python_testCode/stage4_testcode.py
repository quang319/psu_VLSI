from generateConstants import generateConstants
from convForHex import convForHex
from convForDec import convForDec

def stage4(in1, printFlag = 0, numOfFractionalBits = 14):
	const = generateConstants(14)
	if((in1 <= const['Radius'])):
		skintone = (const['Radius'] - in1) * const['fac']
	else:
		skintone	 = 0
	if printFlag:
		print("Stage4: skintone = %d" %skintone)
	return skintone


# stage4(1,1)