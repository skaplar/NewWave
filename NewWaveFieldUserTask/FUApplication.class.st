Class {
	#name : #FUApplication,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
FUApplication class >> createDemo [

self current
	addUser: (FUUser username: 'user1' password: (SHA256 hashMessage: 'user1') groupName: 'admin');
	addUser: (FUUser username: 'user2' password: (SHA256 hashMessage: 'user2') groupName: 'users');
	addUser: (FUUser username: 'business1' password: (SHA256 hashMessage: 'business1') groupName: 'businessDept');
	addUser: (FUUser username: 'hr1' password: (SHA256 hashMessage: 'hr1') groupName: 'humanResources').
]

{ #category : #accessing }
FUApplication class >> current [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]

]

{ #category : #'class initialization' }
FUApplication class >> initialize [
	self reset

]

{ #category : #initialization }
FUApplication class >> reset [
	uniqueInstance := nil
]

{ #category : #adding }
FUApplication >> addTask: aTask [
	| aUser |
	aUser := self findUser: (aTask userID).
	aUser isNil 
		ifTrue: [ ^ 'BAD REQUEST' ].
	aUser addTask: aTask.
	^ 'OK'
	
]

{ #category : #adding }
FUApplication >> addUser: anUser [
	self users at: (anUser username asString) put: anUser. 
	^ 'OK'
]

{ #category : #'as yet unclassified' }
FUApplication >> createUserWithUsername: aUsername andPassword: aPassword [
	| newUser |
	newUser := FUUser new
		username: aUsername;
		password: aPassword;
		tasks: OrderedCollection new.
	self addUser: newUser.
	^ newUser 
		
	
]

{ #category : #'as yet unclassified' }
FUApplication >> findUser: aUserID [
	| user |
	user := users at: aUserID ifAbsent: nil.
	^ user
]

{ #category : #operations }
FUApplication >> getUserWithUsername: aUsername andPassword: aPassword [
	| user userList|
	user := users at: aUsername ifAbsent: nil.
	user isNil 
		ifTrue: [^ nil].
	user password = aPassword
		ifTrue: [^ user]
		ifFalse: [^ nil]
]

{ #category : #initialization }
FUApplication >> initialize [
	super initialize.
	users := Dictionary new
]

{ #category : #testing }
FUApplication >> isUsernameUnique: aUsername [
	| user |
	user := users at: aUsername ifAbsent: nil.
	^ user isNil
	
]

{ #category : #accessing }
FUApplication >> users [
	^ users 
]

{ #category : #accessing }
FUApplication >> users: anUsers [
	users := anUsers 
]
