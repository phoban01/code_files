\language "english"

\score {
	\new Score {
		<<
		\set Score.midiInstrument =  #"violin"
		\new Staff {
			\set Staff.instrumentName = "VIOLIN I"
			<cqs'' bs'>1 ^\markup {"IIc"} _\markup {"IIIc"}
		}
		\new Staff {
			\set Staff.instrumentName = "VIOLIN II"
			<d''! dqf''>1 ^\markup {"IIc"} _\markup {"IIIc"}
		}
		\new Staff {
			\set Staff.instrumentName = "VIOLA"
			\clef alto
			<e'! eqf'>1 ^\markup {"IIIc"} _\markup {"IVc"}
		}
		\new Staff {
			\set Staff.instrumentName = "CELLO"
			\clef treble
			<d'! dqf''>1 ^\markup {"Ic"} _\markup {"IIc"}
		}		
	>>				
	}
	\midi {}
	\layout {}
}