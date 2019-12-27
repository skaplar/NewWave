Class {
	#name : #NWTimerTempDefinition,
	#superclass : #NWEventDefinition,
	#instVars : [
		'timeDate',
		'repeat',
		'every'
	],
	#category : #'NewWave-Core'
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
