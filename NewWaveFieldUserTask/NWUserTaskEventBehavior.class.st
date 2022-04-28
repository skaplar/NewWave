"
I am a class that is used to execute CustomTask.
"
Class {
	#name : #NWUserTaskEventBehavior,
	#superclass : #NWActivityEventBehavior,
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
NWUserTaskEventBehavior >> extractNWClassDecription: elemToExecute [
	"If the task doesn't have dataObject associated with it, we can't pull NewWaveDOClassDescription
	from it. So we create a new one, which will be shown just as Finis Task on the client.
	Probably that's not what the user wants, but should be supported anyway."
	
	| dataObject |
	elemToExecute dataOutputAssociations isEmpty ifTrue: [ ^ NewWaveDOClassDescription new ].
	dataObject := elemToExecute dataOutputAssociations first.
	dataObject valuedDataObject 
		ifNil: [ ^ NewWaveDOClassDescription new ]
		ifNotNil: [ :nwClassDescription  | 
"			nwClassDescription taskName: elemToExecute name.
			nwClassDescription taskDescription: elemToExecute description.
			nwClassDescription userName: elemToExecute user username.
			nwClassDescription groupName: elemToExecute group groupName.
			nwClassDescription taskId: elemToExecute id."
			^ nwClassDescription ]
	
]

{ #category : #accessing }
NWUserTaskEventBehavior >> performExecution: elemToExecute executor: waveExecutor [
	| taskWrapper |
	super performExecution: elemToExecute executor: waveExecutor.
	
	"If no group or user assigned we should stop the execution."
	(self taskHasUserOrGroup: elemToExecute) 
		ifFalse: [ self error: 'UserTask has no user or group assigned, which is invalid' ].
		
	taskWrapper := self extractNWClassDecription: elemToExecute. 
	waveExecutor processHandler addTaskToServer: elemToExecute nwClassDescription: taskWrapper.
	waveExecutor processHandler engineAnnouncer
		when: WaveAnnouncer
		do: [ :a |
			
			a parameter traceCr.
			waveExecutor taskResult: a parameter.
			
			"Need a way to update original data if needed."
			elemToExecute dataOutputAssociations isNotEmpty ifTrue: 
				[ elemToExecute dataOutputAssociations first valuedDataObject: a parameter ].
			waveExecutor processHandler engine server removeTask: taskWrapper.
			
			"Ovo bih trebao mnogo bolje da vidim kako da resim, odnosno da prebacim announcer na process handler da znam tacno koji ce mi reagovati kad se pozove."
			waveExecutor processHandler engineAnnouncer unsubscribe: self.
			waveExecutor tryToExecuteNext: elemToExecute 
		].
	elemToExecute value
]
