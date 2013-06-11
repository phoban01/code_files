
\score {
	\new Staff {

		\set Staff.clefPosition = #-2

		c'4 ^\markup {\translate #'(-0.5 . 0) \left-align \center-column {\fontsize #2 " 5\"" \fontsize #2 \musicglyph #"scripts.ufermata" }}
c'4 ^\markup {\translate #'(-0.5 . 0) \left-align \center-column {\fontsize #2 " 15\"" \scale #'(1.35 . 1) \fontsize #2 \musicglyph #"scripts.ulongfermata" }}
	}
}