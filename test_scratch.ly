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
	\new StringStaff {
		\circles
		c'4 \glissando <c' e'>4 \glissando <e' g'>4 \glissando <e' g'>4

		\tuplet 3/2 {c'16 e'16 g'16} \tuplet 3/2 {b'16 g'16 e'16}

	}

	>>
}