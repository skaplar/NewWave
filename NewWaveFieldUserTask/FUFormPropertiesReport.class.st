Class {
	#name : #FUFormPropertiesReport,
	#superclass : #MAReport,
	#instVars : [
		'report',
		'formProperties'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUFormPropertiesReport class >> filteredDescriptionsFrom: aProperty [
	^ aProperty magritteDescription
]

{ #category : #'instance creation' }
FUFormPropertiesReport class >> from: aFormProperties [
	| tmp1 tmp3 |
	tmp1 := self rows: aFormProperties description: (self filteredDescriptionsFrom: aFormProperties anyOne).
	tmp1 formProperties: aFormProperties.
	tmp3 := MACommandColumn new.
	tmp3
		addCommandOn: tmp1 selector: #finishTask: text: 'Finish task'.
	tmp1 addColumn: tmp3 yourself.
	^ tmp1
]

{ #category : #accessing }
FUFormPropertiesReport >> formProperties [
	^ formProperties
]

{ #category : #accessing }
FUFormPropertiesReport >> formProperties: aFormProperties [
	formProperties := aFormProperties
]

{ #category : #rendering }
FUFormPropertiesReport >> renderContentOn: html [
	super renderContentOn: html
]
