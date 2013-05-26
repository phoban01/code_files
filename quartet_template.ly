\include "/pieces/diotima_quartet/code_files/signs_and_symbols.ly"
\include "/pieces/diotima_quartet/code_files/flare_spanners.ly"
\include "/pieces/diotima_quartet/code_files/bezier_glissando.ly"
\include "/pieces/diotima_quartet/code_files/stems_noteheads_defs.ly"
\include "/pieces/diotima_quartet/code_files/pizz_functions.ly"
\include "/pieces/diotima_quartet/code_files/fingering_diagram_markup.ly"
\include "/pieces/diotima_quartet/code_files/metronome_mark.ly"

%%%
span-shift = {
	\once \override TextSpanner.bound-details.left.padding = #2.5
}

%%%%%
fast-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #0.8
}

med-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #2.25
}

slow-zigzag = {
		\override Glissando.dash-fraction = #0.1
		\override Glissando.dash-period = #4
}


%%%
#(define ((alter-lv-tie-curve offsets) grob)
   (let ((coords (ly:semi-tie::calc-control-points grob)))

     (define (add-offsets coords offsets)
       (if (null? coords)
       '()
       (cons
	 (cons (+ (caar coords) (car offsets))
	       (+ (cdar coords) (cadr offsets)))
	 (add-offsets (cdr coords) (cddr offsets)))))

     (add-offsets coords offsets)))
     
shapeLVTie = #(define-music-function (parser location offsets) (list?)
#{
   \once \override LaissezVibrerTie #'control-points = #(alter-lv-tie-curve offsets)
#})


niente = {
	\once \override Hairpin #'circled-tip = ##t
}

no-gliss-pad = {
		\once \override Glissando.bound-details.right.end-on-accidental = ##f
		\once \override Glissando.bound-details.right.padding = #0
}

%%%
move-markup = #(define-music-function (layout props pair) (pair?)
		#{
			\once \override TextScript #'extra-offset = $pair
		#}
)

%%%
flare_width = {
	\once \override Hairpin #'height = #0.3333
}
%%%

%%%Tuplet Padding function
#(define (padding-function grob)
	(let* (
		(dir (ly:grob-property grob 'direction))
		(up-padding 1.1)
		(down-padding 0.9)
	)
	(if (= dir 1)
		up-padding
		down-padding
	)
	)
)
%%%

%%%GLISS SKIP
glissSkipOn = {
  \override Accidental.stencil = ##f
  \override NoteColumn.glissando-skip = ##t
  \override NoteHead.transparent = ##t
  \override NoteHead.no-ledgers = ##t
}

glissSkipOff = {
  \revert NoteColumn.glissando-skip
  \revert NoteHead.transparent
  \revert NoteHead.no-ledgers
  \revert Accidental.stencil
}
%%%

%%%EFFORT DYNAMICS
effort = #(define-event-function (parser location arg) (markup?)
	(let* (
		(top-adjust (cond
			((equal? arg "f") '(0 . 0.4))
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
			((equal? arg "f") '(-0.2 . -0.4))
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

%%%MISC

fposs = #(make-dynamic-script (markup
				  #:override '(word-space . 0.25)
				  #:line (
				  	#:dynamic "f"
				  	#:fontsize -1
				  	#:normal-text #:italic #:lower 0.5 "poss"
				  ) 
	))

pposs = #(make-dynamic-script (markup
				  #:override '(word-space . 0.25)
				  #:line (
				  	#:dynamic "p"
				  	#:fontsize -1
				  	#:normal-text #:italic #:lower 0.5 "poss"
				  ) 
	))

hideNote = {
	\once \override Accidental #'stencil = ##f
	\once \override NoteHead #'transparent = ##t
	\once \override NoteHead #'no-ledgers = ##t
}

offset_dyn = #(define-music-function (layout props y) (number?)
	#{
		\once \override DynamicText #'extra-offset  = #(cons 0 y)
		\once \override Hairpin #'extra-offset  = #(cons 0 y)
	#}

)

#(define (set-pizz-dynamics-position grob)
	(let* (
		(notehead (ly:grob-parent (ly:grob-parent grob X) X))
		(staff-position (ly:grob-staff-position notehead))
	)
	(if (< staff-position 0) -8 (- staff-position 2))
))

#(define (set-stem-position-grace grob)
	(let* (
		(notehead (ly:grob-property grob 'cause))
		(notehead-pos (ly:grob-staff-position notehead))
		(ideal-length 10)
		(diff (- notehead-pos ideal-length))
		(new-length (- ideal-length diff))
	)
	(display grob) (newline)
	(ly:grob-set-property! grob 'length new-length)
	)
) 

slash_grace = {
  #(remove-grace-property 'Voice 'Stem 'direction)
%   \once \override Stem #'length = #7
  \once \override NoteHead #'stencil = #pizz-circle-head-grace
%   \once \override Flag #'stroke-style = #"grace"
%   \temporary \override Flag #'stencil = #normal-flag
	\once \override Stem #'transparent = ##t
	\once \override Flag #'transparent = ##t
}
%%%

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


%%%%CLEF FUNCTION
bracket-clef = {
	\override Staff.Clef #'stencil = #(lambda (grob)
 	   (bracketify-stencil (ly:clef::print grob) Y 0.1 0.2 0.1))
}

unbracket-clef = {
	\revert Staff.Clef #'stencil
}

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

			))
		(translate (cond
			((equal? clef-type 'full) '(0 . -5))
			((equal? clef-type 'fingerboard) '(0 . -5.4))
			((equal? clef-type 'bow-area) '(0 . -7))
			((equal? clef-type 'fingerboard-small) '(0 . -2.1))
			))
		(scale (cond
			((equal? clef-type 'full) '(18 . 16))
			((equal? clef-type 'fingerboard) '(18 . 15))
			((equal? clef-type 'bow-area) '(16 . 20))
			((equal? clef-type 'fingerboard-small) '(13 . 7.1))

			))		
		)
	#{
		\override Staff.Clef.stencil = #ly:text-interface::print 
		\override Staff.Clef.text = \markup {
							\translate $translate
							\rotate #180
							\scale $scale
							\epsfile #Y #1 $clef
		}
	#})
)
%%%%


%%%%%%%%%%STAFF SWITCH TEMPLATES
string-staff = {
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
}

normal_staff = {
	\revert Staff.TimeSignature.extra-offset
	\revert Staff.NoteHead.Y-offset
	\revert Staff.StaffSymbol #'line-positions
	\revert Staff.StaffSymbol #'line-count
	\revert Staff.BarLine #'bar-extent
	\revert Staff.Clef #'stencil
	\revert Staff.NoteHead.no-ledgers
	\revert Staff.Accidental.stencil
	\revert Staff.TimeSignature #'font-size
	\unset Staff.middleCPosition
	\stemNeutral
% 	\set Staff.forceClef = ##t
}

no_line_staff = {
		\override Staff.NoteHead.no-ledgers = ##t	
		\override Staff.Accidental.stencil = ##f
		\override Staff.Clef.stencil = ##f
		\override Staff.StaffSymbol #'line-positions = #'(-1)
		\override Staff.BarLine #'bar-extent = #'(-2 . 2)
		\set Staff.middleCPosition = #0
}

single_line_staff = {
		\override Staff.NoteHead.no-ledgers = ##t	
		\override Staff.Accidental.stencil = ##f
		\override Staff.Clef.stencil = ##f
		\override Staff.StaffSymbol #'line-count = 1
		\override Staff.StaffSymbol #'line-positions = #'(0)
		\override Staff.BarLine #'bar-extent = #'(-2 . 2)
		\set Staff.middleCPosition = #0
		\stemUp
}

body_staff = {
		\override Staff.StaffSymbol #'line-positions = #'(-6 6)
		\override Staff.NoteHead.no-ledgers = ##t	
		\override Staff.Accidental.stencil = ##f	
		\override Staff.Rest.Y-offset = #0
		\set Staff.middleCPosition = #1
		\body-clef #'fingerboard-small
% 		\set Staff.forceClef = ##t

}

pizz_staff = {
		\set Staff.middleCPosition =  #0
		\override Staff.StaffSymbol #'line-positions = #'(-12 12)
		\override Staff.TimeSignature #'font-size = #3
		\override Staff.Glissando #'thickness = #3
		\override Staff.NoteColumn #'ignore-collision = ##t
		\override Staff.NoteHead.no-ledgers = ##t
		\override Staff.BarLine #'bar-extent = #'(-6 . 6)		
% 		\override Staff.Dots #'staff-position = #set-dot-position
		\override Staff.Accidental #'stencil = ##f
		\body-clef #'fingerboard
% 		\set Staff.forceClef = ##t
}

switch-staff = #(define-music-function (layout position settings) (ly:music?)
		#{
			\stopStaff
			$settings
			\startStaff
		#}
)
%%%%END SWITCH STAFF TEMPLATES

%%%%%BOW POSITION FUNCTIONS
#(define bow-position-mapping
   (list
    (cons (ly:make-pitch 0 6 NATURAL) altosulpont)
    (cons (ly:make-pitch 0 5 NATURAL) sulpont)
    (cons (ly:make-pitch 0 4 NATURAL) nat)
    (cons (ly:make-pitch 0 3 NATURAL) sultasto)
    (cons (ly:make-pitch 0 2 NATURAL) altosultasto)
    (cons (ly:make-pitch 0 1 NATURAL) aldita)
    (cons (ly:make-pitch 0 0 NATURAL) nut)
    ))

#(define (pitch-equals? p1 p2)
   (and
    (= (ly:pitch-alteration p1) (ly:pitch-alteration p2))
    (= (ly:pitch-notename p1) (ly:pitch-notename p2))))

#(define (pitch-to-bow-position pitch)
   (let ((color (assoc pitch bow-position-mapping pitch-equals?)))
     (if color
         (cdr color))))

#(define (bow-position-notehead grob)
   (pitch-to-bow-position
    (ly:event-property (event-cause grob) 'pitch)))




%%%%%END BOW POSITION FUNCTIONS

ppos = #(define-music-function (layout props pos music) (number? ly:music?)
			(let* (
				(gap-size 22)
				(calc-position (inexact->exact (* gap-size pos)))
				(octave (floor (/ calc-position 7)))
				(step (modulo (floor calc-position) 7))
				(alter 0)
				(new-pitch (ly:make-pitch (- octave 2) (+ step 3) alter))
			)
			(ly:music-set-property! music 'pitch new-pitch)
			music
		))

pposr = #(define-music-function (layout props pos music) (number? ly:music?)
			(let* (
				(gap-size 22)
				(calc-position (inexact->exact (* gap-size (- 1 pos))))
				(octave (floor (/ calc-position 7)))
				(step (modulo (floor calc-position) 7))
				(alter 0)
				(new-pitch (ly:make-pitch (- octave 2) (+ step 3) alter))
			)
			(ly:music-set-property! music 'pitch new-pitch)
			music
		))

#(define ((flared-tie coords) grob)

(define (pair-to-list pair)
   (list (car pair) (cdr pair)))

(define (normalize-coords goods x y dir)
  (map
    (lambda (coord)
      (cons (* x (car coord)) (* y dir (cdr coord))))
    goods))

(define (my-c-p-s points thick)
  (make-connected-path-stencil
    points
    thick
    1
    1
    #f
    #f))

;outer let to trigger suicide
(let ((sten (ly:tie::print grob)))
  (if (grob::is-live? grob)
      (let* ((layout (ly:grob-layout grob))
             (line-thickness (ly:output-def-lookup layout 'line-thickness))
             (thickness (ly:grob-property grob 'thickness 0.1))
             (used-thick (* line-thickness thickness))
             (dir (ly:grob-property grob 'direction))
             (xex (ly:stencil-extent sten X))
             (yex (ly:stencil-extent sten Y))
             (lenx (interval-length xex))
             (leny (interval-length yex))
             (yex (ly:stencil-extent sten Y))
             (xtrans (car xex))
             (ytrans (if (> dir 0)(car yex) (cdr yex)))
             (uplist
               (map pair-to-list
                    (normalize-coords coords lenx (* leny 2) dir))))

 (ly:stencil-translate
     (my-c-p-s uplist used-thick)
   (cons xtrans ytrans)))
 '())))

#(define flare-tie
 (flared-tie '((0 . 0)(0.005 . 0.25) (0.995 . 0.25) (1.0 . 0.0))))


\layout {
	\context {
		\Score
	    \remove "Timing_translator"
	    \remove "Default_bar_line_engraver"
		\remove "Bar_number_engraver"
		\accepts "BowPositionStaff"
		\accepts "StringStaff"

		\numericTimeSignature
		\override MetronomeMark #'staff-padding = #10
		\override MetronomeMark #'padding = #5
		\override MetronomeMark #'extra-offset = #'(0 . 2)
		\override MetronomeMark #'stencil = #metro-stencil

		\override Beam #'breakable = ##t
		\override Glissando #'breakable = ##t

		\override Beam #'beam-thickness = #0.75
		\override Beam #'length-fraction = #1.55	
		\override Stem #'stemlet-length = #1	

		proportionalNotationDuration = #(ly:make-moment 1 40)
% 		proportionalNotationDuration = #(ly:make-moment 1 18)

% 		\override SpacingSpanner #'uniform-stretching = ##t
		\override SpacingSpanner.strict-grace-spacing = ##t
		
		tupletFullLength = ##f
		tupletFullLengthNote = ##f

% 		\override Tie #'stencil = #flare-tie
		\override Flag.stencil = #modern-straight-flag
		\override Glissando #'thickness = #3
		\override Glissando.bound-details.right.end-on-accidental = ##t
		\override Glissando.bound-details.right.padding = #1.75

% 		\override Stem #'length = #10

		\override TupletBracket #'bracket-visibility = ##t
		\override TupletBracket #'full-length-to-extent = ##t
		\override TupletBracket #'full-length-padding = #0
		\override TupletNumber #'text = #tuplet-number::calc-fraction-text
		\override TupletNumber #'font-name = #"Optima"
		\override TupletNumber #'font-size = #'-3
		\override TupletBracket #'staff-padding = #2

% 		\override StaffGrouper #'staff-staff-spacing = #'(
% 						(basic-distance . 35) 
% 						(minimum-distance . 35) 
% 						(padding . 0)
% 					    (stretchability . 0)
% 						)
		\override StaffGrouper #'staff-staff-spacing = #'(
						(basic-distance . 5) 
						(minimum-distance . 5) 
						(padding . 10)
					    (stretchability . 0)
						)
		\override VerticalAxisGroup #'staffgroup-staff-spacing =
			#'((basic-distance . 30)
			(minimum-distance . 30)
			(padding . 0)
		    (stretchability . 0)
			)		
		\override StemTremolo #'style = #'rectangle
		\override StemTremolo #'beam-thickness = #0.6

		\override InstrumentName #'font-name = #"Optima"
% 		\override StemTremolo #'slope = #0.1

		\override LaissezVibrerTie #'control-points = #(lambda (grob)
		       (if (= UP (ly:grob-property grob 'direction))
		       ((alter-lv-tie-curve '(0 0 0.75 0.7 2.25 0.7 3 0)) grob)
		       ((alter-lv-tie-curve '(0 0 0.75 -0.7 2.25 -0.7 3 0)) grob)))

	}

	\context {
		\StaffGroup
		\accepts "BowPositionStaff"
		\accepts "HiddenStaff"
		\accepts "StringStaff"

	}
	\context {
		\Voice 
		\consists "Accidental_engraver"
	}
	\context {
		\Staff
	    \consists "Timing_translator"
	    \consists "Default_bar_line_engraver"
		\consists "Bar_number_engraver"
		\remove "Accidental_engraver"
	    \accepts "LeftHandVoice"
		\accepts "RightHandVoice"	
% 		\override NoteColumn #'after-line-breaking = #cluster-stem-split
		%if not rest function acts as a gate-keeper only letting through grobs with noteheads...no rests allowed
		\override NoteColumn #'after-line-breaking = #if-not-rest
		\override BarNumber #'break-visibility = #'#(#t #t #f)
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'direction = #UP
		\override BarNumber #'font-size = #2
		\override BarNumber #'font-name = #"Optima"
		\override BarNumber #'padding = #2
		\override BarNumber #'whiteout = ##t
		\override BarNumber #'stencil = #(make-stencil-circler 0.1 0.5 ly:text-interface::print)			
		barNumberVisibility = #(every-nth-bar-number-visible 1)

		\override TupletBracket #'padding = #padding-function

		\override Tie #'extra-offset = #'(0 . -0.5)
	}

	\context {
		\Staff
		\alias "Staff"
		\name "PizzStaff"
		\remove "Ledger_line_engraver"
		\remove "Accidental_engraver"
		\accepts "LeftHandVoice"
		\accepts "RightHandVoice"
		\numericTimeSignature

		middleCPosition =  #0

		\override StaffSymbol #'line-positions = #'(-12 12)
		\override Clef #'stencil = #ly:text-interface::print
		\override Clef #'text = \markup {
				\translate #'(0 . -5.85)
				\scale #'(13.5 . 13.5)
				\epsfile #Y #1 #"/pieces/diotima_quartet/clefs/fingerboard.eps"
		}
		\override TimeSignature #'font-size = #3
		\override Glissando #'thickness = #3
		\override NoteColumn #'ignore-collision = ##t

	}
	\context {
		\Voice
		    \remove "Forbid_line_break_engraver"
	}
	\context {
		\Voice
		\alias "Voice"
		\name "LeftHandVoice"
		\remove "Accidental_engraver"

% 		#(add-grace-property 'Voice 'Stem 'length set-stem-position-grace)

		\override TupletBracket #'padding = #1

		\override Beam #'breakable = ##t
		\override Glissando #'breakable = ##t

		\override Glissando.bound-details.left.padding = #0
		\override Glissando.bound-details.right.padding = #0
		\override Glissando.bound-details.right.attach-dir = #0
		\override Glissando.bound-details.left.attach-dir = #0

		\override TextScript #'outside-staff-priority = ##f	
% 		\override NoteHead.stem-attachment = #'(0 . 0)	
		\override NoteHead #'stencil = #pizz-circle-head
		\override Stem #'direction = #DOWN
% 		\override Voice.GraceStem #'length = #25

		\override Beam #'positions = #'(-16 . -16)
		\override Staff.Dots.staff-position = #(lambda (grob) (set-dot-position grob 0))

	}
	\context {
		\Voice
		\alias "Voice"
		\name "RightHandVoice"
		\remove "Accidental_engraver"

		\override Beam #'breakable = ##t
		\override Glissando #'breakable = ##t

		\override Staff.Dots.staff-position = #(lambda (grob) (set-dot-position grob 22))
% 		\override DynamicLineSpanner #'Y-offset = #set-pizz-dynamics-position
		\override DynamicLineSpanner #'direction = #UP
		\override DynamicLineSpanner #'padding = #2
		\override DynamicText #'font-size = #-2
		\override DynamicLineSpanner #'outside-staff-priority = ##f
		\override NoteHead #'stencil = #fingertip-pizz
% 		\override Stem #'layer = #1
		\override Stem #'direction = #UP
% 		\override Stem #'length = #(lambda (grob) (set-stem-position grob 8))
		\override Beam #'positions = #'(12 . 12)
		\override Rest #'font-size = #-2

	}
	\context {
		\Staff
		\alias Staff
		\name "BowPositionStaff"
		\remove "Clef_engraver"
		\remove "Bar_number_engraver"
		\remove "Ledger_line_engraver"
		\remove "Time_signature_engraver"
		\remove "Accidental_engraver"
% 	    \consists "Timing_translator"
% 	    \consists "Default_bar_line_engraver"

		\override BarLine.transparent = ##t
		\override Accidental.stencil = ##f
		\override Stem #'direction = #UP
		\override StaffSymbol #'transparent = ##t
		\override StaffSymbol #'line-count = 3
		middleCPosition = #-3
		\override NoteHead #'stencil = #ly:text-interface::print
		\override NoteHead #'text = #bow-position-notehead
		\override NoteHead #'stem-attachment = #'(0 . 1)
		\override Beam #'positions = #'(5 . 5)
		\override Beam #'color = #grey
		\override Beam.beam-thickness = #0.45
		\override Beam.length-fraction = #0.85
		\override Stem #'color = #grey
		\override Glissando #'color = #grey 
		\override Glissando #'layer = #-10
		\override Glissando.bound-details.right.padding = #0
		\override Glissando.bound-details.left.padding = #0

		\override TupletBracket #'color = #grey 
		\override TupletNumber #'color = #grey 
		\override TupletNumber #'font-size = #1
		fontSize = #-4
		\override StaffSymbol #'staff-space = #(magstep 2)

		\override VerticalAxisGroup #'staff-staff-spacing =
			#'((basic-distance . 0)
			(minimum-distance . 0)
			(padding . 1)
		    (stretchability . 0)
			)		
	}
	\context {
		\Staff
		\alias Staff
		\name "HiddenStaff"
		\remove "Clef_engraver"
		\remove "Ledger_line_engraver"
		\remove "Time_signature_engraver"
		\remove "Accidental_engraver"

		\override Accidental.stencil = ##f

		\override StaffSymbol #'transparent = ##t
		\override StaffSymbol #'line-count = 0
		middleCPosition = #0

		\override VerticalAxisGroup #'staff-staff-spacing =
			#'((basic-distance . 0)
			(minimum-distance . 0)
			(padding . 3)
		    (stretchability . 0)
			)		
	}
	\context {
		\Staff
		\alias Staff
		\name "StringStaff"
% 	    \consists "Timing_translator"
% 	    \consists "Default_bar_line_engraver"		
		\remove "Ledger_line_engraver"
		\remove "Bar_number_engraver"
		\remove "Accidental_engraver"

		\override TimeSignature.extra-offset = #'(0 . 0)
		\override Accidental.stencil = ##f
		\override NoteHead.Y-offset = #string-staff-transpose
		\override Clef.stencil = #ly:text-interface::print
		\override Clef.text = \markup {
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
		\override Glissando.bound-details.left.padding = #0
		\override Glissando.bound-details.right.padding = #0
		\override StaffSymbol #'line-positions = #'(-4.25 -1.25 1.75 4.75)
		
		\override VerticalAxisGroup #'staff-staff-spacing =
			#'((basic-distance . 0)
			(minimum-distance . 0)
			(padding . 1)
		    (stretchability . 0)
			)
	
	}
}

#(set-global-staff-size 16)
#(set-default-paper-size "a3" 'portrait)

\paper {
	system-system-spacing = #'((basic-distance . 40) (minimum-distance . 40) (padding . 0))
% 	system-system-spacing = #'((basic-distance . 30) (minimum-distance . 20) (padding . 5))
}

\header {
	tagline = ""
}