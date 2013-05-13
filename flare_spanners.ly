flare_ps = \markup \with-dimensions #'(0 . 0.1) #'(-1.3333 . 1.3333) { \postscript #"
        .1 setlinewidth
        -1 0.3333 translate
        0 0 moveto
        0.25 0.75 lineto
        stroke

        0 -0.65 translate
        0 0 moveto
        0.25 -0.75 lineto
        stroke"
}

flare_sf_ps = \markup \with-dimensions #'(0 . 0.1) #'(-1.3333 . 1.3333) { \postscript #"
        .1 setlinewidth
        -1 0.3333 translate
        0 0 moveto
        0.25 0.75 lineto
        stroke

        0 -0.65 translate
        0 0 moveto
        0.25 -0.75 lineto
        stroke"
        \translate #'(-1 . -0.625) \dynamic sf
}

flare_sfz_ps = \markup \with-dimensions #'(0 . 0.1) #'(-1.3333 . 1.3333) { \postscript #"
        .1 setlinewidth
        -1 0.3333 translate
        0 0 moveto
        0.25 0.75 lineto
        stroke

        0 -0.65 translate
        0 0 moveto
        0.25 -0.75 lineto
        stroke"
        \translate #'(-1 . -0.625) \dynamic sfz
}

flare_sffz_ps = \markup \with-dimensions #'(0 . 0.1) #'(-1.3333 . 1.3333) { \postscript #"
        .1 setlinewidth
        -1 0.3333 translate
        0 0 moveto
        0.25 0.75 lineto
        stroke

        0 -0.65 translate
        0 0 moveto
        0.25 -0.75 lineto
        stroke"
        \translate #'(-1 . -0.625) \dynamic sffz
}

flare_pp_ps = \markup { \concat { \raise #0.3333 \flare_ps \dynamic { pp } } }
flare_p_ps = \markup { \concat { \raise #0.3333 \flare_ps \dynamic { p } } }
flare_mp_ps = \markup { \concat { \raise #0.3333 \flare_ps \dynamic { mp } } }
flare_mf_ps = \markup { \concat { \raise #0.6 \flare_ps \dynamic { mf } } }
flare_f_ps = \markup { \concat { \raise #0.6 \flare_ps \dynamic { f } } }
flare_ff_ps = \markup { \concat { \raise #0.6 \flare_ps \dynamic { ff } } }
flare_fff_ps = \markup { \concat { \raise #0.6 \flare_ps \dynamic { fff } } }

flare_pp = #(make-dynamic-script flare_pp_ps)
flare_p = #(make-dynamic-script flare_p_ps)
flare_mp = #(make-dynamic-script flare_mp_ps)
flare_mf = #(make-dynamic-script flare_mf_ps)
flare_f = #(make-dynamic-script flare_f_ps)
flare_ff = #(make-dynamic-script flare_ff_ps)
flare_fff = #(make-dynamic-script flare_fff_ps)

flare_sf = #(make-dynamic-script flare_sf_ps)
flare_sfz = #(make-dynamic-script flare_sfz_ps)
flare_sffz = #(make-dynamic-script flare_sffz_ps)
