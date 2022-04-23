"
I represent a join in the workflow. I must come after the parallel gateway. 
I am also blocking execution. Execution will wait until all incoming branches arrive at the join.  
"
Class {
	#name : #NWParallelJoin,
	#superclass : #NWGateway,
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWParallelJoin >> ctype [
	^ #NWParallelJoin
]
