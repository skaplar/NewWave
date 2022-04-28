"
I am also a timer definition element. However I have a much simpler API.

Example:

	te := NWTimerTempDefinition new.
	te timeDate: (DateAndTime now + 10 seconds).
	te repeat: false.
	te every: Duration zero. 
	
	Duration zero means that we don't want repetition.

"
Class {
	#name : #NWTimerTempDefinition,
	#superclass : #NWEventDefinition,
	#instVars : [
		'timeDate',
		'repeat',
		'every'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWTimerTempDefinition >> every [
	^ every
]

{ #category : #accessing }
NWTimerTempDefinition >> every: anEvery [
	every := anEvery
]

{ #category : #accessing }
NWTimerTempDefinition >> repeat [ 
	^ repeat
]

{ #category : #accessing }
NWTimerTempDefinition >> repeat: aRepeat [
	repeat := aRepeat
]

{ #category : #accessing }
NWTimerTempDefinition >> timeDate [
	^ timeDate
]

{ #category : #accessing }
NWTimerTempDefinition >> timeDate: aTimeDate [
	timeDate := aTimeDate
]
