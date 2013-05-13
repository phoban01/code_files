from abjad import *
from random import *
import math


def transform_int_ratios_to_rhythms_2(ratio, base_duration=(1, 16),
	split_duration=(1, 4), fracture_spanners=True,time_sig=(3,4)):
    base_duration = Duration(base_duration)
    tie_chain_durations = [multiplier * base_duration for multiplier in ratio]
    box = []
    output = Container([])
    for tie_chain_duration in tie_chain_durations:
    	if tie_chain_duration.numerator > 0:
        	box.extend(notetools.make_notes(0, tie_chain_duration))
        else:
        	box.extend(leaftools.make_leaves(None, (abs(tie_chain_duration.numerator),tie_chain_duration.denominator)))
   	measure = measuretools.Measure(time_sig, [])
    for shard in componenttools.split_components_at_offsets(box[:], [split_duration],
        cyclic=True, fracture_spanners=fracture_spanners):
        if (measure.contents_duration + Duration(*split_duration)) <= measure.target_duration:
        	measure.extend(shard)
        else:
        	output.append(measure)
        	measure = measuretools.Measure(time_sig, [])
        	measure.extend(shard)
    tietools.TieSpanner(output[:])
    return output


def make_run(n):
	output = Container([])
	for i in range(n):
		on_series = [9,7,11,6,8,10,5,8,12]
		shuffle(on_series)
		off_series = [-4,-6,-3,-5,-2,-7,-4,-5,-8]
		off_series = [x+randint(-1,1) for x in off_series]
		container = []
		summa = [val for pair in zip(on_series,off_series) for val in pair]
		output.append(transform_int_ratios_to_rhythms_2(summa))
	return output



music = [stafftools.RhythmicStaff([make_run(3)]) for x in range(4)]

staff = scoretools.StaffGroup(music)

# timesignaturetools.establish_metrical_hierarchy(staff[:],(4,4))

show(staff)

