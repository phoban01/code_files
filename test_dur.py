from abjad import *

tempo = contexttools.TempoMark((1,4),120)

data = [(4,4)]*60

measures = measuretools.make_measures_with_full_measure_spacer_skips(data)
score = Score([Staff(measures)])
tempo(score[0])
duration = score[-1].stop_offset_in_seconds.__float__()

print duration

# 40 seconds ful