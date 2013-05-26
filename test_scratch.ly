\include "/pieces/diotima_quartet/code_files/quartet_template.ly"

% \pointAndClickOff

#(define (scratch-tone grob)
	(let* 
		(
			(layout (ly:grob-layout grob))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(stem (ly:grob-object grob 'stem))
			(stem-dir (ly:grob-property stem 'direction))
			(stem-attach (if (= stem-dir 1)  '(-0.4 . 0.8) '(0.5 . -2.7)))
			(mult (magstep fsz))
			(custom-note (markup
					#:path 0.15
					'(
						(moveto 0 0)
						(lineto 0 1)
						(lineto 1 1)
						(lineto 1 0)
						(lineto 2 0))
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
		(set! (ly:grob-property grob 'stem-attachment) stem-attach)
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)


fast-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #0.8
}

med-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #1.5
}

slow-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #3.5
}

#(define transpose-mapping
   (list
    (cons (ly:make-pitch 0 6 NATURAL) 2.5)
    (cons (ly:make-pitch 0 5 NATURAL) 0)
    (cons (ly:make-pitch 0 4 NATURAL) 1)
    (cons (ly:make-pitch 0 3 NATURAL) 0)
    (cons (ly:make-pitch 0 2 NATURAL) -0.5)
    (cons (ly:make-pitch 0 1 NATURAL) 0)
    (cons (ly:make-pitch 0 0 NATURAL) -2)
    ))

#(define (string-staff-transpose grob)
	(let* (
		(pitch (ly:event-property (event-cause grob) 'pitch))
		(new-pitch (cdr (assoc pitch transpose-mapping)))
	)
		new-pitch
	)

)

\score {
	\new StaffGroup <<
	\new Staff {
		\switch-staff \pizz_staff
		\body-clef #'full
		\override NoteHead.stencil = #scratch-tone
		\override Glissando.style = #'dashed-line
		\override Glissando.bound-details.right.padding = #0.35
		\override Glissando.thickness = #1.5
		\slow-zigzag
		\ppos #0.8 c'4 \glissando \ppos #0.2 c'4 \glissando \ppos #0.7 c'8
		\med-zigzag
		\ppos #0.8 c'4 \glissando \ppos #0.2 c'4 \glissando \ppos #0.7 c'8
		\fast-zigzag
		\ppos #0.8 c'4 \glissando \ppos #0.2 c'4 \glissando \ppos #0.7 c'8
	}
	\new Staff {
		\override Staff.TimeSignature.extra-offset = #'(0 . 0.25)
		\override Staff.Accidental.stencil = ##f
		\override Staff.NoteHead.Y-offset = #string-staff-transpose
		\override Staff.Clef.stencil = #ly:text-interface::print
		\override Staff.Clef.text = \markup {
			\override #'(font-name . "AdobeCaslonPro")
			\fontsize #-2
			\combine
			\translate #'(0.7 . 2.75)
			"I"
			\combine
			\translate #'(2.5 . 1.25)
			"II"
			\combine
			\translate #'(0 . -0.25)
			"III"
			\translate #'(2.25 . -1.75)
			"IV"
		}
		\override Staff.Glissando.bound-details.left.padding = #0
		\override Staff.Glissando.bound-details.right.padding = #0
		\override Staff.StaffSymbol #'line-positions = #'(-4.25 -1.25 1.75 4.75)		
		\circles
		c'4 \glissando <c' e'>4 \glissando <e' g'>4 \glissando <e' g'>4

		\tuplet 3/2 {c'16 e'16 g'16} \tuplet 3/2 {b'16 g'16 e'16}

	}

	>>
}