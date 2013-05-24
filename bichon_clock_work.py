from random import *

def write_output(data,name):
	path = "/pieces/diotima_quartet/music_files/bichon_frise_%s.ly"
	measure_string = "\n%%%%%%%%%   MEASURE {0}   %%%%%%%%% \n"	
	outfile = open(path%name,"w")
	outfile.write("%s_bichon_frise = {\n" % name)
	cm = 1
	for i in data:
		for j in i:
			p = parser(j)
			outfile.write(measure_string.format(cm))
			outfile.write(p.lilypond_format)
			cm+=1
	outfile.write("\n}")
	outfile.close()
	return None

types = [r"\one",r"\two",r"\three",r"\four",r"\five",r"\six",r"\seven",r"\eight",r"\nine",r"\ten"] 

lst = []

n = 5

for i in range(n):
	r = types[:]
	shuffle(r)
	flag = False
	for j in lst:
		if j == r:
			flag = True
	if flag == False:
		for k in range(len(r)):
			if randint(0,100) > 65:
				r[k] = r"\silence"
		lst.extend(r)



print lst[-1]
for i in range(0,len(lst)-2,3):
	print lst[i],lst[i+1],lst[i+2]


