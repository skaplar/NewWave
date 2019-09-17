Class {
	#name : #PersistentProperty,
	#superclass : #VisibleProperty,
	#instVars : [
		'dentifier',
		'unique',
		'identity',
		'nullable',
		'mandatory'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #accessing }
PersistentProperty >> dentifier [
	^ dentifier
]

{ #category : #accessing }
PersistentProperty >> dentifier: anObject [
	dentifier := anObject
]

{ #category : #accessing }
PersistentProperty >> identity [
	^ identity
]

{ #category : #accessing }
PersistentProperty >> identity: anObject [
	identity := anObject
]

{ #category : #accessing }
PersistentProperty >> mandatory [
	^ mandatory
]

{ #category : #accessing }
PersistentProperty >> mandatory: anObject [
	mandatory := anObject
]

{ #category : #accessing }
PersistentProperty >> nullable [
	^ nullable
]

{ #category : #accessing }
PersistentProperty >> nullable: anObject [
	nullable := anObject
]

{ #category : #accessing }
PersistentProperty >> unique [
	^ unique
]

{ #category : #accessing }
PersistentProperty >> unique: anObject [
	unique := anObject
]
