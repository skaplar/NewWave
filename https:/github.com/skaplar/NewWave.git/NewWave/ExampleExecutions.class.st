Class {
	#name : #ExampleExecutions,
	#superclass : #Object,
	#category : #'NewWave-Example'
}

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample1 [
"This example uses exclusive gateway, where one of the two paths is taken based on the user input."
| se ee t1 t2 t3 we seq seq2 seq3 seqexc seqexc1 seqexc2 split1 fh |

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

seqexc1 := Sequence source: split1 target: t2 condition: true. 
seqexc2 := Sequence source: split1 target: t3 condition: false.

seq2 := Sequence source: t2 target: ee.
seq3 := Sequence source: t3 target: ee.

se addOutgoingFlow: seq.

t1 addIncoming: seq addOutgoing: seqexc. 
split1 addIncoming: seqexc addOutgoingList: (OrderedCollection with: seqexc1  with: seqexc2). 

t2 addIncoming: seqexc1  addOutgoing: seq2.
t3 addIncoming: seqexc1  addOutgoing: seq3.

ee addIncomingFlow: seq2.
ee addIncomingFlow: seq3.

fh := FlowHandler new.
fh node: se.
we := WaveExecutor new.
we flowHandler: fh.

we tryToExecuteNext.
we waveAnnouncer announce: StartAnnouncer new.
]

{ #category : #'as yet unclassified' }
ExampleExecutions >> startExample2 [
"This example uses parallel gateway, where both paths are taken, and joined later."
| se ee t1 t2 t3 we seq seq2 seq3 seqexc seqexc1 seqexc2 split1 fh pj seq4 seq5 t4|
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

seqexc1 := Sequence source: split1 target: t2 condition: true. 
seqexc2 := Sequence source: split1 target: t3 condition: false.

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

fh := FlowHandler new.
fh node: se.
we := WaveExecutor new.
we flowHandler: fh.

we tryToExecuteNext.
we waveAnnouncer announce: StartAnnouncer new.
]
