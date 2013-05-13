\version "2.17.15"
\language "english"

%%%EFFORT DYNAMICS
effort = #(define-event-function (parser location arg) (markup?)
	(let* (
		(top-adjust (cond
			((equal? arg "f") '(0 . 0.2))
			((equal? arg "ppp") '(-0.6 . -0.2))
			((equal? arg "pp") '(-0.65 . -0.4))
			((equal? arg "p") '(-0.6 . -0.4))
			((equal? arg "mp") '(-0.6 . -0.4))
			((equal? arg "mf") '(0 . 0.25))
			((equal? arg "ff") '(0 . 0.2))
			((equal? arg "fff") '(0 . 0.2))
			((equal? arg "sf") '(0 . 0.3))
			((equal? arg "sfz") '(-0.65 . 0.3))
			('(0 . 0))
			))
		(bottom-adjust (cond
			((equal? arg "f") '(-0.1 . -0.25))
			((equal? arg "ppp") '(0 . -0.25))
			((equal? arg "pp") '(0 . -0.25))
			((equal? arg "p") '(0 . -0.25))
			((equal? arg "mp") '(-0.4 . 0.1))
			((equal? arg "mf") '(-0.4 . 0.2))
			((equal? arg "ff") '(0 . -0.25))
			((equal? arg "fff") '(0 . -0.25))
			((equal? arg "sf") '(-0.5 . 0))
			((equal? arg "sfz") '(-0.5 . 0))
			('(0 . 0))
			))		
	)
	(make-dynamic-script (markup 
				  #:override '(word-space . 0.75)
				  #:line ( 
                  #:lower 1.85
                  #:translate (cons 0 (cdr bottom-adjust))                  
                  #:override '(font-size . 2)
                  #:override '(font-name . "TimesNewRoman")
                  "“" 
                  #:translate (cons (car bottom-adjust) 0 )
                  #:dynamic arg
                  #:override '(font-size . 2)
                  #:override '(font-name . "TimesNewRoman")
                  #:translate (cons (car top-adjust) (cdr top-adjust))                  
                  "”" 
            )))))
%%%

\score {
	\new Score {
		\new Staff {
			c'4 \effort sf
		}
	}
% 	\midi {}
	\layout {}
}