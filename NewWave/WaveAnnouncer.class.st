Class {
	#name : #WaveAnnouncer,
	#superclass : #Announcement,
	#instVars : [
		'parameter'
	],
	#category : #'NewWave-Announcers'
}

{ #category : #'instance creation' }
WaveAnnouncer class >> with: anObject [
	^self new 
		parameter: anObject
]

{ #category : #accessing }
WaveAnnouncer >> parameter [
	^ parameter
]

{ #category : #accessing }
WaveAnnouncer >> parameter: aParameter [
	parameter := aParameter
]
