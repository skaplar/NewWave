"
I am a class that splits the execution into two or more processes.
"
Class {
	#name : #ParallelGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelGatewayBehavior >> performExecution: elemToExecute executor: wave [
	| rez aRunner |
	aRunner := TKTNewProcessTaskRunner new.
	rez := elemToExecute outgoingFlows do: [ :each | | se | se := SubExecutor initialNode: each targetRef  parentExecutor: wave. se startSubExecutor ].
	wave waveAnnouncer subscribe: JoinCompletedEventAnnouncer 
	do: [ 
		wave worker schedule: [ wave tryToExecuteNext. ].
		"wave subExecutors do: [ :each | each executor worker stop  ]."
	].
	
	
	
	
]
