Class {
	#name : #ActivityEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ActivityEventBehavior >> performExecution: elemToExecute executor: wave [ 
	'Pozovem se ' logCr.
	elemToExecute boundaryEvents do: [ :each | wave execute: each ].
]
