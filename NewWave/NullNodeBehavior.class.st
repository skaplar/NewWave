"
I am the node to be executed when there are no more nodes (end node).


    Implementation Points
"
Class {
	#name : #NullNodeBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NullNodeBehavior >> performExecution: elemToExecute executor: wave [
	"Worker stops it every time before this actually executes, but it's here for a precaution"
	'End of execution' logCr.
	
	
	
]
