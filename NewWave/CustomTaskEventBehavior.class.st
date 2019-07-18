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
	wave engine engineAnnouncer subscribe: WaveAnnouncer
		do: [ :a | a parameter logCr. wave taskResult: a parameter. wave tryToExecuteNext: elemToExecute.].
	elemToExecute value.
]
