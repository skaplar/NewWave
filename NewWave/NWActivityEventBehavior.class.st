"
I am a class that is used to execute certain types of tasks. I can contain common behavior for different types of tasks. I execute element (node) in the workflow, using waveExecutor. All my subclasses execute different types of nodes.


    Implementation Points
"
Class {
	#name : #NWActivityEventBehavior,
	#superclass : #NWEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWActivityEventBehavior >> performExecution: elemToExecute executor: waveExecutor [ 
	elemToExecute boundaryEvents do: [ :each | waveExecutor execute: each ].
]
