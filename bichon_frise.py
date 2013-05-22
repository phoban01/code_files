from abjad import *

parser = lilypondparsertools.ReducedLyParser()

one = ["|4/4 2/3 {c'8 c16} c'16 c'16 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'8}|",
"|4/4 2/3 {c'8 c'8 c'8} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16} c'16 c'16|"
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
	# 2/3 {c'16 c'16 c'16} 2/3 {c'16 c'16 c'16}|",
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
	"|4/4 c'8 c'8 2/3 {c'8 c'16 c'8.} c'16 c8. ~ c'4 |"
]
# four = "".join(four)

