"
I represent a Process. 

    Instance Variables
	dataObjects:		Array of DataObjects
	flowElementList:		List of all elements that are part of the flow.
	initialFlowElement:		Initial flow element. Usually a StartEvent.
	managementName:		Name of the corresponding management.
	name:		Process name.
	processInstanceId:		Instance id of the process.
	variables:		Additional variables.


    Implementation Points
"
Class {
	#name : #NWProcess,
	#superclass : #NWElement,
	#instVars : [
		'name',
		'dataObjects',
		'flowElementList',
		'initialFlowElement',
		'variables',
		'processInstanceId',
		'managementName'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #'as yet unclassified' }
NWProcess class >> id: anId name: aName initialFlowElement: anElement [
	^ self new 
		id: anId;
		name: aName;
		processInstanceId: (1 to: 1000000) atRandom asString;
		initialFlowElement: anElement;
		yourself
]

{ #category : #accessing }
NWProcess >> addDataObject: aDataObject [
	dataObjects add: aDataObject
]

{ #category : #accessing }
NWProcess >> addFlowElement: aFlowElement [
	flowElementList add: aFlowElement
]

{ #category : #accessing }
NWProcess >> dataObjects [
	^ dataObjects
]

{ #category : #accessing }
NWProcess >> dataObjects: anObject [
	dataObjects := anObject
]

{ #category : #accessing }
NWProcess >> flowElementList [
	^ flowElementList
]

{ #category : #accessing }
NWProcess >> flowElementList: anObject [
	flowElementList := anObject
]

{ #category : #accessing }
NWProcess >> initialFlowElement [
	^ initialFlowElement
]

{ #category : #accessing }
NWProcess >> initialFlowElement: anObject [
	initialFlowElement := anObject
]

{ #category : #initialization }
NWProcess >> initialize [ 
	
	super initialize.
	dataObjects := OrderedCollection new.
	flowElementList := OrderedCollection new.
	variables := Dictionary new.
]

{ #category : #accessing }
NWProcess >> managementName [
	^ managementName
]

{ #category : #accessing }
NWProcess >> managementName: anObject [
	managementName := anObject
]

{ #category : #accessing }
NWProcess >> name [
	^ name
]

{ #category : #accessing }
NWProcess >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NWProcess >> processInstanceId [
	^ processInstanceId
]

{ #category : #accessing }
NWProcess >> processInstanceId: anObject [
	processInstanceId := anObject
]
