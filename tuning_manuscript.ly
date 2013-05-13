\version "2.17.15"

\language "english"

music = {
	\repeat unfold 3 {c'8 [ \repeat unfold 8 c'8 c'8]}
}

staff = {
	\new Staff {
				\time 5/4
				<<
					\new TimeTickVoice {
						\stemDown
						\music
					} \\
					\new Voice {
						\stemUp
						\hideNotes \music

					}
				>>
			}
}

\score {
	\new Score {
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 22)
		\new StaffGroup <<
			\staff
			\staff
			\staff
			\staff
		>>
	}
	\layout {
		  indent = 1\cm
  		  short-indent = 1\cm
			\context {
				\Voice
				\alias "Voice"
				\name "TimeTickVoice"
				\override NoteHead #'transparent = ##t
				\override NoteHead #'Y-offset = #-5
				\override Beam #'positions = #'(-6 . -6)
				\override Beam #'beam-thickness = #0.15
				\override Beam #'gap = #0
				\override Beam #'length-fraction = #0
				\override NoteHead #'stem-attachment = #'(0 . 0)
		}
	\context {
			\Staff
			\remove "Ledger_line_engraver"
			middleCPosition = #0
			\override StaffSymbol #'line-count = #1
			\override Clef #'extra-offset = #'(-0.1 . 0)
			\override Clef #'stencil = ##f
			\override VerticalAxisGroup #'staff-staff-spacing = 
					#'((basic-distance . 38) (minimum-distance . 10) (padding . 0))
			\accepts "TimeTickVoice"
			\accepts "MusicVoice"
	}		
	}

}

\header {
	tagline = " "
}

\paper {
	top-system-spacing =  #'((basic-distance . 18)
       (minimum-distance . 5))
% 	ragged-last-bottom = ##f
% 	ragged-bottom = ##f
% 	ragged-right = ##f
% 	ragged-last = ##f
}
#(set-global-staff-size 21)
#(set-default-paper-size "a3" 'landscape)