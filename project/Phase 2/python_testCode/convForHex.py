def convForHex(input, numOfFracBits):
	return format(int(input * pow(2,numOfFracBits)) & 0xFFFF, '04x')
