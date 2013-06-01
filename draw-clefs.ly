\version "2.17.15"

body-clef = #(define-music-function (layout props clef-type) (symbol?)
	(let* (
		(full "/pieces/diotima_quartet/eps_files/full_violin_clef.eps")
		(fingerboard "/pieces/diotima_quartet/eps_files/fingerboard_clef.eps")
		(bow-area "/pieces/diotima_quartet/eps_files/bow_area_clef.eps")
		(clef (cond
			((equal? clef-type 'full) full)
			((equal? clef-type 'fingerboard) fingerboard)
			((equal? clef-type 'bow-area) bow-area)
			((equal? clef-type 'fingerboard-small) fingerboard)
			((equal? clef-type 'bow-area-small) bow-area)

			))
		(translate (cond
			((equal? clef-type 'full) '(0 . -5))
			((equal? clef-type 'fingerboard) '(0 . -5.4))
			((equal? clef-type 'bow-area) '(0 . -7))
			((equal? clef-type 'fingerboard-small) '(0 . -2.1))
			((equal? clef-type 'bow-area-small) '(0 . -3.5))

			))
		(scale (cond
			((equal? clef-type 'full) '(18 . 16))
			((equal? clef-type 'fingerboard) '(18 . 15))
			((equal? clef-type 'bow-area) '(16 . 20))
			((equal? clef-type 'fingerboard-small) '(13 . 7.1))
			((equal? clef-type 'bow-area-small) '(8 . 11))
			))		
		)
	#{
		\override Staff.Clef.stencil = #ly:text-interface::print 
		\override Staff.Clef.text = \markup {
							\translate $translate
							\rotate #180
							\scale $scale
							"shit"
							\epsfile #Y #1 $clef
		}
	#})
)

full = \markup {\scale #'(20 . 20) \epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/full_violin_clef.eps"}
fingerboard = \markup {\scale #'(20 . 20) \epsfile #Y #1  #"/pieces/diotima_quartet/eps_files/fingerboard_clef.eps"}
bow-area = \markup {\scale #'(20 . 20) \epsfile #Y #1 #"/pieces/diotima_quartet/eps_files/bow_area_clef.eps"}

fingerboard_path = \markup {
		\override #'(line-join-style . miter)
		\combine
		\path #0.15 #'(
			(moveto 0.2 0)
			(curveto 0.2 0 1 0.5 1.8 0)
			(lineto 2.65 -14)
			(moveto 0.2 0)
			(lineto -0.65 -14)
			(moveto -0.65 -14)
			(curveto -0.65 -14 1 -13.5 2.65 -14)
			)
		\combine
		\path #0.075 #'(
			(moveto 0.5 0.1)
			(curveto 0.5 0.1 -0.55 -16 -0.1 -18.85)
			(moveto 0.8 0.15)
			(curveto 0.8 0.1 0.5 -16 0.7 -18.85)
			(moveto 1.2 0.15)
			(curveto 1.2 0.1 1.7 -16 1.5 -18.85)
			(moveto 1.5 0.1)
			(curveto 1.5 0.1 2.65 -16 2.2 -18.85)		
			)
		\override #'(line-cap-style . square)
		\path #0.4 #'(
			(moveto -0.75 -17.5)
			(curveto -0.75 -17.5 1 -17.6 2.75 -17.5)	
		)
	}

bow_area_path = \markup {
		\override #'(line-join-style . miter)
		\combine
		\path #0.15 #'(
				(moveto -0.35 0)
				(lineto -0.5 -2)
				(moveto -0.5 -2)
				(curveto -0.5 -2 1 -2.25 3 -2)
				(moveto 3 -2)
				(lineto 2.85 0)
				(moveto -1 -9.5)
				(lineto 3.4 -9.5)
				(lineto 3.25 -10.6)
				(moveto -1 -9.5)
				(lineto -0.85 -10.6)
			)
		\combine
		\path #0.075 #'(
			(moveto 0.1 0.2)
			(curveto 0.1 0.2 -0.3 -6 0.1 -10.25)
			(moveto 0.9 0.2)
			(curveto 0.9 0.1 0.75 -6 0.9 -10.25)		
			(moveto 1.7 0.2)
			(curveto 1.7 0.1 2 -6 1.75 -10.25)
			(moveto 2.5 0.2)
			(curveto 2.5 0.1 3 -6 2.5 -10.25)		
			)
		\override #'(line-cap-style . square)		
		\path #0.4 #'(
			(moveto -0.5 -6.75)
			(curveto -0.5 -6.75 1.1 -6.75 3 -6.75)	
		)	
	}


\score {
	\new Staff {
		c'1 ^\bow_area_path 
		c'1 ^\fingerboard_path 

	}
}
