"
I am a parallel gateway. I am used to indicate that the execution will be split among multiple branches.
"
Class {
	#name : #NWParallel,
	#superclass : #NWGateway,
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWParallel >> ctype [
	^ #ParallelGateway
]
