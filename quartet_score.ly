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
\include "/pieces/diotima_quartet/music_files/violin_I_tuning.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_tuning.ly"
\include "/pieces/diotima_quartet/music_files/viola_tuning.ly"
\include "/pieces/diotima_quartet/music_files/cello_tuning.ly"
\include "/pieces/diotima_quartet/music_files/bichon_frise_viola.ly"
\include "/pieces/diotima_quartet/music_files/bichon_frise_violin_II.ly"
\include "/pieces/diotima_quartet/music_files/clock_scratch_frise.ly"
\include "/pieces/diotima_quartet/music_files/violin_I_tuned.ly"
\include "/pieces/diotima_quartet/music_files/violin_II_tuned.ly"
\include "/pieces/diotima_quartet/music_files/viola_tuned.ly"
\include "/pieces/diotima_quartet/music_files/cello_tuned.ly"
 
%TO DO 
%FIX CLUSTER GRACE NOTES
%ADD DYNAMICS AND MARKS TO PRETUNING, TUNING AND TUNING TRANSITION


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
% 			\violin_I_tuning
% 			\violin_I_bichon_frise
			\violin_I_tuned
		}
% 		VIOLIN II 
		\new Staff = "violin_2" \with {
% 			\remove "Bar_number_engraver"			
			instrumentName = "VIOLON II"
			shortInstrumentName = "VNO. 2"
		} {		
% % 			\violin_II_pizz_intro	
% % 			\violin_II_second_pizz	  
% % 			\violin_II_tuning		
% % 			\violin_II_bichon_frise
				\violin_II_tuned
		}
% 		%VIOLA
% 		\new Staff = "viola" \with {
% 			\remove "Bar_number_engraver"
% 			instrumentName = "ALTO"
% 			shortInstrumentName = "VLA."	
% 		} {
% % 			\viola_pizz
% % 			\viola_tuning	
% % 			\viola_bichon_frise
% % 			\viola_tuned
% 		}
% 		%CELLO
% 		\new Staff = "cello" \with {
% 			instrumentName = "VIOLONCELLE"
% 			shortInstrumentName = "VC."
% 			\override BarNumber #'direction = #DOWN
% 		} {
% % 			\cello_pizz_intro
% % 			\cello_pizz_section
% % 			\cello_tuning
% % 			\cello_bichon_frise
% % 			\cello_tuned
% 		}		
	>>
% 	\midi {}
}