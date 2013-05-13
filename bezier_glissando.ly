\language "english"
\version "2.17.15"

%%normal glissando
#(define (custom-gliss grob curve-x curve-y start-y-adjust end-y-adjust)
	(let* (
		(notecol (ly:grob-parent (ly:grob-parent grob X) X))
		(dot-col (ly:note-column-dot-column notecol))
		(up-offset 0)
		(down-offset 0)
		(line-thickness 0.35)
		(left-bound (ly:grob-property grob 'left-bound-info))
		(right-bound (ly:grob-property grob 'right-bound-info))
		(left-padding (cdr (assoc 'padding left-bound)))
		(stencil (ly:grob-property grob 'stencil))
		(left-start-Y (+ (cdr (assoc 'Y left-bound)) start-y-adjust))
		(right-end-Y  (cdr (assoc 'Y right-bound)))
		(dir-offset (if (> left-start-Y right-end-Y) down-offset up-offset))
		(x-ext (ly:stencil-extent stencil X))
		(start-point (cons 0.5 left-start-Y))
		(end (cons (+ (cdr x-ext) 0.85) (+ right-end-Y end-y-adjust)))			
		(move-to (cons left-padding left-start-Y))
		(start (cons (+ (car start-point) (car move-to)) left-start-Y))
		(control (cons (* (cdr x-ext) curve-x) curve-y))
		(stencil (ly:make-stencil (list 'embedded-ps
				   (ly:format "gsave
				      currentpoint translate
				      newpath
				      1 setlinecap
				      ~4f setlinewidth
				      ~4f ~4f moveto
				      ~4f ~4f ~4f ~4f ~4f ~4f curveto
				      stroke
				      grestore" 
				line-thickness 
				(car move-to) (cdr move-to) 
				(car start) (cdr start)  
				(car control) (cdr control)
				(car end) (cdr end)))
  			  (cons 0 0)
    		  (cons 0 0))
		))
	(ly:grob-set-property! grob 'stencil stencil)
	)
)                 

bezier_gliss = #(define-music-function (parser location curves padding) (pair? list?)
	#{
		\once \override Dots #'extra-offset = #'(-0.25 . -0.85)
		\once \override Glissando bound-details.end-on-accidental = ##f
		\once \override Glissando bound-details.left.padding = #(first padding)
		\once \override Glissando bound-details.right.padding = #(second padding)
		\once \override Glissando #'after-line-breaking = #(lambda (grob) (custom-gliss grob (car curves) (cdr curves) (third padding) (fourth padding) ))
	#}
)

%%%bezier double glissando
#(define (custom-gliss-double grob curve-x curve-y)
	(let* (
		(notecol (ly:grob-parent (ly:grob-parent grob X) X))
		(dot-col (ly:note-column-dot-column notecol))
		(up-offset 0.5)
		(down-offset 0.5)
		(line-thickness 0.3)
		(left-bound (ly:grob-property grob 'left-bound-info))
		(right-bound (ly:grob-property grob 'right-bound-info))
		(left-padding (cdr (assoc 'padding left-bound)))
		(stencil (ly:grob-property grob 'stencil))
		(left-start-Y (cdr (assoc 'Y left-bound)))
		(right-end-Y  (cdr (assoc 'Y right-bound)))
		(dir-offset (if (> left-start-Y right-end-Y) down-offset up-offset))
		(x-ext (ly:stencil-extent stencil X))
		(start-point (cons 0 left-start-Y))
		(end (cons (cdr x-ext) (+ right-end-Y dir-offset)))			
		(move-to (cons left-padding left-start-Y))
		(start (cons (+ (car start-point) (car move-to)) left-start-Y))
		(control (cons (+ (* (cdr x-ext) curve-x) (car move-to)) curve-y))
		(stencil (ly:make-stencil (list 'embedded-ps
				   (ly:format "gsave
				   	  /linewidth ~4f def
				   	  /move-x ~4f def
				   	  /move-y ~4f def
				   	  /x1 ~4f def /y1 ~4f def 
				   	  /x2 ~4f def /y2 ~4f def 
				   	  /x3 ~4f def /y3 ~4f def 
				      currentpoint translate
				      newpath
				      1 setlinecap
				      linewidth setlinewidth
				      move-x move-y moveto
				      x1 y1 x2 y2 x3 y3 curveto 
				      stroke
				      grestore
				      gsave
				      1 setlinecap
				      linewidth setlinewidth
				      currentpoint translate				      
				      move-x 1 move-y add moveto
				      x1 1 y1 add x2 1 y2 add x3 1 y3 add curveto
				      stroke
				      grestore" 
				line-thickness 
				(car move-to) (cdr move-to) 
				(car start) (cdr start)  
				(car control) (cdr control)
				(car end) (cdr end)))
  			  (cons 0 1.3125)
    		  (cons -.75 .75))
		))
	(ly:grob-translate-axis! grob -0.5 Y)
	(ly:grob-set-property! grob 'stencil stencil)
	)
)                 

bezier_gliss_double = #(define-music-function (parser location curves padding) (pair? pair?)
	#{
		\once \override Dots #'extra-offset = #'(-0.25 . -0.85)
		\once \override Glissando bound-details.end-on-accidental = ##f
		\once \override Glissando bound-details.left.padding = #(car padding)
		\once \override Glissando bound-details.right.padding = #(cdr padding)
		\once \override Glissando #'after-line-breaking = #(lambda (grob) (custom-gliss-double grob (car curves) (cdr curves)))
	#}
)

%%%%WAVY VIBRATO

#(define (wavy-vibrato grob scale)
	(let* (
		(line-thickness 0.25)
		(left-bound (ly:grob-property grob 'left-bound-info))
		(right-bound (ly:grob-property grob 'right-bound-info))
		(stencil (ly:grob-property grob 'stencil))
		(left-start-Y (cdr (assoc 'Y left-bound)))
		(x-ext (ly:stencil-extent stencil X))
		(right-end  (+ (cdr x-ext) 0.85))			
		(stencil (ly:make-stencil (list 'embedded-ps
				   (ly:format "gsave
				   	  /line-width ~4f def
				   	  /ypos ~4f def
				   	  /scalar ~4f def
				   	  /end-x ~4f def
				      currentpoint translate
				      newpath
				   	  0 ypos translate
				      1 setlinecap
				      1 setlinejoin
				      line-width setlinewidth
				      0.25 0 moveto
				      0.85 0 lineto
				      end-x 0.1 mul 1 scalar mul lineto
				      end-x 0.15 mul -1 scalar mul lineto
				      end-x 0.2 mul 1.5 scalar mul lineto
				      end-x 0.25 mul -1.5 scalar mul lineto
				      end-x 0.3 mul 2 scalar mul lineto
				      end-x 0.35 mul -2 scalar mul lineto
				      end-x 0.4 mul 2.5 scalar mul lineto
				      end-x 0.45 mul -2.5 scalar mul lineto
				      end-x 0.5 mul 2.5 scalar mul lineto
				      end-x 0.55 mul -2.5 scalar mul lineto
				      end-x 0.6 mul 3 scalar mul lineto
				      end-x 0.65 mul -3 scalar mul lineto
				      stroke
				      grestore" 
				line-thickness 
				left-start-Y
				(* 0.5 scale)
				(* right-end 1.6)
				))
  			  (cons 0 1.3125)
    		  (cons -.75 .75))
		))
	(ly:grob-set-property! grob 'stencil stencil)
	)
)                 

wavy_vibrato = #(define-music-function (parser location scale) (number?)
	#{
		\once \override Dots #'extra-offset = #'(-0.25 . -0.85)
		\once \override Glissando #'after-line-breaking = #(lambda (grob) (wavy-vibrato grob scale))
	#}
)
