%REGULAR DIAGRAM

#(define diamond-head
	(markup
		#:scale '(0.5 . 0.55)
		#:override '(line-join-style . miter)
		#:override '(filled . #f)
		#:path 0.35
		'(
			(moveto 0 1)
			(lineto 1 0)
			(lineto 0 -1)
			(lineto -1 0)
			(closepath)
		) 
	)
)

#(define square-head
		(markup
			#:scale '(0.575 . 0.46)
			#:override '(line-join-style . miter)
			#:override '(filled . #f)
			#:path 0.3
			'(
				(moveto -1 1)
				(lineto 1 1)
				(lineto 1 -1)
				(lineto -1 -1)
				(closepath)
			) 
		)
)

#(define release-head
		(markup
			#:combine 
			#:draw-circle 0.4 0.15 #f
			#:rotate 45
			#:translate '(-0.75 . 0)
			#:draw-line '(1.5 . 0)
		)
)

#(define-markup-command (fingering-diagram layout props input) (list?)
	#:properties (
			(scale 1.1)
			(trills (list #f #f #f #f))
			(extender-I (cons #f #f))
			(extender-II (cons #f #f))
			(extender-III (cons #f #f))
			(extender-IV (cons #f #f))
			(extender-length 3)
			(extender-factors (list 1 1 1 1))
		)
	(let* (
		(roman-numeral-font-size -7)
		(width 4)
		(height 4)
		(draw-release (markup #:scale '(1 . 1) #:whiteout release-head))
		(draw-dot (markup #:draw-circle 0.375 0 #t))
		(draw-diamond (markup #:scale '(0.9 . 0.9)  #:whiteout diamond-head))
		(draw-mute (markup #:scale '(0.8 . 0.8) #:whiteout square-head))
		(first-string (markup 
				#:combine
				#:translate (cons (* width 0) (+ height 0.5))
				(if (equal? (first trills) #t) (markup #:italic #:fontsize -4 #:center-align " tr") " ")
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.15 . -1)
				"I"
				;draw-pos-marker?
				#:translate (cons 0 (* (cdr (first input)) height))				
				#:combine
				(cond 
					((equal? (car (first input)) "dot") (markup draw-dot))
					((equal? (car (first input)) "mute") (markup draw-mute))
					((equal? (car (first input)) "di") (markup draw-diamond))
					("")
					)
				#:combine
				(if (equal? (car extender-I) #t)  
						(markup 
						#:translate (cons width 0) 
						#:override '(on . 0.2)
						#:override '(off . 0.2)
						#:draw-dashed-line (cons (* extender-length (first extender-factors))  0))
						"" 
					)
				(cond 
					((equal? (cdr extender-I) "dot")  
						(markup #:translate (cons (+ (* extender-length (first extender-factors)) 4) 0) draw-dot))
					((equal? (cdr extender-I) "mute")  
						(markup #:translate (cons (+ (* extender-length (first extender-factors)) 4) 0) draw-mute))					
					((equal? (cdr extender-I) "release")  
						(markup #:translate (cons (+ (* extender-length (first extender-factors)) 4) 0) draw-release))
					("")

					)
				))	
		(second-string (markup 
				#:translate (cons (* width 0.32) 0)
				#:combine
				#:translate (cons 0 (+ height 0.5))
				(if (equal? (second trills) #t) (markup #:italic #:fontsize -4 #:center-align " tr") "")
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine				
				#:translate '(-0.45 . -1)
				"II"				
				;draw-pos-marker?
				#:translate (cons 0 (* (cdr (second input)) height))
				#:combine
				(cond 
					((equal? (car (second input)) "dot") (markup draw-dot))
					((equal? (car (second input)) "mute") (markup draw-mute))
					((equal? (car (second input)) "di") (markup draw-diamond))
					("")
				)
				#:combine
				(if (equal? (car extender-II) #t)  
						(markup 
						#:translate (cons (- width (* width 0.32)) 0) 
						#:override '(on . 0.2)
						#:override '(off . 0.2)
						#:draw-dashed-line (cons (* extender-length (second extender-factors))  0))
						"" 
					)
				(cond 
					((equal? (cdr extender-II) "dot")  
						(markup #:translate (cons (+ (* extender-length (second extender-factors)) 2.75) 0) draw-dot))
					((equal? (cdr extender-II) "mute")  
						(markup #:translate (cons (+ (* extender-length (second extender-factors)) 2.75) 0) draw-mute))					
					((equal? (cdr extender-II) "release")  
						(markup #:translate (cons (+ (* extender-length (second extender-factors)) 2.75) 0) draw-release))
					("")

					)
				))	
		(third-string (markup 
				#:translate (cons (* width 0.68) 0)
				#:combine
				#:translate (cons 0 (+ height 0.5))
				(if (equal? (third trills) #t) (markup #:italic #:fontsize -4 #:center-align " tr") "")				
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.65 . -1)
				"III"					
				;draw-pos-marker?
				#:translate (cons 0 (* (cdr (third input)) height))
				#:combine
				(cond 
					((equal? (car (third input)) "dot") (markup draw-dot))
					((equal? (car (third input)) "mute") (markup draw-mute))
					((equal? (car (third input)) "di") (markup draw-diamond))
					("")
				)
				#:combine
				(if (equal? (car extender-III) #t)  
						(markup 
						#:translate (cons (- width (* width 0.68)) 0) 
						#:override '(on . 0.2)
						#:override '(off . 0.2)
						#:draw-dashed-line (cons (* extender-length (third extender-factors))  0))
						"" 
					)
				(cond 
					((equal? (cdr extender-III) "dot")  
						(markup #:translate (cons (+ (* extender-length (third extender-factors)) 1.25) 0) draw-dot))
					((equal? (cdr extender-III) "mute")  
						(markup #:translate (cons (+ (* extender-length (third extender-factors)) 1.25) 0) draw-mute))					
					((equal? (cdr extender-III) "release")  
						(markup #:translate (cons (+ (* extender-length (third extender-factors)) 1.25) 0) draw-release))
					("")

					)
				))
		(fourth-string (markup 
				#:translate (cons (* width 1) 0)
				#:combine
				#:translate (cons 0 (+ height 0.5))
				(if (equal? (fourth trills) #t) (markup #:italic #:fontsize -4 #:center-align " tr") "")				
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.5 . -1)
				"IV"					
				;draw-pos-marker?
				#:translate (cons 0 (* (cdr (fourth input)) height))
				#:combine
				(cond 
					((equal? (car (fourth input)) "dot") (markup draw-dot))
					((equal? (car (fourth input)) "mute") (markup draw-mute))
					((equal? (car (fourth input)) "di") (markup draw-diamond))
					("")
				)
				#:combine
				(if (equal? (car extender-IV) #t)  
						(markup 
						#:translate '(0 . 0)
						#:override '(on . 0.2)
						#:override '(off . 0.2)
						#:draw-dashed-line (cons (* extender-length (fourth extender-factors))  0))
						"" 
					)
				(cond 
					((equal? (cdr extender-IV) "dot")  
						(markup #:translate (cons (+ (* extender-length (fourth extender-factors)) 0) 0) draw-dot))
					((equal? (cdr extender-IV) "mute")  
						(markup #:translate (cons (+ (* extender-length (fourth extender-factors)) 0) 0) draw-mute))					
					((equal? (cdr extender-IV) "release")  
						(markup #:translate (cons (+ (* extender-length (fourth extender-factors)) 0) 0) draw-release))
					("")

					)
				))
		(output (markup
					#:scale (cons scale scale)
					;draw-box
					#:translate (cons (* width -0.5) 0)
					#:combine
					#:draw-line (cons width 0)
					#:combine
					#:translate (cons width height)
					#:draw-line  (cons (* width -1)  0)
					#:combine
					first-string
					#:combine
					second-string
					#:combine
					third-string
					fourth-string

		))
	)
	(interpret-markup layout props (markup #:translate '(1 . 0) output))
	)

)
%%%%%
%%%%%
%%%%%
%%% BARRÉ DIAGRAM
#(define-markup-command (barre-diagram layout props input) (list?)
	#:properties (
			(scale 1.1)
			(bar-height 0.175)
			(speed 16)
			(top-barre "dot")
			(bottom-barre "dot")
		)
	(let* (
		(Y-offset-I (first input))
		(Y-offset-II (second input))
		(trem-beam-width 0.5)
		(roman-numeral-font-size -8)
		(width 4)
		(height 4)
		(draw-dot (markup #:draw-circle 0.375 0 #t))
		(draw-diamond (markup #:scale '(0.9 . 0.9)  #:whiteout diamond-head))
		(draw-mute (markup #:scale '(0.8 . 0.8) #:whiteout square-head))		
		(left-box (markup #:filled-box '(-0.5 . 0.8) (cons (* bar-height -1) bar-height) 0.5))
		(mid-box (markup #:filled-box '(-0.9 . 0.9) (cons (* bar-height -1) bar-height) 0))
		(right-box (markup #:filled-box '(-0.8 . 0.5) (cons (* bar-height -1) bar-height) 0.5))
		(tremolo 
			(markup 
				#:combine
				#:beam 1 -0.2 0.2
				#:combine
				(cond 
					((equal? speed 16) 
						(markup #:translate (cons (/ trem-beam-width 2)  -0.5) #:beam trem-beam-width -0.2 0.2))
					((equal? speed 32) 
						(markup 
								#:translate (cons (/ trem-beam-width 2)  -0.5) 
								#:combine
								#:beam trem-beam-width -0.2 0.2
								#:translate (cons 0  -0.5) 						
								#:beam trem-beam-width -0.2 0.2)
						)					
					("")
				)
				#:combine	
				#:draw-line (cons 0  (+ (* -1 (- height (* height Y-offset-II))) 0.1))
				#:translate '(1 . -0.1)
				#:draw-line (cons 0  (+ (* -1 (- height (* height Y-offset-I))) 0.1))
			)
		)
		(first-string (markup 
				#:translate (cons (* width 0) 0)
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.15 . -1)
				"I"
				;draw-pos-marker?
				#:combine
				#:translate (cons 0 (* height Y-offset-I))
				(cond 
					((equal? bottom-barre "dot") (markup draw-dot))
					((equal? bottom-barre "mute") (markup draw-mute))
					((equal? bottom-barre "di") (markup draw-diamond))
					("")
				)
				#:translate (cons 0 (* height Y-offset-II))
				(cond 
					((equal? top-barre "dot") (markup draw-dot))
					((equal? top-barre "mute") (markup draw-mute))
					((equal? top-barre "di") (markup draw-diamond))
					("")
				)
		))
		(second-string (markup 
				#:translate (cons (* width 0.32) 0)
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine				
				#:translate '(-0.35 . -1)
				"II"				
				;draw-pos-marker?
				#:combine
				#:translate (cons 0 (* height Y-offset-I))
				(cond 
					((equal? bottom-barre "dot") (markup draw-dot))
					((equal? bottom-barre "mute") (markup draw-mute))
					((equal? bottom-barre "di") (markup draw-diamond))
					("")
				)
				#:translate (cons 0 (* height Y-offset-II))
				(cond 
					((equal? top-barre "dot") (markup draw-dot))
					((equal? top-barre "mute") (markup draw-mute))
					((equal? top-barre "di") (markup draw-diamond))
					("")
				)			
		))
		(third-string (markup 
				#:translate (cons (* width 0.68) 0)
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.525 . -1)
				"III"					
				;draw-pos-marker?
				#:combine
				#:translate (cons 0 (* height Y-offset-I))
				(cond 
					((equal? bottom-barre "dot") (markup draw-dot))
					((equal? bottom-barre "mute") (markup draw-mute))
					((equal? bottom-barre "di") (markup draw-diamond))
					("")
				)
				#:translate (cons 0 (* height Y-offset-II))
				(cond 
					((equal? top-barre "dot") (markup draw-dot))
					((equal? top-barre "mute") (markup draw-mute))
					((equal? top-barre "di") (markup draw-diamond))
					("")
				)
		))
		(fourth-string (markup 
				#:translate (cons (* width 1) 0)
				#:combine
				#:draw-line (cons 0 height)
				;draw-string-indicator
				#:fontsize roman-numeral-font-size
				#:combine
				#:translate '(-0.5 . -1)
				"IV"					
				;draw-pos-marker?
				#:combine
				#:translate (cons 0 (* height Y-offset-I))
				(cond 
					((equal? bottom-barre "dot") (markup draw-dot))
					((equal? bottom-barre "mute") (markup draw-mute))
					((equal? bottom-barre "di") (markup draw-diamond))
					("")
				)
				#:translate (cons 0 (* height Y-offset-II))
				(cond 
					((equal? top-barre "dot") (markup draw-dot))
					((equal? top-barre "mute") (markup draw-mute))
					((equal? top-barre "di") (markup draw-diamond))
					("")
				)				
		))	
		(output (markup
					#:scale (cons scale scale)
					#:combine
					#:translate (cons -4  height)
					tremolo
					;draw-box
					#:translate (cons (* width -0.5) 0)
					#:combine
					#:draw-line (cons width 0)
					#:combine
					#:translate (cons width height)
					#:draw-line  (cons (* width -1)  0)
					#:combine
					first-string
					#:combine
					second-string
					#:combine
					third-string
					fourth-string
						

		))
	)
	(interpret-markup layout props output)
	)
)