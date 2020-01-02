Class {
	#name : #FUTaskComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'report',
		'component',
		'task'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUTaskComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #'as yet unclassified' }
FUTaskComponent >> buildComponent [
	| taskObject |
	taskObject := (NewWaveMagritteContainerCreator dataObject: self task) createEntity.
	^ taskObject asComponent.

]

{ #category : #accessing }
FUTaskComponent >> component [
	^ component ifNil: [ 
		component := self buildComponent ]
]

{ #category : #accessing }
FUTaskComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #initialization }
FUTaskComponent >> initialize [
	| taksskss |
	super initialize.
	"taksskss := self session currentlyLoggedUser tasks."
	" Ovo je bilo da fetchujem pojedinacne zadatke sa servera "
	"taksskss := FUGetTaskServer new
		getTask: self session currentlyLoggedUser username."
	taksskss isNil
		ifFalse:
			[ "self report: (FUTaskReport from: (self session currentlyLoggedUser tasks))" self task: taksskss ]
]

{ #category : #rendering }
FUTaskComponent >> renderAcceptButton: html [
	html space.
	html tbsContainer: [
		html tbsSubmitButton 
			beSuccess;
			callback: [ self sendResult ];
			value: 'Finish task'.
		html tbsSubmitButton
			beSuccess;
			callback: [ self goBack ];
			value: 'Cancel'.
	].
	
]

{ #category : #rendering }
FUTaskComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Choose task and do it:'.
		html horizontalRule].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
	html tbsColumn
		with: [ 
			html tbsModalBody: [
				html tbsForm: [	
					html render: self component.
					self renderAcceptButton: html ].
				]
			].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2.  
]

{ #category : #accessing }
FUTaskComponent >> report [
	^ report
]

{ #category : #accessing }
FUTaskComponent >> report: arg1 [
	report := arg1
]

{ #category : #'as yet unclassified' }
FUTaskComponent >> sendResult [
	| newValue json |
	self component validate 
		ifFalse: [ ^nil ]."show validation message"
	newValue := self component save model.
	"json := (FUDOJSONExporter dataObject: newValue) exportDOToJSON."
	json := (NewWaveDOProcessJSONExporter dataObject: newValue processName: task processName processId: task processId processInstanceId: task processInstanceId) exportDOToJSON.
	FUCommitTaskServer new commitTask: json.
	"OVO SAM DODAO DA ZAVRSIM CALLBACK"
	self answer: task.
]

{ #category : #accessing }
FUTaskComponent >> task [
	^ task
]

{ #category : #accessing }
FUTaskComponent >> task: anObject [
	task := anObject
]
