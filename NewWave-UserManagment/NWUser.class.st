Class {
	#name : #NWUser,
	#superclass : #Object,
	#instVars : [
		'userId',
		'username',
		'password',
		'email',
		'firstname',
		'lastname'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #accessing }
NWUser >> email [
	 ^ email
]

{ #category : #accessing }
NWUser >> email: anEmail [
	email := anEmail 
]

{ #category : #accessing }
NWUser >> firstname [
	^firstname 
]

{ #category : #accessing }
NWUser >> firstname: aFristname [
	firstname := aFristname 
]

{ #category : #initialization }
NWUser >> initialize [
	super initialize.
	
]

{ #category : #accessing }
NWUser >> lastname [
	^lastname 
]

{ #category : #accessing }
NWUser >> lastname: aLastname [
	lastname := aLastname 
]

{ #category : #accessing }
NWUser >> password [ 
	^ password.
]

{ #category : #accessing }
NWUser >> password: aPassword [
	password := aPassword 
]

{ #category : #accessing }
NWUser >> userId [
	^ userId
]

{ #category : #accessing }
NWUser >> userId: anUserId [
	userId := anUserId
]

{ #category : #accessing }
NWUser >> username [ 
	^ username 
]

{ #category : #accessing }
NWUser >> username: anUsername [
	username := anUsername
]
