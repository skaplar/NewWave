Class {
	#name : #FUDODescriptionSelector,
	#superclass : #Object,
	#instVars : [
		'descriptionDictionary'
	],
	#category : #'NewWaveFieldUserTask-ObjectPreparator'
}

{ #category : #accessing }
FUDODescriptionSelector >> descriptionDictionary [
	^ descriptionDictionary
]

{ #category : #accessing }
FUDODescriptionSelector >> descriptionDictionary: anObject [
	descriptionDictionary := anObject
]

{ #category : #'as yet unclassified' }
FUDODescriptionSelector >> initialize [
	super initialize.
	self descriptionDictionary: {
			('ByteString' -> MAStringDescription new) .
			('SmallInteger' -> MANumberDescription new). } asDictionary 
]
