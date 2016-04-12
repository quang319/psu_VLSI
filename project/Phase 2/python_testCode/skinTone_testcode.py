from stage1_testcode import *
from stage2_testcode import *
from stage3_testcode import *
from stage4_testcode import *

def skinTone(Y, Cr, Cb, printFlag = 0, numOfFractionalBits = 14):
	(tempCr, tempCb) = stage1(Y, Cr, Cb, printFlag, numOfFractionalBits)
	(st2_out1, st2_out2) = stage2(tempCr,tempCb, printFlag, numOfFractionalBits)
	st3_out = stage3(st2_out1, st2_out2, printFlag, numOfFractionalBits)
	skinTone_output = stage4(st3_out, printFlag, numOfFractionalBits)

	# if(not printFlag):
	# 	print("SkintoneModule: skintone = %s" %convForDec(skinTone_output)  )
	return skinTone_output

# with open("goodOutput.txt",'w+') as file:
# 	for i in range(0,256):
# 		for j in range(0,256):
# 			for k in range(0,256):
# 				result = skinTone(i, j, k)
# 				if (result):
# 					file.write("Y=%d, Cr=%d, Cb=%d --> result = %d \n" \
# 						%(i, j, k, result))

# Y = [38, 112, 136, 190]
# CR = [160, 153, 151, 156]
# CB = [115, 109, 105, 106]

# for i in range(0,4):
# 	print("******* Y = %d, Cr = %d, Cb = %d" \
# 		%(Y[i], CR[i], CB[i]))
# 	skinTone(Y[i], CR[i], CB[i], 1)
# skinTone(136, 152, 105, 1)

