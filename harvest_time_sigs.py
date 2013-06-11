import os,re
from fnmatch import fnmatch
from abjad import *



def extract_time_sigs(path):
	reg = re.compile(r'\btime\b')
	infile = open(path,"r")
	string = infile.readlines()
	substring = r"\time"
	times = []
	for l in string:
		if reg.search(l) != None:
			# print l.strip()
			if l.strip()[0] != "%":
				times.append(l.strip()[6:])
	durs = []
	for x in times:
		d = tuple([int(y) for y in x.split("/")])
		durs.append(d)
	infile.close()
	return durs

def make_comment_string(index,music):
	comment = "%%%%%%% ============= measure {0} ============= %%%%%%%%".format(index+1)
	comment = marktools.LilyPondComment(comment)
	marktools.attach_lilypond_comments_to_components_in_expr(music,[comment])
	return None

def make_voice(durs):
	v = Container([])
	for i,d in enumerate(durs):
		leaf = leaftools.make_leaves([None],[d])
		m = measuretools.Measure(d,leaf)
		make_comment_string(i,m)
		v.append(m)
	skiptools.replace_leaves_in_expr_with_skips(v)
	return v

def write_to_file(outfile,music,local_name):
	output_string = "{0} = ".format(local_name) + music.lilypond_format
	outfile.write(output_string)
	outfile.close()	

basepath = "/pieces/diotima_quartet/music_files/skips/"
paths = ["frise_skips.ly"]

for fn in paths:
	time_sigs = extract_time_sigs(basepath+fn)
	print time_sigs
	fileo = open(basepath+fn,"w")
	write_to_file(fileo,make_voice(time_sigs),"frise_skips")







