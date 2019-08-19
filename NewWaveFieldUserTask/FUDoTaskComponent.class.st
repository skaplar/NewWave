Class {
	#name : #FUDoTaskComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'fields',
		'showError'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> allFieldsGood [
	fields do: [ :f | f variable isEmptyOrNil 
		ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
FUDoTaskComponent >> errorMessage [
	^ 'All fields can not be empty'
]

{ #category : #comparing }
FUDoTaskComponent >> errorOccurred [
	showError := true
]

{ #category : #accessing }
FUDoTaskComponent >> fields [ 
	^ fields
]

{ #category : #accessing }
FUDoTaskComponent >> fields: aFields [
	fields := aFields
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
	fields := OrderedCollection new
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
		with: [ self renderTaskForm: html.
			html horizontalRule.
			self renderAcceptButton: html.
			self renderErrorMessageOn: html].
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
	self fields isNil 
		ifFalse: [ 
			self fields do: [ :f | html render: ( FUFieldComponent new field: f ) ]
	 ]
]

{ #category : #'as yet unclassified' }
FUDoTaskComponent >> validateForm [
	self allFieldsGood
		ifTrue: [ self goBack ] 
		ifFalse: [ self errorOccurred ]
	
]
