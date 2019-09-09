Class {
	#name : #FUDataFieldReport,
	#superclass : #MAReport,
	#instVars : [
		'formProperties'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUDataFieldReport class >> filteredDescriptionsFrom: aProperty [
	^ aProperty magritteDescription   
		select: [ :t | #(#variable) includes: t accessor selector ] 
		"^ aProperty magritteDescription
		select: [ :t | #(#variable) includes: t accessor selector ] "
]

{ #category : #'instance creation' }
FUDataFieldReport class >> from: aFormProperties [
	| form |
	
	form := self rows: aFormProperties.
	form formProperties: aFormProperties. 
	self halt.
	^ form yourself
]

{ #category : #'as yet unclassified' }
FUDataFieldReport class >> getDictionaryFromProps: aFormProperties [
	| dict counter temp|
	dict := Dictionary new.
			counter := 1.
	aFormProperties isNil 
		ifFalse: [ 
			aFormProperties do: [ :prop | 
				temp := prop magritteDescription  .
				dict at: counter put: temp .  
				counter := counter+1]
			 ].
	^ dict 
]

{ #category : #'as yet unclassified' }
FUDataFieldReport >> edit: aFormProperty [
	| componentForm |
	componentForm := self call: (self renderEditForm: aFormProperty ).
	componentForm ifNotNil: [ ]
]

{ #category : #accessing }
FUDataFieldReport >> formProperties [
	^ formProperties
]

{ #category : #accessing }
FUDataFieldReport >> formProperties: aFormProperties [
	formProperties := aFormProperties
]

{ #category : #'as yet unclassified' }
FUDataFieldReport >> goBack [
	self call: (FUTaskReport from: self session currentlyLoggedUser tasks )
]

{ #category : #rendering }
FUDataFieldReport >> renderButtonFinish: html [
	html tbsSubmitButton 
		tbsPullRight;
		beSuccess;
		callback: [ self validateForm ];
		value: 'Finish task'.
	html tbsSubmitButton
		tbsPullRight;
		beSuccess;
		callback: [ self goBack ];
		value: 'Cancel'.
	
]

{ #category : #rendering }
FUDataFieldReport >> renderContentOn: html [
	super renderContentOn: html.
	self halt.
	self renderRows: html.
	self renderButtonFinish: html.
]

{ #category : #'as yet unclassified' }
FUDataFieldReport >> renderEditForm: aFormProperty [
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

{ #category : #rendering }
FUDataFieldReport >> renderRows: html [
	|counter|
	self halt.
	counter := 1.
	self formProperties do: [ :field | html render: (field asComponent)]
]

{ #category : #'as yet unclassified' }
FUDataFieldReport >> validateForm [
	self session currentTask status: 'done'. 
	self goBack 
]
