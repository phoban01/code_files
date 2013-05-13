\language "english"
\include "/pieces/diotima_quartet/code_files/eighthTone.ly"

\score {
	\new Score \with {
		proportionalNotationDuration = #(ly:make-moment 1 30)
	} {
		\new StaffGroup <<

			\new Staff {
				\cadenzaOn
				\override NoteHead #'style = #'harmonic
				\clef "treble"
				\times 2/3 {
					\afterGrace cs'8 \glissando {c'8}
					r4
				}
				r8
				\afterGrace ds''16 \glissando {dqs''8} r8.
				r8
				\bar "|"
				cs''32 [ \glissando \afterGrace d''32 ] \glissando {cs''8}
				r32 \afterGrace aqf'16. \glissando {a'8}
				r32
				bqf8 [ \glissando 
				\once \override NoteColumn #'glissando-skip = ##t
				\once \override NoteHead #'transparent = ##t
				\afterGrace b32] {as8} r16. \bar "|"
				s8 aqf''8 s16 s16.
				d''8 [ \glissando
				\once \override NoteColumn #'glissando-skip = ##t
				\once \override NoteHead #'transparent = ##t
				\afterGrace d''32 ] \glissando {cs''8}
				r16
				\times 2/3 {
					\afterGrace gs'8 \glissando {ges'8} r4
				}
				\bar "|"
				r8 r32 
				\afterGrace cqf'''16. \glissando {b''8}
				r16
				\bar "|"
			}	
			\new Staff {
				\cadenzaOn
				\override NoteHead #'style = #'harmonic
				\clef "treble"
				\times 4/5 {
					b8 \glissando \afterGrace bes8 \glissando {b8} r16
				}
				r8
				r32 \afterGrace gs'16. \glissando {gqs'8} r8
				r8
				\bar "|"
				r16
				\afterGrace d'32 \glissando {def'8} r8
				r4
				\bar "|"
				\afterGrace bqf8 [ \glissando {bes8}
				aqf''16 \afterGrace dqs''16. \glissando {ds''8}
				dsef'8 ] \glissando 
				\once \override NoteColumn #'glissando-skip = ##t
				\once \override NoteHead #'transparent = ##t
				\afterGrace d'8 \glissando {cses'8} r32
				r16
				\times 2/3 {
					r16 \afterGrace cqf'16 \glissando {b8}	
					r4
				}
				\bar "|"
				\afterGrace aqf''8. \glissando {gs'8}
				gsef''8 \bar "|"
			}			
	>>
}
	\midi {}
	\layout {}
}