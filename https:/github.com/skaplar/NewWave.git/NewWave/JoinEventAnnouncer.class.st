Class {
	#name : #JoinEventAnnouncer,
	#superclass : #Announcement,
	#category : #'NewWave-Announcers'
}

{ #category : #'instance creation' }
JoinEventAnnouncer class >> with: anObject [
	^ self new 
		parameter: anObject 
]
