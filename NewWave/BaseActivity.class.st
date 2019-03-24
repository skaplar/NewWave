Class {
	#name : #BaseActivity,
	#superclass : #Node,
	#instVars : [
		'elements',
		'boundaryEvents'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
BaseActivity >> addBoundaryEvent: aBoundaryEvent [
	boundaryEvents add: aBoundaryEvent 
]

{ #category : #initialization }
BaseActivity >> addElement: anElement [
	elements add: anElement
]

{ #category : #initialization }
BaseActivity >> boundaryEvents [
	^ boundaryEvents 
]

{ #category : #initialization }
BaseActivity >> ctype [
	^ #BaseActivity
]

{ #category : #initialization }
BaseActivity >> initialize [

	super initialize.
	elements := OrderedCollection new.
	boundaryEvents := OrderedCollection new.
]
