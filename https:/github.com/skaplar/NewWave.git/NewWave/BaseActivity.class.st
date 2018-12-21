Class {
	#name : #BaseActivity,
	#superclass : #Node,
	#instVars : [
		'elements'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
BaseActivity >> addElement: anElement [
	elements add: anElement
]

{ #category : #initialization }
BaseActivity >> ctype [
	^ #BaseActivity
]

{ #category : #initialization }
BaseActivity >> initialize [

	super initialize.
	elements := OrderedCollection new.
]
