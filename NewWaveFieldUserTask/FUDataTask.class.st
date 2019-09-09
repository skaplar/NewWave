Class {
	#name : #FUDataTask,
	#superclass : #Object,
	#instVars : [
		'taskID',
		'userID',
		'details',
		'dataFields'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #adding }
FUDataTask >> addDataField: aField [
	self dataFields add: aField
]

{ #category : #accessing }
FUDataTask >> dataFields [
	^ dataFields
]

{ #category : #accessing }
FUDataTask >> dataFields: aDataFields [
	dataFields := aDataFields 
]

{ #category : #'as yet unclassified' }
FUDataTask >> descriptionContainer [
	<magritteContainer>
	| tmp2 |
	tmp2 := super descriptionContainer.
	tmp2 componentRenderer: MATableRenderer.
	^ tmp2 yourself
]

{ #category : #'as yet unclassified' }
FUDataTask >> descriptionDetails [
	<magritteDescription>
	^ MAStringDescription new 
		accessor: #details;
		label: 'Details';
		priority: 200;
		yourself
]

{ #category : #'as yet unclassified' }
FUDataTask >> descriptionTaskID [
	<magritteDescription>
	^ MAStringDescription new 
		accessor: #taskID;
		label: 'ID';
		priority: 100;
		yourself
]

{ #category : #accessing }
FUDataTask >> details [
	^ details
]

{ #category : #accessing }
FUDataTask >> details: aDetails [
	details := aDetails 
]

{ #category : #initialization }
FUDataTask >> initialize [
	super initialize.
	self dataFields: OrderedCollection new
]

{ #category : #accessing }
FUDataTask >> taskID [
	^ taskID
]

{ #category : #accessing }
FUDataTask >> taskID: aTaskID [
	taskID := aTaskID
]

{ #category : #accessing }
FUDataTask >> userID [
	^ userID
]

{ #category : #accessing }
FUDataTask >> userID: aUserID [
	userID := aUserID
]
