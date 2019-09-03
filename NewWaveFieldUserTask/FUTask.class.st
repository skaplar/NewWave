"
Repsresents a task that is given to a user. It is represented with one variable: 
	- status (respresents if task is waiting to be done or it is done)
This class is a subclass of FieldUserTask.

"
Class {
	#name : #FUTask,
	#superclass : #FieldUserTask,
	#instVars : [
		'status'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #accessing }
FUTask class >> status: aStatus [
	^ self new 
		status: aStatus;
		yourself
]

{ #category : #'acessing-magritte' }
FUTask >> descriptionAnnouncer [
	<magritteDescription>
	^ MAStringDescription new 
		label: 'Announcer';
		priority: 200;
		accessor: #announcer
]

{ #category : #'acessing-magritte' }
FUTask >> descriptionResult [
	<magritteDescription>
	^ MAStringDescription new 
		label: 'Result';
		priority: 400;
		accessor: #result
]

{ #category : #'acessing-magritte' }
FUTask >> descriptionStatus [
	<magritteDescription>
	^ MAStringDescription new 
		label: 'status';
		priority: 100;
		accessor: #status
]

{ #category : #'acessing-magritte' }
FUTask >> descriptionValue [
	<magritteDescription>
	^ MAStringDescription new 
		label: 'Value';
		priority: 300;
		accessor: #value
]

{ #category : #initialization }
FUTask >> initialize [
	super initialize.
	status := 'waiting' " -done- is a value when task is NO more waiting/activ"
]

{ #category : #testing }
FUTask >> isWaiting [
	^ self status='waiting'
]

{ #category : #accessing }
FUTask >> status [ 
	^ status
]

{ #category : #accessing }
FUTask >> status: aString [
	status := aString
]
