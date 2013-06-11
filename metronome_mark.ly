#(define (shift-start-of-line-time-sig grob)
         (if (= (ly:item-break-dir grob) 1)
            (ly:grob-set-property! grob 'extra-offset (cons 4 0)) '(cons 4 0) ))

#(define-public (me-time-sig grob)
   (let* ((frac (ly:grob-property grob 'fraction))
          (num (if (pair? frac) (car frac) 4))
          (den (if (pair? frac) (cdr frac) 4))
		  (offset (if (> num 10) -4.5 -5))
			  (whole (markup
			  		#:scale '(0.85 . 0.85)			  	
					#:combine
					#:override '(font-family . typewriter)
					#:translate (cons offset 0)
					(number->string num)
					#:override '(font-size . 1)
					#:musicglyph "noteheads.s0"
			  ))
			  (half (markup
			  		#:scale '(0.85 . 0.85)			  	
					#:combine
					#:translate '(1.5 . 0.85)
					#:draw-line '(0 . 3.5)
					#:translate '(0 . 0.0)
					#:override '(font-family . typewriter)
					#:combine
					#:translate (cons offset 0)
					(number->string num)
					#:override '(font-size . 1)
					#:translate '(0 . 0.5)
					#:musicglyph "noteheads.s1"
			    ))
			  (quarter (markup
			  		#:scale '(1 . 1)			  	
					#:combine
					#:translate '(1.58 . 0.75)
					#:draw-line '(0 . 3.75)
					#:translate '(0 . 0.0)
					#:override '(font-name . "Optima")
					#:override '(font-size . 10)					
					#:combine
					#:translate (cons (+ offset 1.25) 0)
					(number->string num)
					#:override '(font-size . 2)
					#:translate '(0 . 0.5)
					#:musicglyph "noteheads.s2"
			    ))
	        	(eighth (markup
			  		#:scale '(1 . 1)			  	
					#:combine
					#:translate '(-1 . 0)
					#:draw-line '(0 . 4.5)
					#:combine
					#:translate '(0 . 0)
					#:override '(font-name . "Optima")
					#:override '(font-size . 10)
					#:translate (cons offset 0)
					(number->string num)
					#:translate '(-1 . 4.25)
					#:beam 1.5 0 0.8
				))
      		    (six (markup
			  		#:scale '(1 . 1)			  	
					#:combine
					#:translate '(-1 . 0)
					#:draw-line '(0 . 4.5)
					#:combine
					#:translate '(0 . 0)
					#:override '(font-name . "Optima")
					#:override '(font-size . 10)
					#:translate (cons offset 0)
					(number->string num)
					#:combine
					#:translate '(-1 . 4.25)
					#:beam 1.5 0 0.8
					#:translate '(-1 . 2.85)
					#:beam 1.5 0 0.8
				))
			(thirty (markup #:combine
				#:draw-line '(0 . 5)
				#:combine
				#:translate '(0 . 0)
				#:override '(font-family . typewriter)
				#:translate (cons offset 0)
				(number->string num)
				#:combine
				#:translate '(0 . 4.75)
				#:beam 1.5 -0.2 0.5
				#:combine
				#:translate '(0 . 3.8)
				#:beam 1.5 -0.2 0.5
				#:translate '(0 . 2.85)
				#:beam 1.5 -0.2 0.5
			))
			(sel (cond
					((= den 1) whole)
					((= den 2) half)
					((= den 4) quarter)
					((= den 8) eighth)
					((= den 16) six)
					((= den 32) thirty)
				)
			)
		)
     (grob-interpret-markup grob (markup #:whiteout #:pad-markup 1 sel))
))


#(define-public (metro-single unit metro text)
		(markup
		 	#:override '(box-padding . 1)
		 	#:override '(thickness . 2.5)
			#:override '(font-size . 1)
			#:raise 2
			#:box
				#:override '(baseline-skip . 3)
					#:line (
					#:override '(thickness . 0.85)
					#:raise 0.75
					#:scale '(0.85 . 0.85)
					unit
					#:override '(font-size . 0)
					#:raise 1
					#:override '(font-name . "Contax")
					" =" 
					#:override '(font-name . "Contax")
					#:raise 1
					#:override '(font-size . 0) 
					(number->string metro)
					)
					#:override '(font-size . 0.5)
					#:override '(font-name . "AdobeCaslonPro Italic")					
					#:raise 3.25
					(string-append "(" text ")")			
))

#(define-public (metro-pair unit metro text)
		(markup
		 	#:override '(box-padding . 1)
		 	#:override '(thickness . 2.5)
			#:override '(font-size . 1)
			#:raise 2
			#:box
				#:override '(baseline-skip . 3)
					#:line (
					#:override '(thickness . 0.85)
					#:raise 0.75
					#:scale '(0.85 . 0.85)
					unit
					#:override '(font-size . 0)
					#:raise 1
					#:override '(font-name . "Contax")
					" =" 
					#:override '(font-name . "Contax")
					#:raise 1
					#:override '(font-size . 0) 
					(number->string (car metro))
					#:override '(font-name . "Contax")
					#:raise 1
					#:override '(font-size . 0) 
					"-" 
					#:override '(font-name . "Contax")
					#:raise 1
					#:override '(font-size . 0) 
					(number->string (cdr metro)))
					#:override '(font-size . 0.5)
					#:override '(font-name . "AdobeCaslonPro Italic")					
					#:raise 3.25
					(string-append "(" text ")")
			)
)

#(define-public (metro-stencil grob)
				(grob-interpret-markup grob
								(let* (
									  (whole (markup
											#:override '(font-size . 1)
											#:musicglyph "noteheads.s0"
									  ))
									  (half (markup
											#:combine
											#:translate '(1.5 . 0.85)
											#:draw-line '(0 . 3.5)
											#:translate '(0 . 0.0)
											#:override '(font-family . typewriter)
											#:override '(font-size . 1)
											#:translate '(0 . 0.5)
											#:musicglyph "noteheads.s1"
									    ))
									  (quarter (markup
											#:combine
											#:translate '(1.25 . 0.25)
											#:draw-line '(0 . 3.0)
											#:translate '(0 . 0.0)
											#:override '(font-size . 0)
											#:translate '(0 . 0.0)
											#:musicglyph "noteheads.s2"
									    ))
							          (eighth (markup
											#:combine
											#:translate '(1.5 . 0)
											#:draw-line '(0 . 3)
											#:translate '(1.5 . 2.75)
											#:beam 1.2 -0.2 0.5
										))
							         (six (markup
										#:combine
										#:translate '(1 . 0)
										#:draw-line '(0 . 5)
										#:combine
										#:translate '(1 . 4.75)
										#:beam 1.2 -0.2 0.5
										#:translate '(1 . 3.8)
										#:beam 1.2 -0.2 0.5

									))
									(thirty (markup #:combine
										#:draw-line '(0 . 5)
										#:combine
										#:translate '(0 . 4.75)
										#:beam 1.2 -0.2 0.5
										#:combine
										#:translate '(0 . 3.8)
										#:beam 1.2 -0.2 0.5
										#:translate '(0 . 2.85)
										#:beam 1.2 -0.2 0.5
									))
									(stream (ly:grob-property grob 'cause))
									(tempo-unit (ly:event-property stream 'tempo-unit))
									(unit (if (boolean? tempo-unit) 0 (ly:duration-log tempo-unit)))
									(unit (cond
												((= unit 0) whole)
												((= unit 1) half)
												((= unit 2) quarter)
												((= unit 3) eighth)
												((= unit 4) six)
												((= unit 5) thirty)
											)
										)

									(metro (ly:event-property stream 'metronome-count))
									(text (ly:event-property stream 'text))
									(compile (list unit metro text))
								)
								(cond 
									((pair? metro) (metro-pair unit metro text))
									((number? metro) (metro-single unit metro text))
									((boolean? metro) (metro-text text))
								)
					)))