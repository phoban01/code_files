
\score {
	\new Staff {

		\set Staff.clefPosition = #-2

% 		c'4 ^\markup {\translate #'(-0.5 . 0) \left-align \center-column {\fontsize #2 " 5\"" \fontsize #2 \musicglyph #"scripts.ufermata" }}
% c'4 ^\markup {\translate #'(-0.5 . 0) \left-align \center-column {\fontsize #2 " 15\"" \scale #'(1.35 . 1) \fontsize #2 \musicglyph #"scripts.ulongfermata" }}

	c'4 _#(markup	
					#:translate '(0.5 . 0)
					#:center-align
					#:translate (cons 0 4)
					#:override '(thickness . 0.75)
					#:box
					#:override '(baseline-skip . 0.35)
					#:pad-markup 0
					#:fontsize -3
					#:override '(word-space . 0.05)
					#:line (
					#:override '(font-name . "AdobeCaslonPro")	
					#:vcenter					
					#:whiteout "IV"
					#:combine
					#:translate '(1.25 . 0)
					#:arrow-head X RIGHT #t
					#:scale '(1 . 0.6)
					#:musicglyph "scripts.prall"
					#:vcenter					
					#:override '(font-name . "AdobeCaslonPro")
					#:whiteout "I"
					)
				)
		}
}