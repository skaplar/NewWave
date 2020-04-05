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
ExampleExecutions class >> returnAcmeManagement [

	^ NWUserManagement 				  						   
		pathToUsers:'/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/users.json'
		pathToGroups: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/groups.json'
		pathToMemberships: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/membership.json'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnExampleProcess1 [
	"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
	| se ee t1 t2 t3 split1 process |

	se := NWStartEvent new.
	se description: #NWStartEvent.

	t1 := DialogTask new.
	t1 description: 'A'.

	t2 := NWBaseTask new.
	t2 description: 'B'.
	t2 value: 200.

	t3 := NWBaseTask new.
	t3 description: 'C'.
	t3 value: 300.

	ee := NWEndEvent new.
	ee description: #NWEndEvent.

	split1 := NWExclusive new.
	split1 description: 'Split1'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.
	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ].
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.
	
	process := NWProcess id: '1' name: 'process2' initialFlowElement: se.
	process id: 1.
	
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess [
	
	| se t1 adresa1 do ee process|

	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWCustomTask new.
	t1 description: 'B'.
	t1 name: 'Taskerino'.

	adresa1 := Adresa example1.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example'.

	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	process := NWProcess id: '1' name: 'Process 1' initialFlowElement: se.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess2 [
	
	| se t1 adresa1 do ee process|

	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWCustomTask new.
	t1 description: 'BA'.
	t1 name: 'Taskerinoa'.

	adresa1 := Adresa example2.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example2'.

	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	process := NWProcess id: '2' name: 'Process 2' initialFlowElement: se.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess3 [
	
	| se t1 adresa1 do ee process split1 t2 t3 |

	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWCustomTask new.
	t1 description: 'BA'.
	t1 name: 'Taskerinoa'.

	adresa1 := Adresa example1.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example2'.

	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.
	
	split1 := NWExclusive new.
	split1 description: 'Split1'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	t2 := NWBaseTask new.
	t2 description: 'B'.
	t2 value: 200.

	t3 := NWBaseTask new.
	t3 description: 'C'.
	t3 value: 300.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.
	split1 addOutgoingEdge: t2 withCondition: [ :x | x broj asNumber > 80 ].
	split1 addOutgoingEdge: t3 withCondition: [ :x | x broj asNumber <= 80].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.
	
	process := NWProcess id: '2' name: 'Process 2' initialFlowElement: se.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess4WithGroups [
"This is same as the first + groups"
	
	| se t1 adresa1 do ee process management |
										
	management := ExampleExecutions returnAcmeManagement.						
										
	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWCustomTask new.
	t1 id: '123456'.
	t1 description: 'B'.
	t1 name: 'Taskerino'.
	t1 group: (management findGroup: '1').
	"t1 user: (management findUser: '1')."

	adresa1 := Adresa example3.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example'.

	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	process := NWProcess id: '1' name: 'Process 1' initialFlowElement: se.
	process managementName: 'acme'.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnSimpleProcess5WithGroupsAndSplits [
"This is same as the first + groups"
	
	| se t1 adresa1 do ee process management |

	management := NWUserManagement 				  						   
										pathToUsers:'/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/users.json'
										pathToGroups: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/groups.json'
										pathToMemberships: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/membership.json'.
										
	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWCustomTask new.
	t1 id: '123456'.
	t1 description: 'B'.
	t1 name: 'Taskerino'.
	t1 group: (management findGroup: '1').
	"t1 user: (management findUser: '1')."

	adresa1 := Adresa example1.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example'.

	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	process := NWProcess id: '1' name: 'Process 1' initialFlowElement: se.
	process addDataObject: do.

	^ process
]

{ #category : #'as yet unclassified' }
ExampleExecutions class >> returnTwoDataObjects [

| oc t1 adresa1 adresa2 do do2 t2 exp |
	
oc := OrderedCollection new.

t1 := NWCustomTask new.
t1 description: 'A'.
t1 name: 'Taskerino filipino'.

adresa1 := Adresa example1.

do := NWDataObject new.
do itemDef structureRef: adresa1. 
do valuedDataObject: adresa1.


t1 addDataOutputAssociation: do.

t2 := NWCustomTask new.
t2 description: 'B'.
t2 name: 'Taskerino tajlandino'.

adresa2 := Adresa example2.

do2 := NWDataObject new.
do2 itemDef structureRef: adresa2. 
do2 valuedDataObject: adresa2.
do2 name: 'Adresa22 example22'.
t2 addDataOutputAssociation: do2.

oc add: t1.
oc add: t2.

exp := NewWaveArrayDOJSONExporter nwClassDescriptions: oc.

^ (NewWaveArrayDOJSONImporter new importFromJSON: exp exportDOToJSON) asOrderedCollection.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample1 [
	"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
	| se ee t1 t2 t3 split1 engine process |

	se := NWStartEvent new.
	se description: #NWStartEvent.

	t1 := DialogTask new.
	t1 description: 'A'.

	t2 := NWBaseTask new.
	t2 description: 'B'.
	t2 value: 200.

	t3 := NWBaseTask new.
	t3 description: 'C'.
	t3 value: 300.

	ee := NWEndEvent new.
	ee description: #NWEndEvent.

	split1 := NWExclusive new.
	split1 description: 'Split1'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.
	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ].
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].
	
	t2 addOutgoingEdge: ee.
	t3 addOutgoingEdge: ee.
	
	process := NWProcess id: '1' name: 'process1' initialFlowElement: se.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
	
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample10 [
"This example uses parallel gateway, where both paths are taken, and joined later."
| se ee t1 t2 t3 we split1 pj t4 engine pj2|
TKTDebugger disable.
se := NWStartEvent new.
se description: #NWStartEvent.

t1 := NWBaseTask new.
t1 description: 'A'.
t1 value: 200.

t2 := NWBaseTask new.
t2 description: 'B'.
t2 value: 250.

t3 := NWBaseTask new.
t3 description: 'C'.
t3 value: 300.

t4 := NWBaseTask new.
t4 description: 'D'.
t4 value: 400.

ee := NWEndEvent new.
ee description: #NWEndEvent.

split1 := NWParallel new.
split1 description: 'Split1'.

pj := NWParallelJoin new.
pj description: #NWParallelJoin.

pj2 := NWParallelJoin new.
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
we := NWExecutor initialNode: se.
engine addExecutor: we.
engine startEngine.

]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample2 [
"This example uses parallel gateway, where both paths are taken, and joined later."
	| se ee t1 t2 t3 split1 pj t4 engine process |
	
	TKTDebugger disable.
	se := NWStartEvent new.
	se description: #NWStartEvent.

	t1 := NWBaseTask new.
	t1 description: 'B'.
	t1 value: 200.

	t2 := DialogTask new.
	t2 description: 'A'.

	t3 := NWBaseTask new.
	t3 description: 'C'.
	t3 value: 300.

	t4 := NWBaseTask new.
	t4 description: 'D'.
	t4 value: 400.

	ee := NWEndEvent new.
	ee description: #NWEndEvent.

	split1 := NWParallel new.
	split1 description: 'Split1'.

	pj := NWParallelJoin new.
	pj description: #NWParallelJoin.

	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: split1.

	split1 addOutgoingEdge: t2 withCondition: [ :x | x = true ]. 
	split1 addOutgoingEdge: t3 withCondition: [ :x | x = false ].

	t2 addOutgoingEdge: pj.
	t3 addOutgoingEdge: pj.

	pj addOutgoingEdge: t4.
	t4 addOutgoingEdge: ee.

	process := NWProcess id: '1' name: 'process1' initialFlowElement: se.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample3 [
"This example uses two parallel gateways, where both paths are taken, and joined later."
	| start  psplit1 a b c d psplit2 pjoin1 e1 e2 f engine process |
	TKTDebugger disable.
	start := NWStartEvent new.
	start description: #NWStartEvent.

	psplit1 := NWParallel new.
	psplit1 description: 'Parallel Split 1'.

	a := NWBaseTask new.
	a description: 'A'.
	a value: 'A has been performed'.

	b := NWBaseTask new.
	b description: 'B'.
	b value: 'B has been performed'.

	c := NWBaseTask new.
	c description: 'C'.
	c value: 'C has been performed'.

	d := NWBaseTask new.
	d description: 'D'.
	d value: 'D has been performed'.

	f := NWBaseTask new.
	f description: 'F'.
	f value: 'F has been performed'.

	pjoin1 := NWParallelJoin new.
	pjoin1 description: 'Parallel Join 1'.

	psplit2 := NWParallel new.
	psplit2 description: 'Parallel Split 2'.

	e1 := NWEndEvent new.
	e1 description: 'End Event 1'.

	e2 := NWEndEvent new.
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

	process := NWProcess id: '1' name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.

]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample4 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use task f as intermediate after Join 1."
	| start psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2c seqcpj1  seqps2d seqde2 engine process|
	TKTDebugger disable.
	start := NWStartEvent new.
	start description: #NWStartEvent.

	psplit1 := NWParallel new.
	psplit1 description: 'Parallel Split 1'.

	a := NWBaseTask new.
	a description: 'A'.
	a value: 'A has been performed'.

	b := NWBaseTask new.
	b description: 'B'.
	b value: 'B has been performed'.

	c := NWBaseTask new.
	c description: 'C'.
	c value: 'C has been performed'.

	d := NWBaseTask new.
	d description: 'D'.
	d value: 'D has been performed'.

	pjoin1 := NWParallelJoin new.
	pjoin1 description: 'Parallel Join 1'.

	psplit2 := NWParallel new.
	psplit2 description: 'Parallel Split 2'.

	e1 := NWEndEvent new.
	e1 description: 'End Event 1'.
	
	e2 := NWEndEvent new.
	e2 description: 'End Event 2'.
	
	seqeps1 := NWSequence source: start target: psplit1.
	seqps1a := NWSequence source: psplit1  target: a.
	seqps1b := NWSequence source: psplit1  target: b.
	seqapj1 := NWSequence source: a target: pjoin1.
	seqpj1e := NWSequence source: pjoin1  target: e1.
	seqbps2 := NWSequence source: b target: psplit2.
	seqps2c := NWSequence source: psplit2 target: c.
	seqcpj1 := NWSequence source: c target: pjoin1.
	seqps2d := NWSequence source: psplit2  target: d.
	seqde2 := NWSequence source: d target: e2.

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

	process := NWProcess id: '1' name: 'process1' initialFlowElement: start.
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
	start := NWStartEvent new.
	start description: #NWStartEvent.

	psplit1 := NWParallel new.
	psplit1 description: 'Parallel Split 1'.

	a := NWBaseTask new.
	a description: 'A'.
	a value: 'A has been performed'.

	b := NWBaseTask new.
	b description: 'B'.
	b value: 'B has been performed'.

	c := NWBaseTask new.
	c description: 'C'.
	c value: 'C has been performed'.

	pjoin1 := NWParallelJoin new.
	pjoin1 description: 'Parallel Join 1'.

	psplit2 := NWParallel new.
	psplit2 description: 'Parallel Split 2'.

	e1 := NWEndEvent new.
	e1 description: 'End Event 1'.

	e2 := NWEndEvent new.
	e2 description: 'End Event 2'.

	seqeps1 := NWSequence source: start target: psplit1.
	seqps1a := NWSequence source: psplit1  target: a.
	seqps1ps2 := NWSequence source: psplit1  target: psplit2.
	seqps2b := NWSequence source: psplit2 target: b.
	seqps2c := NWSequence source: psplit2 target: c.
	seqce2 := NWSequence source: c target: e2. 
	seqabpj1 := NWSequence source: b target: pjoin1.
	seqapj1 := NWSequence source: a  target: pjoin1.
	seqpj1e := NWSequence source: pjoin1 target: e1. 


	start addOutgoingFlow: seqeps1.
	psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1ps2).

	a addIncoming: seqps1a addOutgoing: seqapj1.
	b addIncoming: seqps2b addOutgoing: seqabpj1.
	pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqabpj1 ) addOutgoing: seqpj1e.

	psplit2 addIncoming: seqps1ps2  addOutgoingList: (OrderedCollection with: seqps2b  with: seqps2c ).

	c addIncoming: seqps2c  addOutgoing: seqce2.

	e1 addIncomingFlow: seqpj1e.
	e2 addIncomingFlow: seqce2.

	process := NWProcess id: '1' name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample6 [
"This example uses two parallel gateways, where both paths are taken, and joined later. Doesnt use any task as intermediate after ps2 to pj1."
	| start  psplit1 a b c d psplit2 pjoin1 e1 e2 seqeps1 seqps1a seqps1b seqapj1 seqpj1e seqbps2 seqps2d seqde2 process seqps2pj1 engine|
	TKTDebugger disable.
	start := NWStartEvent new.
	start description: #NWStartEvent.

	psplit1 := NWParallel new.
	psplit1 description: 'Parallel Split 1'.

	a := NWBaseTask new.
	a description: 'A'.
	a value: 'A has been performed'.

	b := NWBaseTask new.
	b description: 'B'.
	b value: 'B has been performed'.

	c := NWBaseTask new.
	c description: 'C'.
	c value: 'C has been performed'.

	d := NWBaseTask new.
	d description: 'D'.
	d value: 'D has been performed'.

	pjoin1 := NWParallelJoin new.
	pjoin1 description: 'Parallel Join 1'.

	psplit2 := NWParallel new.
	psplit2 description: 'Parallel Split 2'.

	e1 := NWEndEvent new.
	e1 description: 'End Event 1'.

	e2 := NWEndEvent new.
	e2 description: 'End Event 2'.

	seqeps1 := NWSequence source: start target: psplit1.
	seqps1a := NWSequence source: psplit1  target: a.
	seqps1b := NWSequence source: psplit1  target: b.
	seqapj1 := NWSequence source: a target: pjoin1.
	seqpj1e := NWSequence source: pjoin1  target: e1.
	seqbps2 := NWSequence source: b target: psplit2.
	seqps2pj1 := NWSequence source: psplit2 target: pjoin1.

	seqps2d := NWSequence source: psplit2  target: d.
	seqde2 := NWSequence source: d target: e2.

	start addOutgoingFlow: seqeps1.
	psplit1 addIncoming: seqeps1 addOutgoingList: (OrderedCollection with: seqps1a with: seqps1b).

	a addIncoming: seqps1a addOutgoing: seqapj1.
	b addIncoming: seqps1b addOutgoing: seqbps2.
	pjoin1 addIncomingList: (OrderedCollection with: seqapj1 with: seqps2pj1 ) addOutgoing: seqpj1e.
	
	psplit2 addIncoming: seqbps2  addOutgoingList: (OrderedCollection with: seqps2pj1 with: seqps2d).

	d addIncoming: seqps2d  addOutgoing: seqde2.

	e1 addIncomingFlow: seqpj1e.
	e2 addIncomingFlow: seqde2.

	process := NWProcess id: '1' name: 'process1' initialFlowElement: start.
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
	start := NWStartEvent new.
	start description: #NWStartEvent.

	psplit1 := NWParallel new.
	psplit1 description: 'Parallel Split 1'.

	a := NWBaseTask new.
	a description: 'A'.
	a value: 'A has been performed'.

	b := NWBaseTask new.
	b description: 'B'.
	b value: 'B has been performed'.

	c := NWBaseTask new.
	c description: 'C'.
	c value: 'C has been performed'.

	pjoin1 := NWParallelJoin new.
	pjoin1 description: 'Parallel Join 1'.

	pjoin2 := NWParallelJoin new.
	pjoin2 description: 'Parallel Join 2'.

	psplit2 := NWParallel new.
	psplit2 description: 'Parallel Split 2'.

	e1 := NWBaseTask new.
	e1 description: 'E1 '.
	e1 value: 'E1 has been performed!'.

	e2 := NWBaseTask  new.
	e2 description: 'E2'.
	e2 value: 'E2 has been performed!'.

	ee := NWEndEvent new.
	ee description: 'End Event ee'.

	seqeps1 := NWSequence source: start target: psplit1.
	seqps1a := NWSequence source: psplit1  target: a.
	seqps1ps2 := NWSequence source: psplit1  target: psplit2.
	seqps2b := NWSequence source: psplit2 target: b.
	seqps2c := NWSequence source: psplit2 target: c.
	seqce2 := NWSequence source: c target: e2. 
	seqabpj1 := NWSequence source: b target: pjoin1.
	seqapj1 := NWSequence source: a  target: pjoin1.
	seqpj1e := NWSequence source: pjoin1 target: e1. 
	seqe1pj2 := NWSequence source: e1 target: pjoin2.
	seqe2pj2 := NWSequence source: e2 target:  pjoin2.
	seqpj2ee := NWSequence source: pjoin2  target: ee. 


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

	process := NWProcess id: '1' name: 'process1' initialFlowElement: start.
	engine := WaveEngine new.
	engine addProcess: process name: 'process1' .
	engine startProcess: 'process1'.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample8IntermediateCatchEvent [
"This example uses intermediate event, where execution is paused for 40 seconds, and then completed. "
| se ee t1 we seq seq2 fh engine te |
	se := NWStartEvent new.
	se description: #NWStartEvent.
	
	t1 := NWIntermediateCatchEvent new.
	t1 description: 'Intermediate Catch Event'.
	
	te := NWTimerTempDefinition new.
	te timeDate: (DateAndTime now + 15 seconds).
	te repeat: false.
	te every: Duration zero.
	t1 addEventDefinition: te.
	
	ee := NWEndEvent new.
	ee description: #NWEndEvent.
	
	seq := NWSequence source: se target: t1.
	seq2 := NWSequence source: t1 target: ee.
	
	se addOutgoingFlow: seq.
	t1 addIncoming: seq addOutgoing: seq2.
	ee addIncomingFlow: seq2.
	
	fh := NWFlowHandler new.
	fh node: se.
	
	we := NWExecutor new.
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
	se := NWStartEvent new.
	se description: #NWStartEvent.

	t1 := DialogTask new.
	t1 description: 'A'.
	
	be := NWBoundaryEvent new.
	be description: 'Boundzzzz'.
	be cancelActivity: true.
	
	te := NWTimerTempDefinition new.
	te timeDate: (DateAndTime now + 10 seconds).
	te repeat: false.
	te every: Duration zero.
	be addEventDefinition: te.

	t2 := NWBaseTask new.
	t2 description: 'B'.
	t2 value: 200.

	t3 := NWBaseTask new.
	t3 description: 'C'.
	t3 value: 300.

	ee := NWEndEvent new.
	ee description: #NWEndEvent.

	split1 := NWExclusive new.
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
	we := NWExecutor initialNode: se.
	engine addExecutor: we.
	engine startEngine.
	engine stopEngine.
]
