Class {
	#name : #JoinEventAnnouncer,
	#superclass : #Announcement,
	#category : #'NewWave-Example'
}

{ #category : #'instance creation' }
JoinEventAnnouncer class >> with: anObject [
	^ self new 
		parameter: anObject 
]
