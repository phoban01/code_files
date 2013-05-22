from abjad import *
import itertools

def rotate(l, x):
  return l[-x:] + l[:-x]

def rotated(l):
	out = []
	for i in range(len(l)):
		out.append(rotate(l,i))
	return out

def interleave(lsts):
	out = []
	n = len(lsts)
	for i in range(n):
		t = []
		for j in range(n):
			t.extend(lsts[j][i])
		out.append(t)
	return out

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

parser = lilypondparsertools.ReducedLyParser()

one = ["|4/4 2/3 {c'8 c'16} c'16 c'16 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'8}|",
"|4/4 2/3 {c'8 c'8 c'8} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'16 c'16|",
"|4/4 \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16}|",
"|4/4 2/3 {c'8 c'8 c'16 c'16} 2/3 {c'16 c'16 c'16} c'8 ~ c'16 c'8 c'16 2/3 {c'8 c'16 c'16 c'8} |"]

# one = "".join(one)

two = [
	"|4/4 c'4 2/3 {c'16 c'8. c'8} 2/3 {c'8 c'8 c'8} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16}|",
	"|4/4 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'8 c'16} 2/3 {c'16 c'16 c'16} \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} |",
	"|4/4 2/3 {c'8 c'8. c'16} c'16 c'16 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
	2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16}|",
	"|4/4 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
			2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'8. c'16 |"]

# two = "".join(two)

three = [
	"|4/4 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'32 c'32 c'32 c'32 c'32 c'32 c'32 c'32 \
	2/3 {c'8 c'8. c'16} 2/3 {c'16 c'16 c'16}|",
	"|4/4 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} \
		2/3 {c'8. c'16 c'8}|",
	"|4/4 2/3 {c'8 c'8 c'8} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'8 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16}|",
	"|4/4 2/3 {c'8 c'8. c'16} 2/3 {c'8 c'16 c'16 c'8} c'8 2/3 {c'16 c'16 c'16} c'8 c'8|"
]
# three = "".join(three)

four = [
	"|4/4 2/3 {2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'8} c'8. c'16 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'4|",
	"|4/4 2/3 {c'8 2/3 {c'16 c'16 c'16} c'8} c'8 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {2/3 {c'16 c'16 c'16} c'16} c'8|",
	"|4/4 c'8. c'16 c'8 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} |",
	"|4/4 c'8 c'8 2/3 {c'8 c'16 c'8.} c'16 c'8. ~ c'4 |"
]

one = rotated(one)
two = rotated(two)
three = rotated(three)
four = rotated(four)

final = interleave([one,two,three,four])

viola = final
# reverse
violin_2 = final
violin_2.reverse()

# write to files... tidy up


# write_output(viola,"viola")
# write_output(violin_2,"violin_II")

