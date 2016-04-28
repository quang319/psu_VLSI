from __future__ import division
from generateConstants import generateConstants
from convForHex import convForHex


const = generateConstants(14)


def MeanCr(Y):
   if (Y <= const['K_l']):
       return 154.0 + 10.0 * (const['K_l'] - Y) / (const['K_l'] - const['Y_min'])
   elif (const['K_h'] <= Y):
       return 154.0 + 22.0 * (Y - const['K_h']) / (const['Y_max'] - const['K_h'])
   else:
       return 0.0

def MeanCb(Y):
   if (Y <= const['K_l']):
       return 108.0 + 10.0 * (const['K_l'] - Y) / (const['K_l'] - const['Y_min'])
   elif (const['K_h'] <= Y):
       return 108.0 + 10.0 * (Y - const['K_h']) / (const['Y_max'] - const['K_h'])
   else:
       return 0.0
       
def WidthCr(Y):
   if (Y <= const['K_l']):
       return const['WL_Cr'] + (Y - const['Y_min']) * (const['W_Cr'] - const['WL_Cr']) / (const['K_l'] - const['Y_min'])
   elif (const['K_h'] <= Y):
       return const['WH_Cr'] + (const['Y_max'] - Y) * (const['W_Cr'] - const['WH_Cr']) / (const['Y_max'] - const['K_h'])
   else:
       return 0.0

def WidthCb(Y):
   if (Y <= const['K_l']):
       return const['WL_Cb'] + (Y - const['Y_min']) * (const['W_Cb'] - const['WL_Cb']) / (const['K_l'] - const['Y_min']);
   elif (const['K_h'] <= Y):
       return const['WH_Cb'] + (const['Y_max'] - Y) * (const['W_Cb'] - const['WH_Cb']) / (const['Y_max'] - const['K_h']);
   else:
       return 0.0;

def createFile(nameOfModule, listOfNumbers):
	with open("%s.txt" %nameOfModule, 'w+') as file:
		for index in range(0,256):
			file.write("8\'d%s: result = 32\'h%s; \n" %(index, convForHex(listOfNumbers[index], 14)))


# listMeanCr = [MeanCr(y) for y in range(0,256)]
# listMeanCb = [MeanCb(y) for y in range(0,256)]
# listWidthCr = [const['W_Cr']/WidthCr(y) for y in range(0,256)]
# listWidthCb = [const['W_Cb']/WidthCb(y) for y in range(0,256)]
listWidthCr = []
listWidthCb = []
for y in range(0,256):
  if WidthCr(y) == 0.0:
    listWidthCr.append(0.0)
  else:
    listWidthCr.append(const['W_Cr']/WidthCr(y))
for y in range(0,256):
  if WidthCb(y) == 0.0:
    listWidthCb.append(0.0)
  else:
    listWidthCb.append(const['W_Cb']/WidthCb(y))


# createFile("meanCr", listMeanCr)
# createFile("meanCb", listMeanCb)
createFile("widthCr", listWidthCr)
createFile("widthCb", listWidthCb)