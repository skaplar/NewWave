Class {
	#name : #NewWaveProcess,
	#superclass : #Element,
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
NewWaveProcess class >> name: aName initialFlowElement: anElement [
	^ self new 
		name: aName;
		initialFlowElement: anElement;
		yourself
]

{ #category : #accessing }
NewWaveProcess >> addDataObject: aDataObject [
	dataObjects add: aDataObject
]

{ #category : #accessing }
NewWaveProcess >> addFlowElement: aFlowElement [
	flowElementList add: aFlowElement
]

{ #category : #accessing }
NewWaveProcess >> dataObjects [
	^ dataObjects
]

{ #category : #accessing }
NewWaveProcess >> dataObjects: anObject [
	dataObjects := anObject
]

{ #category : #accessing }
NewWaveProcess >> flowElementList [
	^ flowElementList
]

{ #category : #accessing }
NewWaveProcess >> flowElementList: anObject [
	flowElementList := anObject
]

{ #category : #accessing }
NewWaveProcess >> initialFlowElement [
	^ initialFlowElement
]

{ #category : #accessing }
NewWaveProcess >> initialFlowElement: anObject [
	initialFlowElement := anObject
]

{ #category : #initialization }
NewWaveProcess >> initialize [ 
	
	super initialize.
	dataObjects := OrderedCollection new.
	flowElementList := OrderedCollection new.
	variables := Dictionary new.
]

{ #category : #accessing }
NewWaveProcess >> name [
	^ name
]

{ #category : #accessing }
NewWaveProcess >> name: anObject [
	name := anObject
]
