\version "2.17.15"
\language "english"
\include "/pieces/diotima_quartet/code_files/quartet_template.ly"

ppos = #(define-music-function (layout props pos music) (number? ly:music?)
			(let* (
				(gap-size 22)
				(calc-position (inexact->exact (* gap-size pos)))
				(octave (floor (/ calc-position 7)))
				(step (modulo (floor calc-position) 7))
				(alter 0)
				(new-pitch (ly:make-pitch (- octave 2) (+ step 3) alter))
			)
			(ly:music-set-property! music 'pitch new-pitch)
			music
		))

\score {
	\new Score {
		\new PizzStaff {
			\ppos #0.05 c16 [  \ppos #0.2 c16 \ppos #0.3 c16 ]
		}
	}
% 	\midi {}
% 	\layout {}
}