Class {
	#name : #TimerEventDefinition,
	#superclass : #EventDefinition,
	#instVars : [
		'timeDate',
		'timeDuration',
		'timeCycle',
		'endDate',
		'calendarName'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
TimerEventDefinition >> calendarName [
	^ calendarName
]

{ #category : #accessing }
TimerEventDefinition >> calendarName: aCalendarName [
	calendarName := aCalendarName
]

{ #category : #accessing }
TimerEventDefinition >> endDate [
	^ endDate
]

{ #category : #accessing }
TimerEventDefinition >> endDate: anEndDate [
	endDate := anEndDate
]

{ #category : #accessing }
TimerEventDefinition >> timeCycle [
	^ timeCycle
]

{ #category : #accessing }
TimerEventDefinition >> timeCycle: aTimeCycle [
	timeCycle := aTimeCycle
]

{ #category : #accessing }
TimerEventDefinition >> timeDate [
	^ timeDate
]

{ #category : #accessing }
TimerEventDefinition >> timeDate: aTimeDate [
	timeDate := aTimeDate
]

{ #category : #accessing }
TimerEventDefinition >> timeDuration [
	^ timeDuration
]

{ #category : #accessing }
TimerEventDefinition >> timeDuration: aTimeDuration [
	timeDuration := aTimeDuration
]
