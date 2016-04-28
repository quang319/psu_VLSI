import csv
def extractNPrintFromCSV (fileName):
	with open(fileName, 'r') as f:
		reader = csv.reader(f)
		tempDataList = list(reader)
		dataList = [x[0] for x in tempDataList]
	[print('8\'d%s,' %(data)) for data in dataList]
	return dataList

def genValids (number):
	dataList = range(0,286)
	[print('8\'d%s,' %(1)) for data in dataList]
	return dataList


# dataList = extractNPrintFromCSV('PossibleCr.csv')
# dataList = extractNPrintFromCSV('PossibleCb.csv')
# dataList = extractNPrintFromCSV('PossibleY.csv')
dataList = genValids(686)
print(len(dataList))
