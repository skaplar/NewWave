Class {
	#name : #StartEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
StartEventBehavior >> performExecution: elemToExecute executor: wave [
	wave waveAnnouncer subscribe: ExampleAnnouncer 
		do: [ wave execute:  (wave flowHandler getNextElement) ]
		"do: [ wave execute:  (wave seqHandler getElementToExecute2) ]"
]
