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
FUTask >> status [ 
	^ status
]

{ #category : #accessing }
FUTask >> status: aString [
	status := aString
]
