\version "2.17.16"
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
\include "/pieces/diotima_quartet/music_files/pressed_bow_gliss.ly"
\include "/pieces/diotima_quartet/music_files/frise_skips.ly"
\include "/pieces/diotima_quartet/music_files/skips_pizz.ly"
\include "/pieces/diotima_quartet/music_files/skips_tuning.ly"
\include "/pieces/diotima_quartet/music_files/skips_tuned.ly"

%TO DO 
%FIX CLUSTER GRACE NOTES
%ADD DYNAMICS AND MARKS TO PRETUNING, TUNING AND TUNING TRANSITION

time_skips = {
	\skips_pizz
	\skips_tuning
	\frise_skips
	\skips_pressed_bow			
	\skips_tuned
}



\score {
	\new StaffGroup <<
		#(set-accidental-style 'dodecaphonic 'StaffGroup)
		%%%VIOLIN I
		\new Staff = "violin_1" \with {
			instrumentName = "VIOLON I"
			shortInstrumentName = "VNO. I"
		} {
			\violin_I_pizz_intro
			\violin_I_second_pizz
			\violin_I_tuning
			\violin_I_bichon_frise
			\violin_one_pressed_bow
			\violin_I_tuned
		}
% 		\new TimeStaff {
% 			\numericTimeSignature
% 			\time_skips
% 		}		
% 		VIOLIN II 
		\new Staff = "violin_2" \with {
			\remove "Bar_number_engraver"				
			instrumentName = "VIOLON II"
			shortInstrumentName = "VNO. 2"
		} {		
			\violin_II_pizz_intro	
			\violin_II_second_pizz	  
			\violin_II_tuning		
			\violin_II_bichon_frise
			\violin_two_pressed_bow
			\violin_II_tuned
		}
		\new TimeStaff \with {
			\consists "Metronome_mark_engraver"
			\override VerticalAxisGroup.staff-staff-spacing = #'(
								(basic-distance . 10) 
								(minimum-distance . 10) 
								(padding . 5)
							    (stretchability . 0)
							)
		}
		{
			\numericTimeSignature
			\time_skips
		}		
% 		%VIOLA/
		\new Staff = "viola" \with {
			\remove "Bar_number_engraver"
			instrumentName = "ALTO"
			shortInstrumentName = "VLA."
		} {
			\viola_pizz
			\viola_tuning	
			\viola_bichon_frise
			\viola_pressed_bow
			\viola_tuned
		}
% 		\new TimeStaff {
% 			\numericTimeSignature
% 			\time_skips
% 		}		
% 		CELLO
		\new Staff = "cello" \with {	
			\consists "Mark_engraver"
			instrumentName = "VIOLONCELLE"
			shortInstrumentName = "VC."
			\override BarNumber.direction = #DOWN
			\override RehearsalMark.direction = #DOWN
		} {
			\cello_pizz_intro
			\cello_pizz_section
			\cello_tuning
			\cello_bichon_frise
			\cello_pressed_bow
			\cello_tuned
		}	




		%%%% BOW POSITION STAVES %%%%% 	
		\new BowPositionStaff \with {alignAboveContext="violin_1"} {
			\skips_pizz
			\skips_tuning
			\frise_skips
			\skips_pressed_bow			
			\violin_one_pos_tuned
		}
		\new BowPositionStaff \with {alignAboveContext="violin_2"} {
			\skips_pizz
			\skips_tuning
			\frise_skips
			\skips_pressed_bow			
			\violin_two_pos_tuned
		}
		\new BowPositionStaff \with {alignAboveContext="viola"} {
			\skips_pizz
			\skips_tuning
			\frise_skips
			\skips_pressed_bow			
			\viola_pos_tuned
		}
		\new BowPositionStaff \with {alignAboveContext="cello"} {
			\skips_pizz
			\skips_tuning
			\frise_skips
			\skips_pressed_bow			
			\cello_pos_tuned
		}
	>>

% 	\midi {}
}