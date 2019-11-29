"
I am a class that is used to execute certain types of tasks. I can contain common behavior for different types of tasks. I execute element (node) in the workflow, using waveExecutor. All my subclasses execute different types of nodes.


    Implementation Points
"
Class {
	#name : #ActivityEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ActivityEventBehavior >> performExecution: elemToExecute executor: wave [ 
	elemToExecute boundaryEvents do: [ :each | wave execute: each ].
]
