Class {
	#name : #FULoggedUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'password'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'instance creation' }
FULoggedUser class >> username: username password: password [
	^ self new
		username: username;
		password: password;
		yourself

]

{ #category : #accessing }
FULoggedUser >> password [
	^ password


]

{ #category : #accessing }
FULoggedUser >> password: aPassword [
	password := SHA256 hashMessage: aPassword 


]

{ #category : #accessing }
FULoggedUser >> username [
	^ username 

]

{ #category : #accessing }
FULoggedUser >> username: anUsername [
	username := anUsername 

]
