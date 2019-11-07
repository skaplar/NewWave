Class {
	#name : #FUSession,
	#superclass : #WASession,
	#instVars : [
		'currentlyLoggedUser',
		'currentTask'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #accessing }
FUSession >> currentTask [
	^ currentTask
]

{ #category : #accessing }
FUSession >> currentTask: aCurrentTask [
	currentTask := aCurrentTask
]

{ #category : #accessing }
FUSession >> currentlyLoggedUser [
	^ currentlyLoggedUser 
]

{ #category : #accessing }
FUSession >> currentlyLoggedUser: aUser [
	currentlyLoggedUser := aUser 
]

{ #category : #testing }
FUSession >> isLogged [
	^ self currentlyLoggedUser notNil

]

{ #category : #initialization }
FUSession >> reset [
	currentlyLoggedUser := nil.
	self requestContext redirectTo: self application url.
	self unregister.

]
