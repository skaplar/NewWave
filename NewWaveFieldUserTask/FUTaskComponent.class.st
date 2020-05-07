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
	self task className1 ifNil: [ ^ nil ].
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
			callback: [ self answer: false ];
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
	| newValue json nWClassDecsription |
	
	self component ifNotNil: [ :tmpComponent |
		tmpComponent validate 
			ifFalse: [ ^nil ]."show validation message"
		newValue := tmpComponent save model.
		nWClassDecsription := (NWClassDescriptionGenerator dataObject: newValue) createClassDescription.
	] ifNil: [ 
		nWClassDecsription := NewWaveDOClassDescription new.
	].
	
	"self component validate 
		ifFalse: [ ^nil ].
	newValue := self component save model."
	
	"nWClassDecsription := (NWClassDescriptionGenerator dataObject: newValue) createClassDescription."
	nWClassDecsription processName: task processName.
	nWClassDecsription processId: task processId.
	nWClassDecsription processInstanceId: task processInstanceId.
	nWClassDecsription taskName: task taskName.
	nWClassDecsription taskDescription: task taskDescription.
	nWClassDecsription userName: task userName.
	nWClassDecsription groupName: task groupName.
	nWClassDecsription taskId: task taskId.
	FUCommitTaskServer new commitTask: (NWClassJSONExporter new exportOneNWClassDescriptionToJSON: nWClassDecsription).
	"OVO SAM DODAO DA ZAVRSIM CALLBACK"
	self answer: true.
]

{ #category : #accessing }
FUTaskComponent >> task [
	^ task
]

{ #category : #accessing }
FUTaskComponent >> task: anObject [
	task := anObject
]
