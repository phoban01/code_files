
\score {
	\new Staff {
		\override TextSpanner.bound-details.right.arrow = ##f	
		\override TextSpanner.bound-details.left.text = \markup {S}
		\override TextSpanner.bound-details.right.text = \markup {\translate #'(0 . 0) \draw-line #'(0 . -0.75)}
		\override TextSpanner.bound-details.left.stencil-align-dir-y = #0
		\override TextSpanner.bound-details.right.stencil-align-dir-y = #0.9	
		\override TextSpanner.bound-details.right.padding = #-1
		\override TextSpanner.style = #'solid

		c'2. \startTextSpan c'4 \stopTextSpan

	}
}