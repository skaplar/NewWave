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
| p1 p2 p3 p4 |
p1 := FormProperty new.
p1 name: 'firstName'.
p1 type: 'string'.
p1 variable: 'Pera'.

p2 := FormProperty new.
p2 name: 'lastName'.
p2 type: 'string'.
p2 variable: 'Peric'.

p3 := FormProperty new.
p3 name: 'dateOfBirth'.
p3 type: 'date'.
p3 variable: '01-01-2000'.

p4 := FormProperty new.
p4 name: 'height'.
p4 type: 'decimal'.
p4 variable: '175.5'.


self current
	addUser: ((FUUser username: 'user1' password: 'user1' ) 
		addTask: (((FUTask status: 'waiting') value: 'test'; result: 'test result') addProperty: p1; 			addProperty: p2; addProperty: p3; addProperty: p4);
		addTask: (((FUTask status: 'waiting') value: 'test2'; result: 'test2 result') addProperty: p3; 			addProperty: p4) );
	addUser: ((FUUser username: 'user2' password: 'user2' ) 
		addTask: (((FUTask status: 'done') value: 'test3'; result: 'test3 result') addProperty: p1; 			addProperty: p2);
		addTask: (((FUTask status: 'waiting') value: 'test4'; result: 'test4 result') addProperty: p1) )
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
FUApplication >> addUser: anUser [
	^ self users add: anUser
]

{ #category : #initialization }
FUApplication >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #testing }
FUApplication >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
FUApplication >> users [
	^ users 
]

{ #category : #accessing }
FUApplication >> users: anUsers [
	users := anUsers 
]
