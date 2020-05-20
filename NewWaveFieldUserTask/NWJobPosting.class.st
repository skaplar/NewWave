Class {
	#name : #NWJobPosting,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'qualifications',
		'reviewed'
	],
	#category : #'NewWaveFieldUserTask-Entities'
}

{ #category : #examples }
NWJobPosting class >> example1 [ 
	| tmp |
	tmp := self new.
	tmp id: '1'.
	tmp description: ''.
	tmp qualifications: ''.
	tmp reviewed: false.
	^ tmp
]

{ #category : #accessing }
NWJobPosting >> description [
	^ description
]

{ #category : #accessing }
NWJobPosting >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NWJobPosting >> id [
	^ id
]

{ #category : #accessing }
NWJobPosting >> id: anObject [
	id := anObject
]

{ #category : #accessing }
NWJobPosting >> qualifications [
	^ qualifications
]

{ #category : #accessing }
NWJobPosting >> qualifications: anObject [
	qualifications := anObject
]

{ #category : #accessing }
NWJobPosting >> reviewed [
	^ reviewed
]

{ #category : #accessing }
NWJobPosting >> reviewed: anObject [
	reviewed := anObject
]
