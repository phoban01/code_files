violin_first = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef treble
							e'4 ^\markup {\box I}
						}
					 \layout {} 
				}
			}

violin_second = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef treble
							a'4 ^\markup {\box II}
						}
					 \layout {} 
				}
			}

violin_third = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef treble
							d'4 ^\markup {\center-align \box III}
						}
					 \layout {} 
				}
			}

violin_fourth = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef treble
							g4 ^\markup {\box IV}
						}
					 \layout {} 
				}
			}

viola_first = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef alto
							a'4 ^\markup {\box I}
						}
					 \layout {} 
				}
			}

viola_second = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef alto
							d'4 ^\markup {\box II}
						}
					 \layout {} 
				}
			}

viola_third = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef alto
							g4 ^\markup {\box III}
						}
					 \layout {} 
				}
			}

viola_fourth = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef alto
							c4 ^\markup {\box IV}
						}
					 \layout {} 
				}
			}

cello_first = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef bass
							a4 ^\markup {\box I}
						}
					 \layout {} 
				}
			}

cello_second = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef bass
							d4 ^\markup {\box II}
						}
					 \layout {} 
				}
			}

cello_third = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef bass
							g,4 ^\markup {\box III}
						}
					 \layout {} 
				}
			}

cello_fourth = \markup {  
					\center-align
					\scale #'(0.75 . 0.75)
					\score {
						\new Staff \with {
							\remove "Time_signature_engraver"
							\override Stem #'stencil = ##f
						}{
							\clef bass
							c,4 ^\markup {\box IV}
						}
					 \layout {} 
				}
			}

tuning_peg_first = \markup {
	\center-align
	\center-column {
		\fontsize #-5
		\box \normal-text "I"
		\translate #'(-1 . 0)
		\scale #'(4.5 . 4.5)
		\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/tuning.eps"
	}
}

tuning_peg_second = \markup {
	\center-align
	\center-column {
		\fontsize #-5
		\box \normal-text "II"
		\translate #'(-1 . 0)
		\scale #'(4.5 . 4.5)
		\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/tuning.eps"
	}
}

tuning_peg_third = \markup {
	\center-align
	\center-column {
		\fontsize #-5
		\box \normal-text "III"
		\translate #'(-1 . 0)
		\scale #'(4.5 . 4.5)
		\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/tuning.eps"
	}
}

tuning_peg_fourth = \markup {
	\center-align
	\center-column {
		\fontsize #-5
		\box \normal-text "IV"
		\translate #'(-1 . 0)
		\scale #'(4.5 . 4.5)
		\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/tuning.eps"
	}
}

fingernail = \markup {
	\center-align
	\scale #'(0.75 . 1.25)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/fingernail.eps"
}

up_bow = \markup {
	\center-align
	\scale #'(1.7 . 1.7)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/up_bow.eps"
}

down_bow = \markup {
	\center-align
	\scale #'(1.5 . 1.5)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/down_bow.eps"
}

% up_bow_light = \markup {
% 	\center-align
% 	\scale #'(1.7 . 1.7)
% 	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/up_bow_light.eps"
% }

up_bow_light = \markup {
	\center-align
	\override #'(on . 0.3)
	\override #'(off . 0.1)
	\combine
	\draw-dashed-line #'(0.85 . -2)
	\translate #'(0.85 . -2)
	\draw-dashed-line #'(0.85 . 2)
}

down_bow_light = \markup {
	\center-align
	\override #'(on . 0.3)
	\override #'(off . 0.1)
	\combine
	\draw-dashed-line #'(2 . 0)
	\combine
	\translate #'(2 . 0)
	\draw-dashed-line #'(0 . -2)
	\translate #'(0 . 0)
	\draw-dashed-line #'(0 . -2)	
}

% down_bow_light = \markup {
% 	\center-align
% 	\scale #'(1.6 . 1.6)
% 	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/down_bow_light.eps"
% }

frog = \markup {
	\center-align
	\override #'(thickness . 0.5)
	\box
	\scale #'(0.7 . 0.7)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/frog.eps"
}

midbow = \markup {
	\center-align
	\override #'(thickness . 0.5)	
	\box
	\scale #'(0.6 . 0.6)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/midbow.eps"
}

tip = \markup {
	\center-align
	\override #'(thickness . 0.5)	
	\box
	\pad-markup #-0.1
	\scale #'(0.8 . 0.8)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/tip.eps"
}

bow = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/bow.eps"
}

clockwise = \markup {
	\center-align
	\scale #'(2.75 . 2.75)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/clockwise.eps"
}

anticlockwise = \markup {
	\center-align
	\scale #'(2.5 . 2.8)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/anticlockwise.eps"
}

clockhead = {
	\once \override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {\translate #'(0 . -1) \clockwise}
	\once \override NoteHead #'stem-attachment = #'(0 . 0.3)
}

anti-clockhead = {
	\once \override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {\translate #'(0 . -1.25) \anticlockwise}
	\once \override NoteHead #'stem-attachment = #'(0 . 0.5)
}

% \score {
% 	\new Staff \with {\override StaffSymbol #'line-count = #1 middleCPosition = #0 } {
% 		\clockhead c'8 [ \anti-clockhead c'8 ^\tip ]
% 	}
% }

up_bow_heavy = \markup {
	\center-align
	\scale #'(1.7 . 1.7)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/up_bow_heavy.eps"
}

down_bow_heavy = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/down_bow_heavy.eps"
}

up_bow_very_heavy = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/up_bow_very_heavy.eps"
}

down_bow_very_heavy = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/down_bow_very_heavy.eps"
}

circular_bow = \markup {
	\center-align
	\scale #'(4 . 4.1)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/circular_bow.eps"
}

horz_bow = \markup {
	\center-align	
	\scale #'(5 . 5)
	\epsfile #X #1 #"/pieces/diotima_quartet/eps_files/horz_bow.eps"
}

vertical_bow = \markup {
	\center-align
	\rotate #90
	\scale #'(4 . 5.25)
	\epsfile #X #1 #"/pieces/diotima_quartet/eps_files/horz_bow.eps"
}

angle_bow = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/angle_bow.eps"
}

angle_bow = \markup {
	\center-align
	\scale #'(2 . 2)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/angle_bow.eps"
}

nut = \markup {
	\center-align	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1	
	"NUT"
}

sulpont = \markup {
	\center-align	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"SP"
}

altosulpont = \markup {
	\center-align	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1	
	"ASP"
}

nat = \markup {
	\center-align	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"NAT"
}

sultasto = \markup {
	\center-align	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"ST"
}

altosultasto = \markup {
	\center-align 	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout
	\box
	\pad-markup #0.1		
	"AST"
}

aldita = \markup {
	\center-align 	
	\override #'(font-family . typewriter)
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"AD"
}

flat_bow = \markup {
	\upright
	\center-align
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"0º"
}

tilt_bow = \markup {
	\upright
	\center-align 
	\fontsize #-1
	\whiteout	
	\box
	\pad-markup #0.1		
	"90º"
}

ear = \markup {
	\left-align
	\scale #'(5.5 . 5.5)
	\epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/listen.eps"
}

mute-sign = \markup {
	\combine
	\draw-circle #1 #0.2 ##f
	\override #'(thickness . 1.25)
	\combine
	\translate #'(-1.5 . 0)
	\draw-line #'(3 . 0)
	\translate #'(-1.5 . 0)
	\rotate #90
	\draw-line #'(3 . 0)

}

bow-mute = \markup {
	\combine
	\draw-circle #1 #0.2 ##f
	\combine
	\translate #'(-1.5 . 0)
	\draw-line #'(3 . 0)
	\combine
	\translate #'(0 . 1.5)
	\draw-line #'(0 . -3.5)
	\translate #'(0 . -2)
	\override #'(on . 0.45)
  	\override #'(off . 0.2)
	\draw-dashed-line #'(-3 . 0)

}

tuning_fermata = \markup {
	\line {" " " " \musicglyph #"scripts.ufermata"}
}

draw_bracket = #(define-music-function (parser location symbol) (markup?)
	#{
		\override TextSpanner.bound-details.right.arrow = ##f	
		\override TextSpanner.bound-details.left.text = $symbol
		\override TextSpanner.bound-details.right.text = \markup {\draw-line #'(0 . -0.75)}
		\override TextSpanner.bound-details.left.stencil-align-dir-y = #0
		\override TextSpanner.bound-details.right.stencil-align-dir-y = #0		
		\override TextSpanner.bound-details.right.padding = #-1
		\override TextSpanner.style = #'solid
	#}

)

draw_line_arrow = #(define-music-function (parser location start end) (markup? markup?)
	(let* (
		(padded-right (markup #:center-align #:concat (" " #:hspace 0.75 end))))
	#{
		\override TextSpanner.bound-details.right.arrow = ##t			
		\override TextSpanner.bound-details.left.text = $start
		\override TextSpanner.bound-details.right.text = $padded-right
		\override TextSpanner.bound-details.left.stencil-align-dir-y = #0
		\override TextSpanner.bound-details.right.stencil-align-dir-y = #0
		\override TextSpanner.style = #'dashed-line
		\override TextSpanner.dash-period = #1.25
		\override TextSpanner.arrow-length = #0.5
		\override TextSpanner.arrow-width = #0.25
		\override TextSpanner.rotation = #'(0 0 0)
	#}
	)
)

draw_tuning_arrow = #(define-music-function (parser location start end) (markup? markup?)
	#{
		\override Voice.TextSpanner.outside-staff-priority = #1000
		\override TextSpanner.bound-details.right.arrow = ##t			
		\override TextSpanner.bound-details.left.text = $start
		\override TextSpanner.bound-details.right.text = $end
		\override TextSpanner.bound-details.left.stencil-align-dir-y = #0
		\override TextSpanner.bound-details.right.stencil-align-dir-y = #-0.2
		\override TextSpanner.style = #'dashed-line
		\override TextSpanner.dash-period = #0.6
		\override TextSpanner.arrow-length = #0.5
		\override TextSpanner.arrow-width = #0.25
		\override TextSpanner.rotation = #'(0 0 0)
		\override TextSpanner.bound-details.right.padding = #2
		\override TextSpanner.bound-details.left.padding = #0
	#}

)

#(define-markup-command (string-numbers layout props data) (list?)
	(let* (
		(input (first data))
		(offset-x (second data))
		(offset-y (third data))
		(split-string (string-split input #\space))
		(str-length (length split-string))
		(font-size -1)
		(output 
			(cond 
				((<= str-length 2) (markup #:fontsize font-size input))
				((= str-length 3) (markup 
						#:override '(word-space . -0.25)
						#:fontsize font-size #:line ( #:left-column ( (first split-string) (third split-string)) (second split-string))))
				((= str-length 4) (markup 
						#:override '(word-space . 0.25)
						#:fontsize (- font-size 1) #:line ( #:left-column ( (first split-string) (third split-string))
													  #:left-column ( (second split-string) (fourth split-string))
													  	)))
			))
	)
	(interpret-markup layout props (markup #:override '(font-name . "AdobeCaslonPro") #:translate (cons (+ -5 offset-x)  (+ 0 offset-y)) output)))
)

% \score {
% 	\new Staff {
% 		c'4 ^\markup {\line { \ear "ecoute"}}
% 	}
% }

