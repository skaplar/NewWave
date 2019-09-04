Class {
	#name : #FUFormPropertiesReport,
	#superclass : #MAReport,
	#instVars : [
		'formProperties'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'as yet unclassified' }
FUFormPropertiesReport class >> filteredDescriptionsFrom: aProperty [
	^ aProperty magritteDescription
		select: [ :t | #(#variable #name ) includes: t accessor selector ] 
]

{ #category : #'instance creation' }
FUFormPropertiesReport class >> from: aFormProperties [
	| form editing |
	form := (self rows: aFormProperties description: (self filteredDescriptionsFrom: aFormProperties anyOne)).
	form formProperties: aFormProperties.
	editing := MACommandColumn new.
	editing
		addCommandOn: form selector: #edit: text: '+';
		yourself.
	form addColumn: editing yourself.
	^ form 
]

{ #category : #'as yet unclassified' }
FUFormPropertiesReport >> edit: aFormProperty [
	| componentForm |
	componentForm := self call: (self renderEditForm: aFormProperty ).
	componentForm ifNotNil: [ ]
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

{ #category : #'as yet unclassified' }
FUFormPropertiesReport >> renderEditForm: aFormProperty [
	| form |
	form := aFormProperty asComponent.
	form
		addDecoration:
			(MAFormDecoration
				buttons:
					{(#save -> 'OK').
					(#cancel -> 'Cancel')}).
	^ form yourself
]
