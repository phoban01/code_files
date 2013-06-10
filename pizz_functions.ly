

#(define (arp-pizz-number grob start stop)
	(let* 
		(
			(layout (ly:grob-layout grob))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(custom-note (markup
					#:translate '(0.5 . 0)
					#:center-align
					#:translate (cons 0 4)
					#:override '(thickness . 0.75)
					#:box
					#:override '(baseline-skip . 0.35)
					#:pad-markup 0
					#:fontsize -7					
					#:center-column (
					#:override '(font-name . "AdobeCaslonPro")	
					#:whiteout start
					#:override '(thickness . 1.5)
					;#:draw-line '(0 . -0.65)
					#:vspace 0.01
					#:fontsize 1
					#:combine 
					#:rotate 90
					#:scale '(0.75 . 0.4)
					#:translate '(0 . 0)
					#:musicglyph "scripts.prallprall" 
					#:translate '(-0.235 . -0.6)
					#:rotate 180
					#:scale '(0.7 . 0.8)
					#:musicglyph "noteheads.d2doThin"
					#:vspace 0.05
					#:override '(font-name . "AdobeCaslonPro")
					#:whiteout stop
					)
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
		(set! (ly:grob-property grob 'layer) 100)
		(set! (ly:grob-property grob 'stem-attachment) '(0 . 1))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

arp_pizz_head = #(define-music-function (layout props start stop) (string? string?)
	#{
		\override NoteHead #'stencil = #(lambda (grob) (arp-pizz-number grob start stop))
	#}
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
			(stem (ly:grob-object grob 'stem))
			(dir (ly:grob-property stem 'direction))					
			(custom-note (markup
					#:center-align
					#:fontsize -6
					#:override '(font-name . "AdobeCaslonPro")
					#:override '(thickness . 0.75)
					#:box
					#:center-column (
					#:pad-markup 0.1
					#:whiteout
					text		
				)))
			(my-stencil (ly:text-interface::interpret-markup layout props (markup #:translate '(0.5 . 0) custom-note)))
		)
		;(display (string-split text #\space)) (newline)
		(set! (ly:grob-property grob 'layer) 100)
		(set! (ly:grob-property grob 'stem-attachment) (if (= dir 1) '(0 . 1) '(0 . -0.25)))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

pizz_head = #(define-music-function (layout props text) (string?)
	#{
		\override NoteHead #'stencil = #(lambda (grob) (pizz-number grob text))
	#}
)

#(define (set-stem-position grob ideal-length)
	(let* (
		(notehead (ly:grob-property grob 'cause))
		(notehead-pos (ly:grob-staff-position notehead))
		;(ideal-length 10)
		(diff (- notehead-pos ideal-length))
		(new-length (- ideal-length diff))
	)
	;(display grob) (newline)
	(ly:grob-set-property! grob 'length new-length)
	)
) 

#(define (pizz-circle-head grob)
	(let* 
		(
			(notehead-pos (* (ly:grob-staff-position grob) 1))	
			(pitch (ly:pitch-tones (ly:event-property (ly:grob-property grob 'cause) 'pitch)))
			(ideal-length 15)
			(diff (- ideal-length pitch))
			(new-val (+ ideal-length diff))
			(layout (ly:grob-layout grob))
			(duration (ly:moment-main-denominator (ly:duration-length (ly:event-property (ly:grob-property grob 'cause) 'duration))))
			(filled (if (< duration 4) #f #t))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(custom-note (markup
					#:translate '(0.5 . 0)
					#:combine
					#:with-color white
					#:draw-circle 0.5 0 filled
					#:draw-circle 0.5 0.2 #f
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
;		(display (ly:grob-properties (ly:grob-parent grob Y))) (newline)
		(set! (ly:grob-property grob 'layer) 100)
;		(set! (ly:grob-property grob 'stem-attachment) (cons 0 (+ 24 pitch)))
		(set! (ly:grob-property grob 'stem-attachment) (cons 0 (+ 30 pitch)))

		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

#(define (pizz-circle-head-grace grob)
	(let* 
		(
			(notehead-pos (* (ly:grob-staff-position grob) 1))	
			(pitch (ly:pitch-tones (ly:event-property (ly:grob-property grob 'cause) 'pitch)))
			(ideal-length 15)
			(diff (- ideal-length pitch))
			(new-val (+ ideal-length diff))
			(layout (ly:grob-layout grob))
			(duration (ly:moment-main-denominator (ly:duration-length (ly:event-property (ly:grob-property grob 'cause) 'duration))))
			(filled (if (< duration 4) #f #t))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(custom-note (markup
					#:translate '(0.5 . 0)
					#:draw-circle 0.5 0.2 filled
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
;		(display (ly:grob-properties (ly:grob-parent grob Y))) (newline)
		(set! (ly:grob-property grob 'stem-attachment) (cons 0 0))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

#(define (set-dot-position grob pos)
	(let* 
		(
			(notehead (ly:grob-property grob 'cause))
			(pos (* (ly:grob-staff-position notehead) 1))	
			(ideal-length pos)
			(diff (- ideal-length pos))
			(new-val (+ ideal-length diff))
		)
		new-val
	)
)

#(define (fingernail-pizz grob)
	(let* 
		(
			(layout (ly:grob-layout grob))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(custom-note (markup
					#:override '(line-cap-style . square)
					#:path 0.1
					'(
						(moveto -1 0)
						(curveto -1 0  0 -1    1 0)
						(curveto 1  0  0.1 -2 -1 0)
						(closepath)
					)
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
		(set! (ly:grob-property grob 'stem-attachment) '(0 . 0))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

#(define (fingertip-pizz grob)
	(let* 
		(
			(layout (ly:grob-layout grob))
			(props (ly:grob-alist-chain grob (ly:output-def-lookup layout 'text-font-defaults)))
			(fsz  (ly:grob-property grob 'font-size 0.0))
			(mult (magstep fsz))
			(custom-note (markup
					#:override '(line-cap-style . square)
					#:filled-box '(-1 . 1) '(-0.3 . 0.3) 0
				))
			(my-stencil (ly:text-interface::interpret-markup layout props custom-note))
		)
		(set! (ly:grob-property grob 'stem-attachment) '(0 . 0))
		(set! (ly:grob-property grob 'stencil) (ly:stencil-scale my-stencil mult mult))
	)
)

#(define (iter-append n input-list appendage)
    (if (= (length input-list) n) 
    	input-list
    	(iter-append n (append input-list (list appendage)) appendage)
    )
)

#(define (make-padded-list input pad-with)
	(let* (
		(correct-size 4)
		(actual-size (length input))
		(new-list (iter-append correct-size input pad-with))
	)
	new-list
	)
)

#(define (pizz-box-stem grob input)
	(let* 
		(
		(pad-input (make-padded-list input ""))
		(lookup '(
				("I" . '((-0.6 . 0) (0.25 . -0.5) (-1 . -1.25) (0.5 . -1.75)))
				( "II" . '((-1 . 0) (0.3 . -0.5) (-1 . -1.25) (0.5 . -1.75)))
				( "III" . '((-1.5 . 0) (0.5 . -0.5) (-1.5 . -1.25) (0.5 . -1.75)))
				( "IV" . '((-1.4 . 0) (0.5 . -0.5) (-1 . -1.25) (0.35 . -1.75)))
				("" . '( (0 . 0) (0 . 0) (0 . 0) (0 . 0) ))
			))
		(profile (list 
						 (first (car (cdr (cdr (assoc (first pad-input) lookup)))))
						 (second (car (cdr (cdr (assoc (second pad-input) lookup)))))
						 (third (car (cdr (cdr (assoc (third pad-input) lookup)))))
						 (fourth (car (cdr (cdr (assoc (fourth pad-input) lookup)))))

		))
		(font-size (cond
			((equal? (length input) 1) -5)
			((equal? (length input) 2) -6)
			((equal? (length input) 3) -7)
			((equal? (length input) 4) -8)
		))
		(notehead (ly:grob-property grob 'cause))
		(notehead-pos (* (ly:grob-staff-position notehead) 0.5))
		(notehead-sign (if (> notehead-pos 0) -3 1))
		(stem (ly:stem::print grob))
      	(text (markup 
      			#:center-align
      			#:translate (cons 0 (+ 9 (length input)))
      			#:override '(font-name . "AdobeCaslonPro")
      			#:fontsize font-size
      			#:center-column (
      			;#:pad-markup 1
      			;#:combine
				;#:whiteout #:translate (first profile) 
				(first pad-input)
				;#:combine
      			;#:pad-markup 1				
				;#:whiteout #:translate (second profile) 
				(second pad-input)
				;#:combine
      			;#:pad-markup 1				
				;#:whiteout #:translate (third profile) 
				(third pad-input)
      			;#:pad-markup 1				
				;#:whiteout #:translate (fourth profile) 
				(fourth pad-input))
      	))
      	(text (grob-interpret-markup grob text))
		)
		(display font-size) (newline)
		(ly:stencil-add stem text)
	)
)

pizz_box_stem = #(define-music-function (parser location input) (list?)
	#{
		\once \override Stem #'stencil = #(lambda (grob) (pizz-box-stem grob input))
	#}

)

#(define (finger-box-stem grob input)
	(let* 
		(
		(pad-input (make-padded-list input '("" . 0)))
		(notehead (ly:grob-property grob 'cause))
		(notehead-pos (* (ly:grob-staff-position notehead) 0.5))
		(notehead-sign (if (> notehead-pos 0) -3 1))
		(stem (ly:stem::print grob))
      	(text (markup 
      			#:translate (cons 0 -9.5)
      			#:center-align
      			#:override '(font-name . "AdobeCaslonPro")
      			#:fontsize -5
      			#:override '(thickness . 1.85) #:whiteout #:with-color red #:box
      			#:with-color black  
      			#:pad-to-box '(0 . 2) '(-0.5 . 1) 
      			#:raise -0.25
      			#:line (
      					#:raise (cdr (first pad-input)) (car (first pad-input))
      					#:raise (cdr (second pad-input)) (car (second pad-input))
      					#:raise (cdr (third pad-input)) (car (third pad-input)) 
      					#:raise (cdr (fourth pad-input)) (car (fourth pad-input))) 

      	))
      	(text (grob-interpret-markup grob text))
		)
		(ly:stencil-add stem text)
	)
)

finger_box_stem = #(define-music-function (parser location input) (list?)
	#{
		\once \override Stem #'stencil = #(lambda (grob) (finger-box-stem grob input))
	#}

)

nail_pizz = {
	\override NoteHead #'stencil = #fingernail-pizz
}

tip_pizz = {
	\override NoteHead #'stencil = #fingertip-pizz
}