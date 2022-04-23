"
I represent a Timer Event. I can be used with to schedule events in the workflow.

    Instance Variables
	calendarName:		<Object>
	endDate:		<Object>
	timeCycle:		<Object>
	timeDate:		<Object>
	timeDuration:		<Object>


    Implementation Points
"
Class {
	#name : #NWTimerEventDefinition,
	#superclass : #NWEventDefinition,
	#instVars : [
		'timeDate',
		'timeDuration',
		'timeCycle',
		'endDate',
		'calendarName'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #accessing }
NWTimerEventDefinition >> calendarName [
	^ calendarName
]

{ #category : #accessing }
NWTimerEventDefinition >> calendarName: aCalendarName [
	calendarName := aCalendarName
]

{ #category : #accessing }
NWTimerEventDefinition >> endDate [
	^ endDate
]

{ #category : #accessing }
NWTimerEventDefinition >> endDate: anEndDate [
	endDate := anEndDate
]

{ #category : #accessing }
NWTimerEventDefinition >> timeCycle [
	^ timeCycle
]

{ #category : #accessing }
NWTimerEventDefinition >> timeCycle: aTimeCycle [
	timeCycle := aTimeCycle
]

{ #category : #accessing }
NWTimerEventDefinition >> timeDate [
	^ timeDate
]

{ #category : #accessing }
NWTimerEventDefinition >> timeDate: aTimeDate [
	timeDate := aTimeDate
]

{ #category : #accessing }
NWTimerEventDefinition >> timeDuration [
	^ timeDuration
]

{ #category : #accessing }
NWTimerEventDefinition >> timeDuration: aTimeDuration [
	timeDuration := aTimeDuration
]
