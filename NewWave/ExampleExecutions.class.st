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
ExampleExecutions class >> returnExampleProcess1 [
	"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
	| se ee t1 t2 t3 split1 engine process |

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
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.
	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ].
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.
	
	^ NewWaveProcess name: 'process2' initialFlowElement: se.
	
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess [
	
	| se t1 adresa1 do ee process|

	se := StartEvent new.
	se description: 'Start'.

	t1 := CustomTask new.
	t1 description: 'B'.

	adresa1 := Adresa example1.

	do := DataObject new.
	do itemDef structureRef: adresa1. 

	t1 addDataOutputAssociation: do.

	t1 value: do itemDef structureRef.

	ee := EndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	process := NewWaveProcess name: 'Process 1' initialFlowElement: se.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample1 [
	"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
	| se ee t1 t2 t3 split1 engine process |

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
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.
	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ].
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.
	
	process := NewWaveProcess name: 'process1' initialFlowElement: se.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
	
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample10 [
"This example uses parallel gateway, where both paths are taken, and joined later."
| se ee t1 t2 t3 we split1 pj t4 engine pj2|
TKTDebugger disable.
se := StartEvent new.
se description: 'StartEvent'.

t1 := BaseTask new.
t1 description: 'A'.
t1 value: 200.

t2 := BaseTask new.
t2 description: 'B'.
t2 value: 250.

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

pj2 := ParallelJoin new.
pj2 description: 'PJ2'.


se addOutgoingEdge: split1.

split1 addOutgoingEdge: t1.
split1 addOutgoingEdge: t2. 
split1 addOutgoingEdge: t3.

t1 addOutgoingEdge: pj.
t2 addOutgoingEdge: pj.

pj addOutgoingEdge: t4.
t4 addOutgoingEdge: pj2.

t3 addOutgoingEdge: pj2.

pj2 addOutgoingEdge: ee.

engine := WaveEngine new.
we := WaveExecutor initialNode: se.
engine addExecutor: we.
engine startEngine.

]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample2 [
"This example uses parallel gateway, where both paths are taken, and joined later."
	| se ee t1 t2 t3 split1 pj t4 engine process |
	
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

	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.

	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ]. 
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].

	t2 addOutgoingEdge: pj.
	t3 addOutgoingEdge: pj.

	pj addOutgoingEdge: t4.
	t4 addOutgoingEdge: ee.

	process := NewWaveProcess name: 'process1' initialFlowElement: se.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample3 [
"This example uses two parallel gateways, where both paths are taken, and joined later."
	| start  psplit1 a b c d psplit2 pjoin1 e1 e2 f engine process |
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

	start addOutgoingEdge: psplit1.
	psplit1 addOutgoingEdge: a.
	psplit1 addOutgoingEdge: b.
	a addOutgoingEdge: pjoin1.
	pjoin1 addOutgoingEdge: f.
	b addOutgoingEdge: psplit2.
	psplit2 addOutgoingEdge: c.
	c addOutgoingEdge: pjoin1.
	psplit2 addOutgoingEdge: d.
	d addOutgoingEdge: e2.
	f addOutgoingEdge: e1.

	process := NewWaveProcess name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.

]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample4 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use task f as intermediate after Join 1."
	| start psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2c seqcpj1  seqps2d seqde2 engine process|
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

	process := NewWaveProcess name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample5 [
"This example uses two parallel gateways, one immediately after another where both paths are taken, and joined later. Doesnt use any task as intermediate after ps1 to ps2."
| start psplit1 a b c psplit2 pjoin1 e1 e2 engine 
seqeps1
seqps1a
seqps1ps2 
seqps2b 
seqps2c 
seqce2 
seqabpj1
seqapj1 
seqpj1e
process|

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

	process := NewWaveProcess name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample6 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use any task as intermediate after ps2 to pj1."
	| start  psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2d seqde2 process seqps2pj1 engine|
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

	process := NewWaveProcess name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample7 [
"This example uses two parallel gateways, where both paths are taken, and uses two joines. "
| start  psplit1 a b c  psplit2 pjoin1 e1 e2 process engine 
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

	process := NewWaveProcess name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample8IntermediateCatchEvent [
"This example uses intermediate event, where execution is paused for 40 seconds, and then completed. "
| se ee t1 we seq seq2 fh engine te |
	se := StartEvent new.
	se description: 'StartEvent'.
	
	t1 := IntermediateCatchEvent new.
	t1 description: 'Intermediate Catch Event'.
	
	te := TimerTempDefinition new.
	te timeDate: (DateAndTime now + 15 seconds).
	te repeat: false.
	te every: Duration zero.
	t1 addEventDefinition: te.
	
	ee := EndEvent new.
	ee description: 'EndEvent'.
	
	seq := Sequence source: se target: t1.
	seq2 := Sequence source: t1 target: ee.
	
	se addOutgoingFlow: seq.
	t1 addIncoming: seq addOutgoing: seq2.
	ee addIncomingFlow: seq2.
	
	fh := FlowHandler new.
	fh node: se.
	
	we := WaveExecutor new.
	we flowHandler: fh.
	engine := WaveEngine new. 
	engine addExecutor: we.
	engine startEngine.
"	20 seconds asDelay wait.
	engine stopEngine."
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample9BoundaryEvent [
"This example uses two parallel gateways, where both paths are taken, and uses two joines. "
	| se ee t1 t2 t3 we split1 engine be te |
TKTDebugger disable.
	se := StartEvent new.
	se description: 'StartEvent'.

	t1 := DialogTask new.
	t1 description: 'A'.
	
	be := BoundaryEvent new.
	be description: 'Boundzzzz'.
	be cancelActivity: true.
	
	te := TimerTempDefinition new.
	te timeDate: (DateAndTime now + 10 seconds).
	te repeat: false.
	te every: Duration zero.
	be addEventDefinition: te.

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

   se addOutgoingEdge: t1.
   t1 addOutgoingEdge: split1.

	be addOutgoingEdge: ee.
	t1 addBoundaryEvent: be.

   split1 addOutgoingEdge: t2 withCondition: [:x | x = true].
   split1 addOutgoingEdge: t3 withCondition: [:x | x = false].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.

	engine := WaveEngine new.
	we := WaveExecutor initialNode: se.
	engine addExecutor: we.
	engine startEngine.
	engine stopEngine.
]
