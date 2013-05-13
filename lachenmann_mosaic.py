from PyPDF2 import PdfFileWriter, PdfFileReader
from random import *
import os

def make_tile(page_number,n_tiles,row,column):
	path = "/pieces/diotima_quartet/reigen.pdf"
	output_path = "/pieces/diotima_quartet/tiles/reigen_%s_%s@%s.pdf" % (page_number,row,column)
	source = PdfFileReader(open(path, "rb"))
	page = source.getPage(page_number)	
	width = float(page.mediaBox.getWidth())
	height = float(page.mediaBox.getHeight())	

	tile_column = column
	tile_row = row
	tile_size = n_tiles
	tile_width = width/tile_size
	tile_height = height/tile_size

	column = tile_width*tile_column
	row = tile_height*tile_row
	page.cropBox.lowerLeft = (column,row)
	page.cropBox.upperRight = (column+tile_width,row+tile_height)
	page.trimBox.lowerLeft = (column,row)
	page.trimBox.upperRight = (column+tile_width,row+tile_height)	
	page.mediaBox.lowerLeft = (column,row)
	page.mediaBox.upperRight = (column+tile_width,row+tile_height)

	# output
	output = PdfFileWriter()	
	output.addPage(page)
	outputStream = file(output_path, "wb")
	output.write(outputStream)
	return None


source = PdfFileReader(open("/pieces/diotima_quartet/reigen.pdf", "rb"))	
n_pages = source.getNumPages()
montages = 1

for m in range(montages):
	n = 4
	d = 8
	n_tiles = n*d

	page_divide_grid = 10

	for i in range(n_tiles):
		page = randint(4,n_pages-1)
		row =  randint(0,page_divide_grid-1)
		column = randint(0,page_divide_grid-1)
		make_tile(page,page_divide_grid,row,column)

	outfile_name = "montage_%s" % (m+1)

	os.chdir("/pieces/diotima_quartet/tiles/")
	os.system("montage -quality 100 -density 330 -border 10 -geometry +2+2 -tile %sx%s  *.pdf %s.pdf" % (n,d,outfile_name))
	os.system("cp %s.pdf pages/" % outfile_name)
	os.system("rm *.pdf")

os.system("pdftk /pieces/diotima_quartet/tiles/pages/*.pdf cat output lachenmann_montages.pdf")
os.system("rm pages/*.pdf")