import csv
import string

def removeDuplicates(baseFileName, otherFileName, titleIndexBaseFile, titleIndexOtherFile, targetFileName):
	with open(baseFileName + '.csv', 'rU') as baseFile:
		with open(otherFileName + '.csv', 'rU') as otherFile:
			with open(targetFileName + '.csv', 'wb') as target:
				writer = csv.writer(target, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)

				baseReader = csv.reader(baseFile, delimiter=',', quotechar='"')
				otherReader = csv.reader(otherFile, delimiter=',', quotechar='"')
				seen = set()
				for row in otherReader:
					otherTitle = row[titleIndexOtherFile].lower().translate(None, string.punctuation).replace(" ", "")
					seen.add(otherTitle)
					#print ieeeTitle

				i = 0
				results = 0
				if (titleIndexBaseFile == 0 and titleIndexOtherFile == 0):
					duplicates = -1
				elif (titleIndexBaseFile >= 1 and titleIndexOtherFile == 0):
					duplicates = -1
				elif (titleIndexBaseFile == 0 and titleIndexOtherFile >= 1):
					duplicates = -1
				elif (titleIndexBaseFile >= 1 and titleIndexOtherFile >= 1):
					duplicates = -1

				for index, row in enumerate(baseReader):

					if index == 0:
						writer.writerow(row)
					title = row[titleIndexBaseFile].lower().translate(None, string.punctuation).replace(" ", "")
					#year = row[4]
					#print str(i) + ' - ' + title + ' (' + year + ')'

					if(not (title in seen)):
						#print str(i) + ' - ' + title + ' (' + year + ')'
						i = i + 1				
						writer.writerow(row)
					else:
						duplicates = duplicates + 1
						#print str(i) + ' - ' + title + ' (' + year + ')'

				print 'Number of duplicates removed from ' + baseFileName + ' based on ' + otherFileName + ': ' + str(duplicates)

def merge(fileName1, fileName2, titleIndexFile1, titleIndexFile2, targetFileName):
	with open(fileName1 + '.csv', 'rU') as file1:
		with open(fileName2 + '.csv', 'rU') as file2:
			with open(targetFileName + '.csv', 'wb') as target:
				writer = csv.writer(target, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)

				file1Reader = csv.reader(file1, delimiter=',', quotechar='"')
				file2Reader = csv.reader(file2, delimiter=',', quotechar='"')
				seen1 = set()
				for row in file1Reader:
					title = row[titleIndexFile1].lower().translate(None, string.punctuation).replace(" ", "")
					seen1.add(title)

				seen2 = set()
				for row in file2Reader:
					title = row[titleIndexFile2].lower().translate(None, string.punctuation).replace(" ", "")
					seen2.add(title)

				seen = seen1.intersection(seen2)

				with open(fileName1 + '.csv', 'rU') as file1:
					with open(fileName2 + '.csv', 'rU') as file2:
						file1Reader = csv.reader(file1, delimiter=',', quotechar='"')
						file2Reader = csv.reader(file2, delimiter=',', quotechar='"')

						# for row in file1Reader:
						# 	title = row[titleIndexFile1].lower().translate(None, string.punctuation).replace(" ", "")
						# 	writer.writerow(row)
						# 	#print title

						for row in file2Reader:
							title = row[titleIndexFile2].lower().translate(None, string.punctuation).replace(" ", "")
							if(title in seen1):
								writer.writerow(row)

				print 'Done.'


def removeSelfDuplicates(file, titleIndex, ignoreFirst, targetFileName):
	with open(file + '.csv', 'rU') as source:
		with open(targetFileName + '.csv', 'wb') as target:
			sourceReader = csv.reader(source, delimiter=',', quotechar='"')
			writer = csv.writer(target, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
			seen = set()
			duplicates = 0
			for index, row in enumerate(sourceReader):
				if(ignoreFirst and index == 0): continue
				title = row[titleIndex].lower().translate(None, string.punctuation).replace(" ", "")
				if title in seen: 
					duplicates = duplicates + 1
					#print title
					continue 
				seen.add(title)
				writer.writerow(row)
			print 'Number of duplicates in ' + file + ': ' + str(duplicates)



def format(file, targetFileName, hasTitle):
	with open(file + '.csv', 'rU') as source:
		with open(targetFileName + '.csv', 'wb') as target:
			reader = csv.reader(source, delimiter=';', quotechar='"')
			writer = csv.writer(target, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
			for index, row in enumerate(reader):
				writer.writerow(row)
			if(not hasTitle):
				index = index + 1
			print 'Number of entries formatted in ' + file + ': ' + str(index)

# format('ieee', './output/ieee_formatted', False)
# format('scopus', './output/scopus_formatted', True)
# format('wos', './output/wos_formatted', True)

# removeSelfDuplicates('./output/ieee_formatted', 0, False, './output/ieee_formatted_duplicates_free')
# removeSelfDuplicates('./output/scopus_formatted', 1, True, './output/scopus_formatted_duplicates_free')
# removeSelfDuplicates('./output/wos_formatted', 1, True, './output/wos_formatted_duplicates_free')

# removeDuplicates('./output/ieee_formatted_duplicates_free', './output/wos_formatted_duplicates_free', 0, 1, './output/ieee_wos_free')
# removeDuplicates('./output/scopus_formatted_duplicates_free', './output/ieee_wos_free', 1, 0, './output/scopus_ieee_free')
# removeDuplicates('./output/scopus_formatted_duplicates_free', './output/wos_formatted_duplicates_free', 1, 1, './output/scopus_wos_free')
# merge('./output/scopus_ieee_free', './output/scopus_wos_free', 1, 1, './output/scopus_ieee_wos_free')

#format('acm', './output/acm_formatted', True)
#removeSelfDuplicates('./output/acm_formatted', 2, True, './output/acm_formatted_duplicates_free')
#removeDuplicates('./output/acm_formatted_duplicates_free', './output/wos_formatted_duplicates_free', 2, 1, './output/acm_wos_free')
#removeDuplicates('./output/acm_wos_free', './output/ieee_formatted_duplicates_free', 2, 0, './output/acm_wos_ieee_free')

#removeDuplicates('./output/scopus_ieee_wos_free', './output/acm_wos_ieee_free', 1, 2, './output/scopus_acm_wos_ieee_free')

# TOTAL: 3972
# IEEE duplicates: 1026
# IEEE free: 2946
# WOS duplicates: 587
# WOS free: 3385
