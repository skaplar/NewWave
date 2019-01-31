"
I am a class that contains several examples. You can use one of my examples really easy with

| e |
e := ExampleExecutions new.
e startExample1.

Which will run example 1. And so on for the other examples.
"
Class {
	#name : #ExampleExecutions,
	#superclass : #Object,
	#category : #'NewWave-Example'
}

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample1 [
	"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
	| se ee t1 t2 t3 we seq seq2 seq3 seqexc seqexc1 seqexc2 split1 engine|

	se := StartEvent new.
	se description: 'StartEvent'.

	t1 := DialogTask new.
	t1 description: 'A'.

	t2 := BaseTask new.
	t2 description: 'B'.
	t2 value: 200.

	t3 := BaseTask new.
	t3 description: 'C'.
	t3 value: 300.

	ee := EndEvent new.
	ee description: 'EndEvent'.

	split1 := Exclusive new.
	split1 description: 'Split1'.

	seq := Sequence source: se target: t1.
	seqexc := Sequence source: t1 target: split1.

	seqexc1 := Sequence source: split1 target: t2 condition: [:x | x = true]. 
	seqexc2 := Sequence source: split1 target: t3 condition: [:x | x = false].

	seq2 := Sequence source: t2 target: ee.
	seq3 := Sequence source: t3 target: ee.
	
	se addOutgoingFlow: seq.

	t1 addIncoming: seq addOutgoing: seqexc. 
	split1 addIncoming: seqexc addOutgoingList: (OrderedCollection with: seqexc1  with: seqexc2). 

	t2 addIncoming: seqexc1  addOutgoing: seq2.
	t3 addIncoming: seqexc1  addOutgoing: seq3.

	ee addIncomingFlow: seq2.
	ee addIncomingFlow: seq3.

	engine := WaveEngine new.
	we := WaveExecutor initialNode: se.
	engine addExecutor: we.
	engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample2 [
"This example uses parallel gateway, where both paths are taken, and joined later."
| se ee t1 t2 t3 we seq seq2 seq3 seqexc seqexc1 seqexc2 split1 pj seq4 seq5 t4 engine|
TKTDebugger disable.
se := StartEvent new.
se description: 'StartEvent'.

t1 := BaseTask new.
t1 description: 'B'.
t1 value: 200.

t2 := DialogTask new.
t2 description: 'A'.

t3 := BaseTask new.
t3 description: 'C'.
t3 value: 300.

t4 := BaseTask new.
t4 description: 'D'.
t4 value: 400.

ee := EndEvent new.
ee description: 'EndEvent'.

split1 := Parallel new.
split1 description: 'Split1'.

pj := ParallelJoin new.
pj description: 'ParallelJoin'.

seq := Sequence source: se target: t1.
seqexc := Sequence source: t1 target: split1.

seqexc1 := Sequence source: split1 target: t2 condition: [:x | x = true]. 
seqexc2 := Sequence source: split1 target: t3 condition: [:x | x = false].

seq2 := Sequence source: t2 target: pj.
seq3 := Sequence source: t3 target: pj.

seq4 := Sequence source: pj target: t4.
seq5 := Sequence source: t4 target: ee.

se addOutgoingFlow: seq.

t1 addIncoming: seq addOutgoing: seqexc. 
split1 addIncoming: seqexc addOutgoingList: (OrderedCollection with: seqexc1  with: seqexc2). 

t2 addIncoming: seqexc1  addOutgoing: seq2.
t3 addIncoming: seqexc2  addOutgoing: seq3.

pj addIncomingList: (OrderedCollection with: seq2 with: seq3) addOutgoing: seq4.

t4 addIncoming: seq4 addOutgoing: seq5.  

ee addIncomingFlow: seq5.

engine := WaveEngine new.
we := WaveExecutor initialNode: se.
engine addExecutor: we.
engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample3 [
"This example uses two parallel gateways, where both paths are taken, and joined later."
| start  psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2c seqcpj1  seqps2d seqde2 we f sss2 engine|
TKTDebugger disable.
start := StartEvent new.
start description: 'StartEvent'.

psplit1 := Parallel new.
psplit1 description: 'Parallel Split 1'.

a := BaseTask new.
a description: 'A'.
a value: 'A has been performed'.

b := BaseTask new.
b description: 'B'.
b value: 'B has been performed'.

c := BaseTask new.
c description: 'C'.
c value: 'C has been performed'.

d := BaseTask new.
d description: 'D'.
d value: 'D has been performed'.

f := BaseTask new.
f description: 'F'.
f value: 'F has been performed'.

pjoin1 := ParallelJoin new.
pjoin1 description: 'Parallel Join 1'.

psplit2 := Parallel new.
psplit2 description: 'Parallel Split 2'.

e1 := EndEvent new.
e1 description: 'End Event 1'.

e2 := EndEvent new.
e2 description: 'End Event 2'.

seqeps1 := Sequence source: start target: psplit1.
seqps1a := Sequence source: psplit1  target: a.
seqps1b := Sequence source: psplit1  target: b.
seqapj1 := Sequence source: a target: pjoin1.
seqpj1e := Sequence source: pjoin1  target: f.
seqbps2 := Sequence source: b target: psplit2.
seqps2c := Sequence source: psplit2 target: c.
seqcpj1 := Sequence source: c target: pjoin1.
seqps2d := Sequence source: psplit2  target: d.
seqde2 := Sequence source: d target: e2.
sss2 := Sequence source: f target: e1. 

start addOutgoingFlow: seqeps1.
psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1b).

a addIncoming: seqps1a addOutgoing: seqapj1.
b addIncoming: seqps1b addOutgoing: seqbps2.
pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqcpj1 ) addOutgoing: seqpj1e.

f addIncoming: seqpj1e addOutgoing: sss2.

psplit2 addIncoming: seqbps2  addOutgoingList: (OrderedCollection with: seqps2c with: seqps2d).

c addIncoming: seqps2c addOutgoing: seqcpj1.
d addIncoming: seqps2d  addOutgoing: seqde2.

e1 addIncomingFlow: sss2.
e2 addIncomingFlow: seqde2.

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample4 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use task f as intermediate after Join 1."
| start psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2c seqcpj1  seqps2d seqde2 we engine|
TKTDebugger disable.
start := StartEvent new.
start description: 'StartEvent'.

psplit1 := Parallel new.
psplit1 description: 'Parallel Split 1'.

a := BaseTask new.
a description: 'A'.
a value: 'A has been performed'.

b := BaseTask new.
b description: 'B'.
b value: 'B has been performed'.

c := BaseTask new.
c description: 'C'.
c value: 'C has been performed'.

d := BaseTask new.
d description: 'D'.
d value: 'D has been performed'.

pjoin1 := ParallelJoin new.
pjoin1 description: 'Parallel Join 1'.

psplit2 := Parallel new.
psplit2 description: 'Parallel Split 2'.

e1 := EndEvent new.
e1 description: 'End Event 1'.

e2 := EndEvent new.
e2 description: 'End Event 2'.

seqeps1 := Sequence source: start target: psplit1.
seqps1a := Sequence source: psplit1  target: a.
seqps1b := Sequence source: psplit1  target: b.
seqapj1 := Sequence source: a target: pjoin1.
seqpj1e := Sequence source: pjoin1  target: e1.
seqbps2 := Sequence source: b target: psplit2.
seqps2c := Sequence source: psplit2 target: c.
seqcpj1 := Sequence source: c target: pjoin1.
seqps2d := Sequence source: psplit2  target: d.
seqde2 := Sequence source: d target: e2.

start addOutgoingFlow: seqeps1.
psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1b).

a addIncoming: seqps1a addOutgoing: seqapj1.
b addIncoming: seqps1b addOutgoing: seqbps2.
pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqcpj1 ) addOutgoing: seqpj1e.

psplit2 addIncoming: seqbps2  addOutgoingList: (OrderedCollection with: seqps2c with: seqps2d).

c addIncoming: seqps2c addOutgoing: seqcpj1.
d addIncoming: seqps2d  addOutgoing: seqde2.

e1 addIncomingFlow: seqpj1e.
e2 addIncomingFlow: seqde2.

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample5 [
"This example uses two parallel gateways, one immediately after another where both paths are taken, and joined later. Doesnt use any task as intermediate after ps1 to ps2."
| start psplit1 a b c psplit2 pjoin1 e1 e2 we engine 
seqeps1
seqps1a
seqps1ps2 
seqps2b 
seqps2c 
seqce2 
seqabpj1
seqapj1 
seqpj1e|

TKTDebugger disable.
start := StartEvent new.
start description: 'StartEvent'.

psplit1 := Parallel new.
psplit1 description: 'Parallel Split 1'.

a := BaseTask new.
a description: 'A'.
a value: 'A has been performed'.

b := BaseTask new.
b description: 'B'.
b value: 'B has been performed'.

c := BaseTask new.
c description: 'C'.
c value: 'C has been performed'.

pjoin1 := ParallelJoin new.
pjoin1 description: 'Parallel Join 1'.

psplit2 := Parallel new.
psplit2 description: 'Parallel Split 2'.

e1 := EndEvent new.
e1 description: 'End Event 1'.

e2 := EndEvent new.
e2 description: 'End Event 2'.

seqeps1 := Sequence source: start target: psplit1.
seqps1a := Sequence source: psplit1  target: a.
seqps1ps2 := Sequence source: psplit1  target: psplit2.
seqps2b := Sequence source: psplit2 target: b.
seqps2c := Sequence source: psplit2 target: c.
seqce2 := Sequence source: c target: e2. 
seqabpj1 := Sequence source: b target: pjoin1.
seqapj1 := Sequence source: a  target: pjoin1.
seqpj1e := Sequence source: pjoin1 target: e1. 


start addOutgoingFlow: seqeps1.
psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1ps2).

a addIncoming: seqps1a addOutgoing: seqapj1.
b addIncoming: seqps2b addOutgoing: seqabpj1.
pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqabpj1 ) addOutgoing: seqpj1e.

psplit2 addIncoming: seqps1ps2  addOutgoingList: (OrderedCollection with: seqps2b  with: seqps2c ).

c addIncoming: seqps2c  addOutgoing: seqce2.

e1 addIncomingFlow: seqpj1e.
e2 addIncomingFlow: seqce2.

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample6 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use any task as intermediate after ps2 to pj1."
| start  psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2d seqde2 we seqps2pj1 engine|
TKTDebugger disable.
start := StartEvent new.
start description: 'StartEvent'.

psplit1 := Parallel new.
psplit1 description: 'Parallel Split 1'.

a := BaseTask new.
a description: 'A'.
a value: 'A has been performed'.

b := BaseTask new.
b description: 'B'.
b value: 'B has been performed'.

c := BaseTask new.
c description: 'C'.
c value: 'C has been performed'.

d := BaseTask new.
d description: 'D'.
d value: 'D has been performed'.

pjoin1 := ParallelJoin new.
pjoin1 description: 'Parallel Join 1'.

psplit2 := Parallel new.
psplit2 description: 'Parallel Split 2'.

e1 := EndEvent new.
e1 description: 'End Event 1'.

e2 := EndEvent new.
e2 description: 'End Event 2'.

seqeps1 := Sequence source: start target: psplit1.
seqps1a := Sequence source: psplit1  target: a.
seqps1b := Sequence source: psplit1  target: b.
seqapj1 := Sequence source: a target: pjoin1.
seqpj1e := Sequence source: pjoin1  target: e1.
seqbps2 := Sequence source: b target: psplit2.
seqps2pj1 := Sequence source: psplit2 target: pjoin1.

seqps2d := Sequence source: psplit2  target: d.
seqde2 := Sequence source: d target: e2.

start addOutgoingFlow: seqeps1.
psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1b).

a addIncoming: seqps1a addOutgoing: seqapj1.
b addIncoming: seqps1b addOutgoing: seqbps2.
pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqps2pj1 ) addOutgoing: seqpj1e.

psplit2 addIncoming: seqbps2  addOutgoingList: (OrderedCollection with: seqps2pj1 with: seqps2d).

d addIncoming: seqps2d  addOutgoing: seqde2.

e1 addIncomingFlow: seqpj1e.
e2 addIncomingFlow: seqde2.

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample7 [
"This example uses two parallel gateways, where both paths are taken, and uses two joines. "
| start  psplit1 a b c  psplit2 pjoin1 e1 e2 we  engine 
seqeps1
seqps1a
seqps1ps2 
seqps2b 
seqps2c 
seqce2 
seqabpj1
seqapj1 
seqpj1e
pjoin2
seqe1pj2
seqe2pj2
seqpj2ee
ee|

TKTDebugger disable.
start := StartEvent new.
start description: 'StartEvent'.

psplit1 := Parallel new.
psplit1 description: 'Parallel Split 1'.

a := BaseTask new.
a description: 'A'.
a value: 'A has been performed'.

b := BaseTask new.
b description: 'B'.
b value: 'B has been performed'.

c := BaseTask new.
c description: 'C'.
c value: 'C has been performed'.

pjoin1 := ParallelJoin new.
pjoin1 description: 'Parallel Join 1'.

pjoin2 := ParallelJoin new.
pjoin2 description: 'Parallel Join 2'.

psplit2 := Parallel new.
psplit2 description: 'Parallel Split 2'.

e1 := BaseTask new.
e1 description: 'E1 '.
e1 value: 'E1 has been performed!'.

e2 := BaseTask  new.
e2 description: 'E2'.
e2 value: 'E2 has been performed!'.

ee := EndEvent new.
ee description: 'End Event ee'.

seqeps1 := Sequence source: start target: psplit1.
seqps1a := Sequence source: psplit1  target: a.
seqps1ps2 := Sequence source: psplit1  target: psplit2.
seqps2b := Sequence source: psplit2 target: b.
seqps2c := Sequence source: psplit2 target: c.
seqce2 := Sequence source: c target: e2. 
seqabpj1 := Sequence source: b target: pjoin1.
seqapj1 := Sequence source: a  target: pjoin1.
seqpj1e := Sequence source: pjoin1 target: e1. 
seqe1pj2 := Sequence source: e1 target: pjoin2.
seqe2pj2 := Sequence source: e2 target:  pjoin2.
seqpj2ee := Sequence source: pjoin2  target: ee. 


start addOutgoingFlow: seqeps1.
psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1ps2).

a addIncoming: seqps1a addOutgoing: seqapj1.
b addIncoming: seqps2b addOutgoing: seqabpj1.
pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqabpj1 ) addOutgoing: seqpj1e.

psplit2 addIncoming: seqps1ps2  addOutgoingList: (OrderedCollection with: seqps2b  with: seqps2c ).

c addIncoming: seqps2c  addOutgoing: seqce2.

e1 addIncoming: seqpj1e addOutgoing: seqe1pj2. 
e2 addIncoming: seqce2 addOutgoing: seqe2pj2. 

pjoin2 addIncomingList: (OrderedCollection with: seqe1pj2  with: seqe2pj2 ) addOutgoing: seqpj2ee.

ee addIncomingFlow: seqpj2ee. 

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
]
