\version "2.17.20"

music = {
	R1*3
	\override Score.StaffGrouper #'staff-staff-spacing = #'(
					(basic-distance . 25) 
					(minimum-distance . 20) 
					(padding . 0)
				    (stretchability . 0)
					)
	R1*3
}

\score {
	\new StaffGroup <<
	\set Score.proportionalNotationDuration = #(ly:make-moment 1 10)
	\override Score.StaffGrouper #'staff-staff-spacing = #'(
					(basic-distance . 5) 
					(minimum-distance . 10) 
					(padding . 0)
				    (stretchability . 0)
					)
		\new Staff {
			\music
		}
		\new Staff {
			\music
		}
		\new Staff {
			\music
		}
		\new Staff {
			\music
		}
	>>
}