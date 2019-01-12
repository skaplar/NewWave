Class {
	#name : #JoinEventAnnouncer,
	#superclass : #Announcement,
	#instVars : [
		'parameter',
		'executor'
	],
	#category : #'NewWave-Announcers'
}

{ #category : #'instance creation' }
JoinEventAnnouncer class >> with: anObject [
	^ self new 
		parameter: anObject 
]

{ #category : #'instance creation' }
JoinEventAnnouncer class >> with: anObject executor: anExecutor [
	^ self new 
		parameter: anObject;
		executor: anExecutor. 
]

{ #category : #accessing }
JoinEventAnnouncer >> executor [
	^ executor
]

{ #category : #accessing }
JoinEventAnnouncer >> executor: aParameter [
	executor := aParameter
]

{ #category : #accessing }
JoinEventAnnouncer >> parameter [
	^ parameter
]

{ #category : #accessing }
JoinEventAnnouncer >> parameter: aParameter [
	parameter := aParameter
]
