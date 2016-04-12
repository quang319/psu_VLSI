def convForDec(input, numOfFracBits = 14,numOfdigits = 8):
	return str(int(input * pow(2,numOfFracBits)))