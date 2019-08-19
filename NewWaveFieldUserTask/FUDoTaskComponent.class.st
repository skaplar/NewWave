Class {
	#name : #FUDoTaskComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'task',
		'showError',
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUDoTaskComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

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

{ #category : #accessing }
FUDoTaskComponent >> component [
	^ component 
]

{ #category : #accessing }
FUDoTaskComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #accessing }
FUDoTaskComponent >> errorMessage [
	^ 'All fields can not be empty'
]

{ #category : #comparing }
FUDoTaskComponent >> errorOccurred [
	showError := true
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> goBack [
	self call: (FUAllUserTasksComponent new tasks: self session currentlyLoggedUser tasks)
]

{ #category : #testing }
FUDoTaskComponent >> hasError [
	^ showError ifNil: [ false ]
]

{ #category : #initialization }
FUDoTaskComponent >> initialize [
	super initialize.
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
					self renderTaskForm: html.
					html tbsModalFooter: [ 
						self renderAcceptButton: html.
						self renderErrorMessageOn: html
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
FUDoTaskComponent >> renderErrorMessageOn: html [
	self hasError ifTrue: [
		showError := false.
		html html: '<br><br>'.
		html tbsAlert   
		beDanger ;
		with: self errorMessage
	]
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
	task := aTask
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> validateForm [
	self allFieldsGood
		ifTrue: [ self task status: 'done'. self goBack ] 
		ifFalse: [ self errorOccurred ]
	
]
