from math import sin, cos

def stage2(transcr, transcb):
	leftSub = transcb - 109.38
	rightSub = 152.02 - transcr
	Sint = sin(2.53)
	NSint = -1 * Sint
	Cost = cos(2.53)
	out1 = leftSub * Cost + rightSub * Sint
	out2 = ((-1.0 * Sint) * leftSub) + Cost * rightSub

	print("%d, %d" %(out1 * 64, out2 * 64))


stage2(1,1)




