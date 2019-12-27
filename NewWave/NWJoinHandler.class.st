"
I represent a class that handles joins in a subprocess. 
This class is created by the WaveExecutor.

Internal Representation and Key Implementation Points.

    Instance Variables
	joinExecutors:		<OrderedCollection JoinExecutor>
	context: <WaveExecutor]

    Implementation Points
"
Class {
	#name : #NWJoinHandler,
	#superclass : #Object,
	#instVars : [
		'joinExecutors',
		'context'
	],
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWJoinHandler class >> context: aContext [
	^ self new 
	context: aContext;
	yourself.
]

{ #category : #accessing }
NWJoinHandler >> addJoinExecutor: aJoinExecutor [
	joinExecutors add: aJoinExecutor 
]

{ #category : #accessing }
NWJoinHandler >> addSequenceToExecutors: aSequence [
	| jExecutor |
	jExecutor := joinExecutors select: [ :each | each joinNode = aSequence targetRef  ].
	jExecutor ifNotEmpty: [  
		| ex |
		ex := jExecutor first.
		ex addIncSequence: aSequence.
		^ ex.
	]  
	ifEmpty: [  
		| je |
		je := NWJoinExecutor new.
		je joinNode: aSequence targetRef.
		je addIncSequence: aSequence.
		self addJoinExecutor: je.
		^ je.
	]. 
]

{ #category : #accessing }
NWJoinHandler >> checkIsExecutorCompleted: jExecutor [
	"This is where I check if the executor has finished its part. All sequences have come together."

	jExecutor checkIsFinished
		ifTrue: [ 'Executor Completed' traceCr.
			^ true ]
		ifFalse: [ 'Executor Not completed' traceCr.
			^ false ]
]

{ #category : #accessing }
NWJoinHandler >> context [ 
	^ context
]

{ #category : #accessing }
NWJoinHandler >> context: aContext [
	context := aContext
]

{ #category : #accessing }
NWJoinHandler >> initialize [ 
	super initialize.
	joinExecutors := OrderedCollection new.
]

{ #category : #accessing }
NWJoinHandler >> joinExecutors [
	^ joinExecutors
]
