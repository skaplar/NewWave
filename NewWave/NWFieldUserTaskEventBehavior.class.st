Class {
	#name : #NWFieldUserTaskEventBehavior,
	#superclass : #NWActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
NWFieldUserTaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	super performExecution: elemToExecute executor: waveExecutor.
	"Ovo treba recimo dopuniti da ode na endpoint i onda tu da se preuzme, pokupi itd..."
	"wave engine server element: elemToExecute."
	waveExecutor processHandler server addTask: elemToExecute user: 'default'. 
	waveExecutor processHandler engineAnnouncer 
		when: WaveAnnouncer
		do: [ :a | 
			waveExecutor taskResult: a parameter. 
			waveExecutor processHandler server removeTask: elemToExecute user: 'default'.
			waveExecutor tryToExecuteNext: elemToExecute.
	].
	elemToExecute value.
]
