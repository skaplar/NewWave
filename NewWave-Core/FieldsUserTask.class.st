Class {
	#name : #FieldsUserTask,
	#superclass : #NWFieldUserTask,
	#category : #'NewWave-Core-Model'
}

{ #category : #initialization }
FieldsUserTask >> initialize [ 
	super initialize.
	self initializeProps.
]

{ #category : #initialization }
FieldsUserTask >> initializeProps [

| p1 p2 |

p1 := NWFormProperty new.
p1 name: 'firstName'.
p1 type: 'string'.
p1 variable: 'Pera'.

p2 := NWFormProperty new.
p2 name: 'lastName'.
p2 type: 'string'.
p2 variable: 'Peric'.

formProperties add: p1.
formProperties add: p2.


]

{ #category : #initialization }
FieldsUserTask >> value [
	formProperties do: [ :x | x variable logCr. ].
	^ self complete.
]
