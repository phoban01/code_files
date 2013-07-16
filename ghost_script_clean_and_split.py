import os

files = ["violin_one","violin_two","viola","cello"]
# files = ["viola"]
root_dir = "/pieces/diotima_quartet/parts/"


for x in files:
	print x

	output_dir = root_dir + x + "/"

	lily_file = root_dir + x + ".ly"

	lily_cmd = "lilypond -o {0} {1}".format(output_dir,lily_file)

	gs_cmd = "gs -sDEVICE=pswrite -dNOCACHE -sOutputFile={1}%0d.ps -q -dBATCH -dNOPAUSE {0} -c quit"

	input_file_name = "*.pdf"

	output_name = x+"_page_"

	os.system(lily_cmd)
	os.chdir(output_dir)
	os.system("ls")
	os.system(gs_cmd.format(input_file_name,output_name))
	os.system("ls")

print "Komplett"

# gs -sDEVICE=pswrite -dNOCACHE -sOutputFile=quartet_split_%0d.ps -q -dBATCH -dNOPAUSE quartet_score.pdf -c quit