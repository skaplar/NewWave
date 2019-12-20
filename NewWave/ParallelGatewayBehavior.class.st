"
I am a class that splits the execution into two or more processes.
"
Class {
	#name : #ParallelGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelGatewayBehavior >> performExecution: elemToExecute executor: waveExecutor [
	"Here we send sequence to executor, that lead up to the node that has to be performed, after the gateway. From the sequence we get the target node and execute it."
	elemToExecute outgoingFlows do: [ :each | waveExecutor processHandler addSubExecutor: each ].
	"This is basically to say to stop every subexecutor, after it finishes, but to leave main one"
	waveExecutor processHandler mainExecutor = waveExecutor ifFalse: [ 
		waveExecutor worker stop.
	].
	
	
	
]
