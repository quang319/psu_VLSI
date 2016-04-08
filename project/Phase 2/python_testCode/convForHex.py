def convForHex(input, numOfFracBits,numOfdigits = 8):
	layout = '0%dx' %numOfdigits
	return format(int(input * pow(2,numOfFracBits)) & 0xFFFFFFFF, layout)
