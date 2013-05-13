from abjad import *
from random import *

seed(54321234)

score = scoretools.Score([scoretools.StaffGroup(Staff([])*4)])

numer = [5,4,3,2]

denom = [4,4,4,4,8,8,8,16]

n = 200

time_sigs = []

for i in range(n):
	md = (choice(numer),choice(denom))
	time_sigs.append(md)

for staff in score[0]:
	measures = measuretools.make_measures_with_full_measure_spacer_skips(time_sigs)
	staff.extend(measures[100:])



lilypond_file = lilypondfiletools.make_basic_lilypond_file(score)
lilypond_file.file_initial_user_includes.append("/pieces/diotima_quartet/empty_measure_template.ly")
iotools.write_expr_to_ly(lilypond_file,'/pieces/diotima_quartet/empty_measures_two.ly')

# GENERATE A BLANK PAGE OF QUARTET MANUSCRIPT

# score = scoretools.Score([scoretools.StaffGroup(Staff([])*4)])

# score.override.bar_line.transparent = True
# score.override.time_signature.transparent = True
# score[0].override.span_bar.break_visibility =  schemetools.Scheme(True,False,False,quoting="#")
# score.override.bar_number.transparent = True
# n = 9

# time_sigs = []

# for i in range(n):
# 	time_sigs.append((4,4))

# for staff in score[0]:
# 	measures = measuretools.make_measures_with_full_measure_spacer_skips(time_sigs)
# 	staff.extend(measures)


# lilypond_file = lilypondfiletools.make_basic_lilypond_file(score)
# lilypond_file.file_initial_user_includes.append("/pieces/diotima_quartet/empty_measure_template.ly")
# iotools.write_expr_to_ly(lilypond_file,'/pieces/diotima_quartet/blank_page_quartet.ly')