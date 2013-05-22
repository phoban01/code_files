\version "2.17.15"
\language "english"

%%%%INCLUDES
\include "/pieces/diotima_quartet/code_files/eighthTone.ly"
\include "/pieces/diotima_quartet/code_files/quartet_template.ly"

\pointAndClickOff

%%%%MUSIC
\include "/pieces/diotima_quartet/music_files/violin_I_pizz.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_pizz.ly"
\include "/pieces/diotima_quartet/music_files/viola_pizz.ly"
\include "/pieces/diotima_quartet/music_files/cello_pizz.ly"
\include "/pieces/diotima_quartet/music_files/violin_I_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/cello_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/violin_I_angle_bowing.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_angle_bowing.ly"
\include "/pieces/diotima_quartet/music_files/viola_angle_bowing.ly"
\include "/pieces/diotima_quartet/music_files/cello_angle_bowing.ly"


\score {
	\new StaffGroup <<
		#(set-accidental-style 'dodecaphonic 'StaffGroup)
		%%%VIOLIN I
		\new Staff = "violin_1" \with {
			instrumentName = "VIOLON I"
			shortInstrumentName = "VNO. I"

		} {
% 			\violin_I_pizz_intro
% 			\violin_I_second_pizz
			\violin_I_angles
		}
		%VIOLIN II
		\new Staff = "violin_2" \with {
% 			\remove "Bar_number_engraver"			
			instrumentName = "VIOLON II"
			shortInstrumentName = "VNO. 2"
		} {		
% 			\violin_II_pizz_intro
% 			\violin_II_second_pizz	 
			\violin_II_angles		
		}
% 		%VIOLA
		\new Staff = "viola" \with {
% 			\remove "Bar_number_engraver"
			instrumentName = "ALTO"
			shortInstrumentName = "VLA."

		} {
% 			\viola_pizz
			\viola_angles	

		}
% 		%CELLO
		\new Staff = "cello" \with {
			instrumentName = "VIOLONCELLE"
			shortInstrumentName = "VC."
			\override BarNumber #'direction = #DOWN
			
		} {
% 			\cello_pizz_intro
% 			\cello_pizz_section
			\cello_angles
		}		
	>>

}