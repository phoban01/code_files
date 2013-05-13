from random import *
from itertools import izip,islice,tee
import pydot,string,math

def nextTime(rateParameter):
    return -math.log(1.0 - random()) / rateParameter

def pairwise(iterable):
	a, b = tee(iterable)
	next(b, None)
	return list(izip(a, b))

def wchoice(lst,weights):
    rnd = random() * sum(weights)
    for i, w in enumerate(weights):
        rnd -= w
        if rnd < 0:
            return lst[i]

def make_constellation():
	bow_movement = ["circular motion",
	"vertical motion no \n horizontal movement","vertical motion almost \n no horizontal movement",
	"vertical motion with \n some horizontal \n movement","horizontal movement"
	]
	bow_pressure = ["very light pressure",
	"light pressure",'moderate pressure',"heavy pressure",
	"very heavy pressure"]
	bow_speed = ["slow speed" , "medium speed", "fast speed"]
	stability = ["stable","somewhat stable","somewhat unstable","very unstable"]
	fingers = ["muting","harmonic","tremolo harmonic","stopped","wild"]
	strings = ["one","two","three","four"]
	output = [
		wchoice(bow_movement,[0.25,0.15,0.175,0.18,0.1]),
		wchoice(bow_pressure,[0.3,0.3,0.2,0.1,0.05]),
		wchoice(bow_speed,[0.3,0.5,0.5]),
		wchoice(fingers,[0.25,0.3,0.15,0.2,0.1]),
		wchoice(strings,[0.1,0.35,0.35,0.35]),
		wchoice(stability,[0.35,0.5,0.4,0.3])
	]
	return output

def make_sequence(n=3):
	output = []
	cons = make_constellation()
	for i in range(n):
		new_cons = make_constellation()
		change_factor = choice([1,2,3,4])
		bag = range(4)
		shuffle(bag)
		change = bag[:change_factor]
		for j in change:
			cons[j] = new_cons[j]
		# strings  change all the time
		cons[4] = new_cons[4]
		# fingers change a lot
		if randint(0,100) > 20:
			cons[3] = new_cons[3]
		output.append(cons[:])
	movement = [x[0] for x in output]
	pressure = [x[1] for x in output]
	speed = [x[2] for x in output]
	fingers = [x[3] for x in output]
	strings = [x[4] for x in output]
	stability = [x[5] for x in output]
	return {"movement":movement,"pressure":pressure,"speed":speed,"stability":stability,"fingers":fingers,"strings":strings}

def random_string(n=6):
	return str([choice(string.ascii_letters) for i in range(n)])

random_number_selection = [(2,4),(3,5),(4,7),(7,10)]

movements = ["1","2","3","4","5"]

for movement in movements:
	print movement
	for chart in range(13):
		instance = (str(chart+1))

		seq = make_sequence(randint(*wchoice(random_number_selection,[0.3,0.5,0.4,0.1])))

		parameters = ["movement","pressure","speed","fingers","strings","stability"]

		graph = pydot.Dot(title="Bow Parameters",graph_type='digraph',page="A3")

		title_node = pydot.Node("Parameter Cycle",label="Movement {0} Parameter Cycle: {1}".format(movement,instance),
			style='filled',fillcolor='black',fontcolor='white',fontname="Optima",fontsize=15,shape='box')

		graph.add_node(title_node)

		for i in parameters:
			p_node = pydot.Node(i,shape='box',fillcolor='gray',style='filled',fontname="Optima",fontsize=14)
			graph.add_edge(pydot.Edge(title_node,p_node,fillcolor='white',style='invis'))
			graph.add_node(p_node)
			node_store = []
			for j,type in enumerate(seq[i]):
				node = pydot.Node(random_string(),label=type,shape='note',fontname="Helvetica Neue Light",fontsize=12)
				graph.add_node(node)
				if j == 0:
					graph.add_edge(pydot.Edge(p_node,node))
				elif j == len(seq[i])-1:
					graph.add_edge(pydot.Edge(node,node_store[0]))
					graph.add_edge(pydot.Edge(node_store[-1],node))			
				else:
					graph.add_edge(pydot.Edge(node_store[-1],node))
				node_store.append(node)

		graph.write_pdf("/pieces/diotima_quartet/pdfs/carousels/m{0}/movement_{0}_carousel_{1}.pdf".format(movement,instance),prog=['dot',"-Goverlap=prism"])

