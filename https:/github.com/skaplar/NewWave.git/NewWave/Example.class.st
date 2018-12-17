Class {
	#name : #Example,
	#superclass : #Object,
	#instVars : [
		'abc'
	],
	#category : #NewWave
}

{ #category : #accessing }
Example class >> optionAt [
	^ self value
]

{ #category : #accessing }
Example class >> optionAt: aKey [
	^ self value
]

{ #category : #accessing }
Example >> abc: value [
abc := value
]

{ #category : #evaluating }
Example >> ispis [
	^ abc.
]

{ #category : #evaluating }
Example >> value [
	^ 15 factorial
]
