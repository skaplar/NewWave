Class {
	#name : #ExampleAnnouncer,
	#superclass : #Announcement,
	#instVars : [
		'parameter'
	],
	#category : #'NewWave-Announcers'
}

{ #category : #'instance creation' }
ExampleAnnouncer class >> with: anObject [
	^self new 
		parameter: anObject
]

{ #category : #accessing }
ExampleAnnouncer >> parameter [
	^ parameter
]

{ #category : #accessing }
ExampleAnnouncer >> parameter: aParameter [
	parameter := aParameter
]
