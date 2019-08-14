Class {
	#name : #TimerTempDefinition,
	#superclass : #EventDefinition,
	#instVars : [
		'timeDate',
		'repeat',
		'every'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
TimerTempDefinition >> every [
	^ every
]

{ #category : #accessing }
TimerTempDefinition >> every: anEvery [
	every := anEvery
]

{ #category : #accessing }
TimerTempDefinition >> repeat [ 
	^ repeat
]

{ #category : #accessing }
TimerTempDefinition >> repeat: aRepeat [
	repeat := aRepeat
]

{ #category : #accessing }
TimerTempDefinition >> timeDate [
	^ timeDate
]

{ #category : #accessing }
TimerTempDefinition >> timeDate: aTimeDate [
	timeDate := aTimeDate
]
