"
This class represents an user. It's variables are:
	- username (a string that identifies user)
	- password (a string to confirm user's identity)
	- tasks (a collection of tasks that user has to do)
Logged user can check a list of tasks, and choose which one he wants to do.
"
Class {
	#name : #FUUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'tasks',
		'groupName'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'instance creation' }
FUUser class >> username: aUsername password: aPassword [
	^ self new 
		username: aUsername;
		password: aPassword;
		yourself
]

{ #category : #'instance creation' }
FUUser class >> username: aUsername password: aPassword groupName: aGroupName [
	^ self new 
		username: aUsername;
		password: aPassword;
		groupName: aGroupName;
		yourself
]

{ #category : #adding }
FUUser >> addTask: aTask [
	self tasks add: aTask
]

{ #category : #operations }
FUUser >> getWaitingTasks [
	^ self tasks select: [ :t | t isWaiting  ]
]

{ #category : #operations }
FUUser >> getWaitingTasksSize [
	| waitingTasks |
	waitingTasks := OrderedCollection new.
	waitingTasks := self tasks select: [ :t | t status = 'waiting' ].
	^ waitingTasks size
]

{ #category : #accessing }
FUUser >> groupName [
	^ groupName
]

{ #category : #accessing }
FUUser >> groupName: anObject [
	groupName := anObject
]

{ #category : #initialization }
FUUser >> initialize [
	super initialize.
	tasks := OrderedCollection new
]

{ #category : #accessing }
FUUser >> password [ 
	^ password
]

{ #category : #accessing }
FUUser >> password: aPassword [
	password := aPassword 
]

{ #category : #accessing }
FUUser >> tasks [ 
	^ tasks
]

{ #category : #accessing }
FUUser >> tasks: aTaskList [
	tasks := aTaskList
]

{ #category : #accessing }
FUUser >> username [ 
	^ username
]

{ #category : #accessing }
FUUser >> username: aUsername [
	username := aUsername 
]
