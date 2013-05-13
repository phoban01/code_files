\version "2.17.15"

#(define (make-markup-list string)
	(let* (
		;(split (string-split string #\space))
		(markup-list (markup ))
		;(out (map (lambda (x) (list (markup x) markup-list)) split))
	)
		(display (markup string))
		string
	)
)

#(define (pizz-number grob text)
	(let* 
		(
			(layout (ly:grob-layout grob))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(split-string (string-split text #\space))
			(str-length (length split-string))			
			(adjust (cond
					((= str-length 1) -0.2)
					((= str-length 2) -0.4)
					((= str-length 3) -0.6)
					((= str-length 4) -1)
					((> str-length 4) -2)
				))			
			(custom-note (markup
					#:translate (cons adjust 0)
					#:fontsize -6
					#:override '(font-name . "AdobeCaslonPro")
					#:override '(thickness . 0.75)
					#:box
					#:center-column (
					#:pad-markup 0.1
					#:whiteout
					(first split-string)
					(if (>= str-length 2) (second split-string) "")					
					(if (>= str-length 3) (third split-string) "")					
					(if (>= str-length 4) (fourth split-string) "")					
				)))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
		(display str-length) (newline)
		(set! (ly:grob-property grob 'stem-attachment) '(0 . 1))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

pizz_head = #(define-music-function (layout props text) (string?)
	#{
		\override NoteHead #'stencil = #(lambda (grob) (pizz-number grob text))
	#}
)


\score {
	\new Staff {
			\pizz_head "IV III II I" c32.
	}
}