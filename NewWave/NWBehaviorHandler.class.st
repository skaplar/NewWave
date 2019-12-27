"
I am a class tha returns behavior for the executing of certain elements.

    Instance Variables
	behaviors:		<Dictionary>


    Implementation Points
"
Class {
	#name : #NWBehaviorHandler,
	#superclass : #Object,
	#instVars : [
		'behaviors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #initialization }
NWBehaviorHandler >> behaviors [
	^ behaviors
]

{ #category : #initialization }
NWBehaviorHandler >> behaviors: anObject [
	behaviors := anObject
]

{ #category : #initialization }
NWBehaviorHandler >> initialize [
	super initialize.
	self behaviors:  {
			(#NWStartEvent -> NWStartEventBehavior new) .
			(#NWBaseTask -> NWTaskEventBehavior new).
			(#NWEndEvent -> NWEndEventBehavior new).
			(#ExclusiveGateway -> NWExclusiveGatewayBehavior new).
			(#ParallelGateway -> NWParallelGatewayBehavior new).
			(#NWParallelJoin -> NWParallelJoinBehavior new).
			(#NWNullNode -> NWNullNodeBehavior new).
			(#NWCustomTask -> NWCustomTaskEventBehavior new).
			(#NWFieldUserTask -> NWFieldUserTaskEventBehavior new).
			(#UserTask -> NWUserTaskEventBehavior new).
			(#NWIntermediateCatchEvent -> NWIntermediateCatchEventBehavior new).
			(#NWBoundaryEvent -> NWBoundaryEventBehavior new).} asDictionary 
]
