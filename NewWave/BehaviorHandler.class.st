"
I am a class tha returns behavior for the executing of certain elements.

    Instance Variables
	behaviors:		<Dictionary>


    Implementation Points
"
Class {
	#name : #BehaviorHandler,
	#superclass : #Object,
	#instVars : [
		'behaviors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #initialization }
BehaviorHandler >> behaviors [
	^ behaviors
]

{ #category : #initialization }
BehaviorHandler >> behaviors: anObject [
	behaviors := anObject
]

{ #category : #initialization }
BehaviorHandler >> initialize [
	super initialize.
	self behaviors:  {
			(#StartEvent -> StartEventBehavior new) .
			(#BaseTask -> TaskEventBehavior new).
			(#EndEvent -> EndEventBehavior new).
			(#ExclusiveGateway -> ExclusiveGatewayBehavior new).
			(#ParallelGateway -> ParallelGatewayBehavior new).
			(#ParallelJoin -> ParallelJoinBehavior new).
			(#NullNode -> NullNodeBehavior new).
			(#CustomTask -> CustomTaskEventBehavior new).
			(#FieldUserTask -> FieldUserTaskEventBehavior new).
			(#UserTask -> UserTaskEventBehavior new).
			(#IntermediateCatchEvent -> IntermediateCatchEventBehavior new).
			(#BoundaryEvent -> BoundaryEventBehavior new).} asDictionary 
]
