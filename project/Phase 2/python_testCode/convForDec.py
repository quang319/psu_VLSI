def convForDec(input, numOfFracBits,numOfdigits):
	return str(int(input * pow(2,numOfFracBits - 2)))