Class {
	#name : #FieldsUserTask,
	#superclass : #UserTask,
	#category : #'NewWave-Model'
}

{ #category : #initialization }
FieldsUserTask >> initialize [ 
	super initialize.
	self initializeProps.
]

{ #category : #initialization }
FieldsUserTask >> initializeProps [

| p1 p2 |

p1 := FormProperty new.
p1 name: 'firstName'.
p1 type: 'string'.
p1 variable: 'x'.

p2 := FormProperty new.
p2 name: 'lastName'.
p2 type: 'string'.
p2 variable: 'y'.

formProperties add: p1.
formProperties add: p2.


]
