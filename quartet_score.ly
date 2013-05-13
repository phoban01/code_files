\version "2.17.15"
\language "english"

%%%%INCLUDES
\include "/pieces/diotima_quartet/code_files/eighthTone.ly"
\include "/pieces/diotima_quartet/code_files/quartet_template.ly"

\pointAndClickOff

%%%%MUSIC
\include "/pieces/diotima_quartet/music_files/violin_I_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/cello_pizz_intro.ly"
\include "/pieces/diotima_quartet/music_files/violin_I_pizz.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_pizz.ly"
\include "/pieces/diotima_quartet/music_files/viola_pizz.ly"
\include "/pieces/diotima_quartet/music_files/cello_pizz.ly"

\score {
	\new StaffGroup <<
		#(set-accidental-style 'dodecaphonic 'StaffGroup)
		%%%VIOLIN I
% 		\new Staff = "violin_1" \with {
% 			instrumentName = "VIOLON I"
% 			shortInstrumentName = "VNO. I"

% 		} {
% 			\violin_I_pizz_intro
% 		}
% 		%%%VIOLIN II
% 		\new Staff = "violin_2" \with {
% 			\remove "Bar_number_engraver"			
% 			instrumentName = "VIOLON II"
% 			shortInstrumentName = "VNO. 2"

% 		} {		
% 			\violin_II_pizz_intro
% 		}
		%%%VIOLA
		\new Staff = "viola" \with {
% 			\remove "Bar_number_engraver"
			instrumentName = "ALTO"
			shortInstrumentName = "VLA."

		} {
			<<
				\new RightHandVoice = "upper" {
					\viola_pizz_right
				} 
				\new LeftHandVoice = "lower" {
					\viola_pizz_left
				}
			>>	
		}
% 		%%%CELLO
% 		\new Staff = "cello" \with {
% 			instrumentName = "VIOLONCELLE"
% 			shortInstrumentName = "VC."

% 			\override BarNumber #'direction = #DOWN

% 		} {
% 			\cello_pizz_intro
% 		}		
	>>
% 	\midi {} 
}