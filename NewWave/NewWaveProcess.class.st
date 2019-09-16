Class {
	#name : #NewWaveProcess,
	#superclass : #Element,
	#instVars : [
		'name',
		'dataObjects',
		'flowElementList'
	],
	#category : #'NewWave-Core'
}

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

{ #category : #initialization }
NewWaveProcess >> initialize [ 
	
	super initialize.
	dataObjects := OrderedCollection new.
	flowElementList := OrderedCollection new.
]

{ #category : #accessing }
NewWaveProcess >> name [
	^ name
]

{ #category : #accessing }
NewWaveProcess >> name: anObject [
	name := anObject
]
