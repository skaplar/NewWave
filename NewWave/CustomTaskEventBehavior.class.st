"
I am a class that is used to execute CustomTask.
"
Class {
	#name : #CustomTaskEventBehavior,
	#superclass : #ActivityEventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
CustomTaskEventBehavior >> performExecution: elemToExecute executor: wave [
	super performExecution: elemToExecute executor: wave.
	"Ovo treba recimo dopuniti da ode na endpoint i onda tu da se preuzme, pokupi itd..."
	"wave engine server element: elemToExecute."
	wave engine server addTask: elemToExecute user: 'default'.
	wave engine engineAnnouncer
		when: WaveAnnouncer
		do: [ :a | 
			a parameter traceCr.
			wave taskResult: a parameter.
			wave engine server removeTask: elemToExecute user: 'default'.
			wave tryToExecuteNext: elemToExecute ].
	elemToExecute value
]
