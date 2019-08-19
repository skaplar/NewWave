Class {
	#name : #FUDoTaskComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'fields'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

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
		bePrimary;
		callback: [ self validateForm ];
		value: 'Finish task'.
	
	html tbsSubmitButton
		tbsPullRight;
		bePrimary;
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
			self renderAcceptButton: html].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
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
	
]
