"
I am the node to be executed when there are no more nodes (end node).


    Implementation Points
"
Class {
	#name : #NWNullNodeBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWNullNodeBehavior >> performExecution: elemToExecute executor: wave [
	"Worker stops it every time before this actually executes, but it's here for a precaution"

	'End of execution' traceCr
]
