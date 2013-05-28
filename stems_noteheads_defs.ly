\language "english"
\version "2.17.15"
\include "/pieces/diotima_quartet/code_files/signs_and_symbols.ly"

#(define (trill-diamond-head grob)
	(let* (	
		(fsz  (ly:grob-property grob 'font-size 0.0))		
		(mult (magstep fsz))
		(stencil (grob-interpret-markup grob 
					(markup
						#:scale '(0.6 . 0.65)
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
		))                     

		)

		;; NOTEHEADS
		(set! (ly:grob-property grob 'stencil) 
			(ly:stencil-scale stencil mult mult)
		)

		)

	)

trill_harmonic = { 
	\override TrillPitchHead.stencil = #trill-diamond-head
%   	\once\override TrillPitchHead.text = 
}


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

#(define (diamond-head grob)
	(let* (
		(notecol (ly:grob-parent grob X))
		(noteheads (ly:grob-array->list (ly:grob-object notecol 'note-heads)))
		(is-chord (if (equal? (length noteheads) 2) #t #f))
		(staff-pos (map 
		            (lambda (note-head-grobs)
		            	(ly:grob-property note-head-grobs 'staff-position))
		            noteheads))
		(distance (if (equal? is-chord #t) (- (first staff-pos) (second staff-pos)) 1000))
		(is-cluster (if (equal? is-chord #t)
				(if (equal? distance 0)
						#t #f
				) #f ))
		(fsz  (ly:grob-property grob 'font-size 0.0))
		(duration (ly:moment-main-denominator (ly:duration-length (ly:event-property (ly:grob-property grob 'cause) 'duration))))
		(filled (if (< duration 4) #f #t))		
		(mult (magstep fsz))
		(stencil (grob-interpret-markup grob 
					(markup
						#:scale '(0.6 . 0.65)
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
		))                     

		(notecol (ly:grob-parent   grob    X))
		(stm     (ly:grob-object   notecol 'stem))
		(stmdir  (ly:grob-property stm     'direction))

		(up-stem     '(0.0 . 1))  
		(down-stem   '(0.0 . 0.9))
		(up-stem-minor-second     '(1 . 0))  
		(down-stem-minor-second   '(1 . 0))
		(up-stem-cluster     '(0 . 0.9))  
		(down-stem-cluster   '(-0.12 . 0.9))

		)

		;; NOTEHEADS
		(set! (ly:grob-property grob 'stencil) 
			(ly:stencil-scale stencil mult mult)
		)


		;; STEM ATTACHMENT
		(set! (ly:grob-property grob 'stem-attachment) 
				(if (equal? is-cluster #f) 
						(if (equal? (abs distance) 1) 
							(if (= UP stmdir) up-stem-minor-second down-stem-minor-second)				
							(if (= UP stmdir) up-stem down-stem)
						)
						(if (= UP stmdir) up-stem-cluster down-stem-cluster)				
				)
			)
		)

	)


#(define (square-head grob)
	(let* (
		(notecol (ly:grob-parent grob X))
		(noteheads (ly:grob-array->list (ly:grob-object notecol 'note-heads)))
		(is-chord (if (equal? (length noteheads) 2) #t #f))
		(staff-pos (map 
		            (lambda (note-head-grobs)
		            	(ly:grob-property note-head-grobs 'staff-position))
		            noteheads))
		(distance (if (equal? is-chord #t) (- (first staff-pos) (second staff-pos)) 1000))
		(is-cluster (if (equal? is-chord #t)
				(if (equal? distance 0)
						#t #f
				) #f ))
		(fsz  (ly:grob-property grob 'font-size 0.0))
		(duration (ly:moment-main-denominator (ly:duration-length (ly:event-property (ly:grob-property grob 'cause) 'duration))))
		(filled (if (< duration 4) #f #t))		
		(mult (magstep fsz))
		(stencil (grob-interpret-markup grob 
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
		))                     

		(notecol (ly:grob-parent   grob    X))
		(stm     (ly:grob-object   notecol 'stem))
		(stmdir  (ly:grob-property stm     'direction))

		(up-stem     '(0.0 . 1))  
		(down-stem   '(0.0 . 1))
		(up-stem-minor-second     '(1 . 0))  
		(down-stem-minor-second   '(1 . 0))
		(up-stem-cluster     '(0 . 1))  
		(down-stem-cluster   '(0 . 1))

		)

		;; NOTEHEADS
		(set! (ly:grob-property grob 'stencil) 
			(ly:stencil-scale stencil mult mult)
		)


		;; STEM ATTACHMENT
		(set! (ly:grob-property grob 'stem-attachment) 
				(if (equal? is-cluster #f) 
						(if (equal? (abs distance) 1) 
							(if (= UP stmdir) up-stem-minor-second down-stem-minor-second)				
							(if (= UP stmdir) up-stem down-stem)
						)
						(if (= UP stmdir) up-stem-cluster down-stem-cluster)				
				)
			)
		)

	)

#(define (circle-head grob)
	(let* (
		(notecol (ly:grob-parent grob X))
		(noteheads (ly:grob-array->list (ly:grob-object notecol 'note-heads)))
		(is-chord (if (equal? (length noteheads) 2) #t #f))
		(staff-pos (map 
		            (lambda (note-head-grobs)
		            	(ly:grob-property note-head-grobs 'staff-position))
		            noteheads))
		(distance (if (equal? is-chord #t) (- (first staff-pos) (second staff-pos)) 1000))
		(is-cluster (if (equal? is-chord #t)
				(if (equal? distance 0)
						#t #f
				) #f ))
		(fsz  (ly:grob-property grob 'font-size 0.0))
		(duration (ly:duration-log (ly:event-property (ly:grob-property grob 'cause) 'duration)))
		(filled (if (< duration 2) #f #t))		
		(mult (magstep fsz))

		(stencil (cond
				((>= duration 2) (grob-interpret-markup grob 
									(markup
										#:draw-circle 0.475 0.15 filled
									)))
				((= duration 1)
					(grob-interpret-markup grob 
									(markup
										#:draw-circle 0.55 0.15 filled
									)))
				((= duration 0)
					(grob-interpret-markup grob 
									(markup
										#:scale '(1.1 . 0)
										#:draw-circle 0.55 0.15 filled
									)))				
		))                     

		(notecol (ly:grob-parent   grob    X))
		(stm     (ly:grob-object   notecol 'stem))
		(stmdir  (ly:grob-property stm     'direction))

		(up-stem     '(0.0 . 1))  
		(down-stem   '(0.0 . 1))
		(up-stem-minor-second     '(1 . 0))  
		(down-stem-minor-second   '(1 . 0))
		(up-stem-cluster     '(0.15 . 1))  
		(down-stem-cluster   '(-0.265 . 1))

		)

		;; NOTEHEADS
		(set! (ly:grob-property grob 'stencil) 
			(ly:stencil-scale stencil mult mult)
		)


		;; STEM ATTACHMENT
		(set! (ly:grob-property grob 'stem-attachment) 
				(if (equal? is-cluster #f) 
						(if (equal? (abs distance) 1) 
							(if (= UP stmdir) up-stem-minor-second down-stem-minor-second)				
							(if (= UP stmdir) up-stem down-stem)
						)
						(if (= UP stmdir) up-stem-cluster down-stem-cluster)				
				)
			)
		)

	)



#(define (set-notecolumn-x-offset grob)
	(let* (
		(stem (ly:grob-object grob 'stem))
		(stem-dir (ly:grob-property stem 'direction))
	)
	(if (equal? stem-dir 1)
		(ly:grob-set-property! grob 'X-offset 0)
		(ly:grob-set-property! grob 'X-offset 0)
		)
	grob
	)
)

#(define (if-not-rest grob)
	(if (equal? (ly:grob-object grob 'note-heads) '()) grob 
			(if (= 0 (ly:duration-log (ly:event-property (ly:grob-property (ly:grob-property grob 'cause) 'cause) 'duration))) grob (cluster-stem-split grob))
	)
)

% needs to work with dots...check if both dot and accidental are present and if so add more space
#(define (cluster-stem-split grob)
	(let* (
		(acc (ly:note-column-accidentals grob))
		(noteheads (ly:grob-array->list (ly:grob-object grob 'note-heads)))
		(notehead-stencil (ly:grob-property (first noteheads) 'stencil))
		(notehead-X-ext (ly:stencil-extent notehead-stencil X)) 
		(notehead-Y-ext (ly:stencil-extent notehead-stencil Y)) 
		(notehead-width (interval-length notehead-X-ext))
		(is-chord (if (equal? (length noteheads) 2) #t #f))
		(staff-pos (map 
		            (lambda (note-head-grobs)
		            	(ly:grob-property note-head-grobs 'staff-position))
		            noteheads))
		(distance (if (equal? is-chord #t) (- (first staff-pos) (second staff-pos))))
		(stem (ly:grob-object grob 'stem))
		(stem-dir (ly:grob-property stem 'direction))
		(stem-stencil (ly:grob-property stem 'stencil))
		(stem-X-ext (ly:stencil-extent stem-stencil X)) 
		(stem-Y-ext (ly:stencil-extent stem-stencil Y)) 
		(width (interval-length stem-X-ext))
		(stem-len (interval-length stem-Y-ext))
		(stem-thickness (/ (ly:grob-property stem 'thickness) 10))
		(new-stencil 
			(ly:stencil-translate 
				(grob-interpret-markup stem
          			 (markup
          			 	 #:combine
			             (#:path stem-thickness
			               (list 
			               		 (list 'moveto 0 0)
			               		 (list 'lineto 0 stem-len)))
			             (#:path stem-thickness
			             	(if (= stem-dir 1)
			             	;;;;;up-stem
			             	(list
			                     (list 'moveto 0 (* stem-len 0.65))
			                     (list 'lineto (* (- (+ notehead-width 1.49) (/ stem-thickness 2)) stem-dir) (* stem-len 0.35))
			                     (list 'moveto (* (- (+ notehead-width 1.49) (/ stem-thickness 2)) stem-dir) (* stem-len 0.35))
			                     (list 'lineto (* (- (+ notehead-width 1.49) (/ stem-thickness 2)) stem-dir) 0)			                     
			                   )
							;;;;;down-stem
			             	(list
			                     (list 'moveto 0 (* stem-len 0.45))
			                     (list 'lineto (+ (+ notehead-width 1.35) (/ stem-thickness 2)) (* stem-len 0.55))
			                     (list 'moveto (+ (+ notehead-width 1.35) (/ stem-thickness 2)) (* stem-len 0.55))
			                     (list 'lineto (+ (+ notehead-width 1.35) (/ stem-thickness 2)) stem-len)			                     
			                   )
			             ))))	
				(cons 0 (interval-start stem-Y-ext))
		))
	)
	(if (equal? is-chord #t)
			(cond 
			((= distance 0)					
					(if (equal? stem-dir 1)
						(begin
							(ly:grob-set-property! stem 'stencil new-stencil)
							(ly:grob-translate-axis! (second noteheads) 1.3 X)
							(ly:grob-set-property! (ly:grob-property acc 'cause) 'extra-offset '(3.6 . 0))
						)
						(begin
							(ly:grob-set-property! stem 'stencil new-stencil)							
							(ly:grob-translate-axis! (first noteheads) 1.25 X)
							(ly:grob-translate-axis! (second noteheads) 2.75 X)
							(ly:grob-translate-axis! acc 1.3 X)
							(ly:grob-set-property! (ly:grob-property acc 'cause) 'extra-offset '(3.5 . 0))

						)
				))
			((= (abs distance) 1)
					(if (equal? stem-dir 1)
						(begin
						;	(ly:grob-set-property! stem 'stencil new-stencil)
						;	(ly:grob-translate-axis! (first noteheads) 1.5 X)							
						;	(ly:grob-translate-axis! (second noteheads) 2 X)
						;	(ly:grob-translate-axis! acc 1 X)							
						;	(ly:grob-set-property! (ly:grob-property acc 'cause) 'extra-offset '(1.6 . 0))
						)
						(begin
						;	(ly:grob-set-property! stem 'stencil new-stencil)							
						;	(ly:grob-translate-axis! (first noteheads) 1 X)
						;	(ly:grob-translate-axis! (second noteheads) 2.25 X)
						;	(ly:grob-translate-axis! acc 3.5 X)
						;	(ly:grob-set-property! (ly:grob-property acc 'cause) 'extra-offset '(-1.5 . 0))
						)
				))
			)
			;;;fix stems on ordinary chords
			(ly:grob-set-property! (first noteheads) 'stem-attachment '(0 . 2))
		)
	grob
	)
)

diamonds = {
% 	\override Staff.Tie.extra-offset = #'(0.75 . -0.25)	
% 	\override NoteHead #'stencil =  #diamond-head
	\revert NoteHead.stencil
	\revert NoteHead.stem-attachment
	\override NoteHead #'style = #'harmonic
}



squares = {
	\revert NoteHead #'style
	\override NoteHead #'stencil =  #square-head
}

circles = {
% 	\override Staff.Tie.extra-offset = #'(0 . -0.25)		
% 	\override NoteHead #'stencil =  #circle-head
	\revert NoteHead.stem-attachment
	\revert NoteHead.stencil
	\revert NoteHead #'style
}


highest_harmonic = {
	\once \override Staff.Tie.extra-offset = #'(1 . -0.25)	
	\once\override NoteColumn #'X-offset = #0.35
	\once\override NoteHead #'no-ledgers = ##t
	\once\override NoteHead #'stem-attachment = #'(0.26 . -0.3)
	\once\override NoteHead #'stencil = #ly:text-interface::print
	\once\override NoteHead #'text = \markup {
						\combine
						\scale #'(0.6 . 0.65)
						\override #'(line-join-style . miter)
						\override #'(filled . #f)
						\path #0.35
						#'(
							(moveto 0 1)
							(lineto 1 0)
							(lineto 0 -1)
							(lineto -1 0)
							(closepath))
						\combine
						\override #'(line-cap-style . square)
						\path #0.35
						#'(
							(moveto -1.15 1)
							(lineto 0 2)
							(lineto 1.15 1))
						\combine
						\path #0.1
							#'((moveto 0 0.6)
							(lineto 0 2))
						\translate #'(-1.5 . 2.5)							
						\italic \tiny "poss."


	}
}

mute_head = {
	\once \override Staff.Tie.extra-offset = #'(1 . -0.25)	
% 	\once\override NoteColumn #'X-offset = #0.35
	\once\override NoteHead #'no-ledgers = ##t
	\once\override NoteHead #'stem-attachment = #'(0 . 1)
	\once\override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {
						\lower #0.1 \mute-sign
	}
}

natural_notehead = {
	\once \override Staff.Tie.extra-offset = #'(1 . -0.25)	
% 	\once\override NoteColumn #'X-offset = #0.35
	\once\override NoteHead #'no-ledgers = ##t
	\once\override NoteHead #'stem-attachment = #'(0 . 1)
	\once\override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {
						\rounded-box \pad-markup #0.1 \scale #'(1.1 . 1.1) \natural
	}
}

flat_notehead = {
	\once \override Staff.Tie.extra-offset = #'(1 . -0.25)	
% 	\once\override NoteColumn #'X-offset = #0.1
	\once\override NoteHead #'no-ledgers = ##t
	\once\override NoteHead #'stem-attachment = #'(0 . 0.3)
	\once\override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {
						\rounded-box \pad-markup #0.1 \scale #'(1.1 . 1.1) \flat
	}
}

sharp_notehead = {
	\once \override Staff.Tie.extra-offset = #'(1 . -0.25)	
% 	\once\override NoteColumn #'X-offset = #0.1
	\once\override NoteHead #'no-ledgers = ##t
	\once\override NoteHead #'stem-attachment = #'(0 . 1)
	\once\override NoteHead #'stencil = #ly:text-interface::print
	\once \override NoteHead #'text = \markup {
						\rounded-box \pad-markup #0.1 \scale #'(1.1 . 1.1) \sharp
	}
}

% \score {
% 	\new Staff \with {\override NoteColumn #'after-line-breaking = #if-not-rest }{
% 			c'1
% 	}
% }


% \score {
% 	\new Score \with {
% 		proportionalNotationDuration = #(ly:make-moment 1/40)
% 		\override SpacingSpanner #'uniform-stretching = ##f

% 	}{
% 		<<\new Staff {
% 			\time 9/8
% 			\override Flag.stencil = #modern-straight-flag
% 			\override NoteColumn #'after-line-breaking = #cluster-stem-split
% 			\override NoteColumn #'before-line-breaking = #set-notecolumn-x-offset

% 			\circles
% 			<cqs' c'!>8 [
% 			<dqs'! d'!>8 
% 			\squares
% 			<dqs'! d'!>8 ]

% 			<c' d'>8 [
% 			<c' d'>8 
% 			<c' d'>8 ]
% 			\diamonds
% 			<c'' d''>8 [
% 			<c'' d''>8 
% 			<c'' d''>8 ]			

% 		}
% 	>>
% 	}

% }

