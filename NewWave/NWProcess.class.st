Class {
	#name : #NWProcess,
	#superclass : #NWElement,
	#instVars : [
		'name',
		'dataObjects',
		'flowElementList',
		'initialFlowElement',
		'variables'
	],
	#category : #'NewWave-Core'
}

{ #category : #'as yet unclassified' }
NWProcess class >> id: anId name: aName initialFlowElement: anElement [
	^ self new 
		id: anId
		name: aName;
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
NWProcess >> name [
	^ name
]

{ #category : #accessing }
NWProcess >> name: anObject [
	name := anObject
]
