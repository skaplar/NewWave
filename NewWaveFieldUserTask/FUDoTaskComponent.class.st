Class {
	#name : #FUDoTaskComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'task',
		'taskForm'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> allFieldsGood [
	task formProperties do: [ :f | f type = 'date'  
		ifTrue: [ (self checkIfDateValid: f variable)
						ifFalse: [^ false] ]
		ifFalse:[
				f type = 'email'
			ifTrue: [ (self checkIfEmailValid: f variable)
						ifFalse: [^ false]  ]
			ifFalse: [ f variable isEmptyOrNil
							ifTrue: [^ false]]
			]
		
		].
	^ true
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> checkIfDateValid: aDate [
	^ (aDate isMemberOf: Date)
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> checkIfEmailValid: aEmail [
	^ (aEmail isMemberOf: WAEmailAddress )
]

{ #category : #hooks }
FUDoTaskComponent >> children [
	| desc |
	desc := OrderedCollection new.
	desc := (self taskForm collect: [ :each | (each children at: 1) magritteDescription ]).
	^ desc
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> goBack [
	self call: (FUAllUserTasksComponent new tasks: self session currentlyLoggedUser tasks)
]

{ #category : #initialization }
FUDoTaskComponent >> initialize [
	super initialize.
	self taskForm: (FUFormMagritte from: (self session currentlyLoggedUser tasks at: 1)).
	
]

{ #category : #rendering }
FUDoTaskComponent >> renderAcceptButton: html [
	html tbsSubmitButton 
		tbsPullRight;
		beSuccess;
		callback: [ self validateForm ];
		value: 'Finish task'.
	html tbsSubmitButton
		tbsPullRight;
		beSuccess;
		callback: [ self goBack ];
		value: 'Cancel'.
	
]

{ #category : #rendering }
FUDoTaskComponent >> renderContentOn: html [
	super renderContentOn: html.	
	html tbsContainer: [
		html heading: 'Please, fill up a form:'.
		html horizontalRule].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ 
			html tbsModalBody: 
				[html tbsForm: [
					"self renderTaskForm: html."
					self halt.
					html render: self taskForm.
					html tbsModalFooter: [ 
						self renderAcceptButton: html.
						]
					]
				].
				
				].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2.
]

{ #category : #rendering }
FUDoTaskComponent >> renderTaskForm: html [
	self task isNil 
		ifFalse: [ 
			self task formProperties do: [ :f | html render: ( FUFieldComponent new field: f ) ]
	 ]
]

{ #category : #accessing }
FUDoTaskComponent >> task [
	^ task
]

{ #category : #accessing }
FUDoTaskComponent >> task: aTask [
	task := aTask.	
	taskForm := (FUFormMagritte new fields: self task formProperties) asComponent 
]

{ #category : #accessing }
FUDoTaskComponent >> taskForm [
	^ taskForm 
]

{ #category : #accessing }
FUDoTaskComponent >> taskForm: aTaskForm [
	taskForm := aTaskForm 
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> validateForm [
	self allFieldsGood
		ifTrue: [ self task status: 'done'. self goBack ] 
]
