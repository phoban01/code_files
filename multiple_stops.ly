\version "2.17.4"
\language "english"
\include "/pieces/diotima_quartet/code_files/eighthTone.ly"

\score {
	\new Score \with {
		\override BarNumber #'transparent = ##t
	}
	{
		\new Staff \with {
			\override InstrumentName #'font-name = #"Optima"
			instrumentName = "Violin"
			\override Stem #'transparent = ##t
			\override Beam #'transparent = ##t
			\override TimeSignature #'stencil =  ##f
			\override Glissando #'thickness = #5
		} {
			#(set-accidental-style 'dodecaphonic)
			\afterGrace c'4 \glissando ^\markup {\tiny \with-color \red IV}  _\markup {"1:spread"}
				 {\tweak #'font-size #-6  bf4}
			fs' ^\markup {\tiny \with-color \red III} 
			b' ^\markup {\tiny \with-color \red II} 
			eqs'' ^\markup {\tiny \with-color \red I}
			\bar "|"

			gqs4 ^\markup {\tiny \with-color \red IV}  _\markup {"R1:spread"}
			e' ^\markup {\tiny \with-color \red III}
			cs'' ^\markup {\tiny \with-color \red II} 
			\afterGrace a''  ^\markup {\tiny \with-color \red I}
				{\tweak #'font-size #-6  g''4}
			 \bar "|"
		
			bf4 ^\markup {\tiny \with-color \red IV}  _\markup {"1:cramped"}
			ees' ^\markup {\tiny \with-color \red III} 
			aqs' ^\markup {\tiny \with-color \red II} 
			eqs'' ^\markup {\tiny \with-color \red I}
			\bar "|"

			gqs ^\markup {\tiny \with-color \red IV}  _\markup {"R1:cramped"}
			dqs' ^\markup {\tiny \with-color \red III}
			bes' ^\markup {\tiny \with-color \red II} 
			g'' ^\markup {\tiny \with-color \red I}
			\bar "|"			 

			cs'4 ^\markup {\tiny \with-color \red IV}  _\markup {"2:barré (I & II)"} 
			f'8 (  ^\markup {\tiny \with-color \red III} 
			gqs'8 ) ^\markup {\tiny \with-color \red III}
			as'4 ^\markup {\tiny \with-color \red II} 
			eqs''  ^\markup {\tiny \with-color \red I}
			\bar "|"

			gs4 ^\markup {\tiny \with-color \red IV}  _\markup {"2:barré (IV & III)"} 
			dqs'4  ^\markup {\tiny \with-color \red III} 
			c''8 ( ^\markup {\tiny \with-color \red III}
			dqs''8 ) ^\markup {\tiny \with-color \red II} 
			b''4 ^\markup {\tiny \with-color \red I}
			\bar "|"

			a4 ^\markup {\tiny \with-color \red IV}  _\markup {"3:cramped"} 
			f'4  ^\markup {\tiny \with-color \red III} 
			cs''4 ^\markup {\tiny \with-color \red II}
			eqs''4 ^\markup {\tiny \with-color \red I}
			\bar "|"

			bf4 ^\markup {\tiny \with-color \red IV}  _\markup {"3:spread"} 
			fs'4  ^\markup {\tiny \with-color \red III} 
			d''4 ^\markup {\tiny \with-color \red II}
			eqs''4 ^\markup {\tiny \with-color \red I}
			\bar "|"

			gqs4 ^\markup {\tiny \with-color \red IV}  _\markup {"R3:cramped"} 
			fs'4  ^\markup {\tiny \with-color \red III} 
			c''4 ^\markup {\tiny \with-color \red II}
			fs''4 ^\markup {\tiny \with-color \red I}
			\bar "|"

			gqs4 ^\markup {\tiny \with-color \red IV}  _\markup {"R3:spread"} 
			g'4  ^\markup {\tiny \with-color \red III} 
			cs''4 ^\markup {\tiny \with-color \red II}
			g''4 ^\markup {\tiny \with-color \red I}
			\bar "|."			

		}
	}
	\midi {}
	\layout {}
}

\markup {\vspace #2 ""}

\score {
	\new Score \with {
		\override BarNumber #'transparent = ##t
	}		\new Staff \with {
			\override InstrumentName #'font-name = #"Optima"
			instrumentName = "Viola"
			\override Stem #'transparent = ##t
			\override Beam #'transparent = ##t
			\override TimeSignature #'stencil =  ##f
			\override Glissando #'thickness = #5
		} {
			#(set-accidental-style 'dodecaphonic)
			\clef alto
			ces4 ^\markup {\tiny \with-color \red IV}  _\markup {"1:cramped"}
			gqs ^\markup {\tiny \with-color \red III} 
			ds' ^\markup {\tiny \with-color \red II} 
			bqf' ^\markup {\tiny \with-color \red I}
			\bar "|"

			dqf4 ^\markup {\tiny \with-color \red IV}  _\markup {"R1:cramped"}
			gs ^\markup {\tiny \with-color \red III} 
			dqs' ^\markup {\tiny \with-color \red II} 
			aes' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ces4 ^\markup {\tiny \with-color \red IV}  _\markup {"1:spread"}
			aqf ^\markup {\tiny \with-color \red III} 
			e' ^\markup {\tiny \with-color \red II} 
			c'' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ef4 ^\markup {\tiny \with-color \red IV}  _\markup {"R1:spread"}
			a ^\markup {\tiny \with-color \red III} 
			eqf' ^\markup {\tiny \with-color \red II} 
			aes' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ces4 ^\markup {\tiny \with-color \red IV} _\markup {\column {\line {"2:barré IV&III + II/I"} 
															\line \tiny {"(R not poss.)"}}}
			ges ^\markup {\tiny \with-color \red III} 
			eqf' ^\markup {\tiny \with-color \red II} 
			bqf' ^\markup {\tiny \with-color \red I}
			\bar "|"

			cs4 ^\markup {\tiny \with-color \red IV}  _\markup {"3"}
			aqf ^\markup {\tiny \with-color \red III} 
			e' ^\markup {\tiny \with-color \red II} 
			aqs' ^\markup {\tiny \with-color \red I}
			\bar "|"
	
			cqs4 ^\markup {\tiny \with-color \red IV}  _\markup {"4"}
			aqf ^\markup {\tiny \with-color \red III} 
			ds' ^\markup {\tiny \with-color \red II} 
			c'' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ef4 ^\markup {\tiny \with-color \red IV}  _\markup {"4R"}
			gs ^\markup {\tiny \with-color \red III} 
			eqf' ^\markup {\tiny \with-color \red II} 
			aqs' ^\markup {\tiny \with-color \red I}
			\bar "|."			
			

	}
	\midi {}
	\layout {}
}

\markup {\vspace #2 ""}

\score {
	\new Score \with {
		\override BarNumber #'transparent = ##t
	}		\new Staff \with {
			\override InstrumentName #'font-name = #"Optima"
			instrumentName = "Cello"
			\override Stem #'transparent = ##t
			\override Beam #'transparent = ##t
			\override TimeSignature #'stencil =  ##f
			\override Glissando #'thickness = #5
		} {
			#(set-accidental-style 'dodecaphonic)
			\clef bass
			ces,4 ^\markup {\tiny \with-color \red IV}  _\markup {"1:cramped"}
			gqs, ^\markup {\tiny \with-color \red III} 
			ds ^\markup {\tiny \with-color \red II} 
			bqf ^\markup {\tiny \with-color \red I}
			\bar "|"

			dqf,4 ^\markup {\tiny \with-color \red IV}  _\markup {"R1:cramped"}
			gs, ^\markup {\tiny \with-color \red III} 
			dqs ^\markup {\tiny \with-color \red II} 
			aes ^\markup {\tiny \with-color \red I}
			\bar "|"

			ces,4 ^\markup {\tiny \with-color \red IV}  _\markup {"1:spread"}
			aqf, ^\markup {\tiny \with-color \red III} 
			e ^\markup {\tiny \with-color \red II} 
			c' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ef,4 ^\markup {\tiny \with-color \red IV}  _\markup {"R1:spread"}
			a, ^\markup {\tiny \with-color \red III} 
			eqf ^\markup {\tiny \with-color \red II} 
			aes ^\markup {\tiny \with-color \red I}
			\bar "|"

			ces,4 ^\markup {\tiny \with-color \red IV}  _\markup {\column {\line {"2:barré IV&III + II/I"} 
															\line \tiny {"(R not poss.)"}}}
			ges, ^\markup {\tiny \with-color \red III} 
			eqf ^\markup {\tiny \with-color \red II} 
			bqf ^\markup {\tiny \with-color \red I}
			\bar "|"

			cs,4 ^\markup {\tiny \with-color \red IV}  _\markup {"3"}
			aqf, ^\markup {\tiny \with-color \red III} 
			e ^\markup {\tiny \with-color \red II} 
			aqs ^\markup {\tiny \with-color \red I}
			\bar "|"
	
			cqs,4 ^\markup {\tiny \with-color \red IV}  _\markup {"4"}
			aqf, ^\markup {\tiny \with-color \red III} 
			ds ^\markup {\tiny \with-color \red II} 
			c' ^\markup {\tiny \with-color \red I}
			\bar "|"

			ef,4 ^\markup {\tiny \with-color \red IV}  _\markup {"4R"}
			gs, ^\markup {\tiny \with-color \red III} 
			eqf ^\markup {\tiny \with-color \red II} 
			aqs ^\markup {\tiny \with-color \red I}
			\bar "|."			

		}
	\midi {}
	\layout {}
}

\paper {
	ragged-bottom = ##f
	ragged-last-bottom = ##f
	markup-system-spacing #'basic-distance = #12
	system-system-spacing = #'((basic-distance . 22) (padding . 0))
}

#(set-global-staff-size 23)
\header {
	title = \markup {
		\override #'(font-name . "Optima") {
		"some multiple stops" \tiny "(quartet 2013)"}
		\vspace #1 " "
	}
	tagline = ""
}