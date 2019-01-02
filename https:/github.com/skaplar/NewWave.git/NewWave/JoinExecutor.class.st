"
I am an executor of one join, handled by JoinHandler. 
joinNode is the node on which join is performed.
We add the sequences to this instance as one branch completes. When all incoming brances complete, the join is finished.

    Instance Variables
	incSequences:		<OrderedCollection Sequence>
	joinNode:		<Node>


    Implementation Points
"
Class {
	#name : #JoinExecutor,
	#superclass : #Object,
	#instVars : [
		'joinNode',
		'incSequences'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
JoinExecutor >> addIncSequence: aSequence [
	incSequences add: aSequence
]

{ #category : #accessing }
JoinExecutor >> checkIsFinished [
	"Za sad samo proveravam velicinu, treba proveriti da li su to te sekvence"
	^ joinNode incomingFlows size = incSequences size.
]

{ #category : #accessing }
JoinExecutor >> incSequences [
	^ incSequences
]

{ #category : #accessing }
JoinExecutor >> initialize [ 
	super initialize.
	incSequences := OrderedCollection new.
]

{ #category : #accessing }
JoinExecutor >> joinNode [
	^ joinNode
]

{ #category : #accessing }
JoinExecutor >> joinNode: aJoinNode [
	joinNode := aJoinNode 
]
