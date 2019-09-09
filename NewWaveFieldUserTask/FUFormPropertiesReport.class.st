Class {
	#name : #FUFormPropertiesReport,
	#superclass : #MAReport,
	#instVars : [
		'formProperties'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUFormPropertiesReport class >> filteredDescriptionsFrom: aProperty [
	^ aProperty magritteDescription   
		select: [ :t | #(#variable) includes: t accessor selector ] 
		"^ aProperty magritteDescription
		select: [ :t | #(#variable) includes: t accessor selector ] "
]

{ #category : #'instance creation' }
FUFormPropertiesReport class >> from: aFormProperties [
	| form fields |
	fields := self getDictionaryFromProps: aFormProperties.
	form := self rows: fields description: (self filteredDescriptionsFrom: fields anyOne).
	form formProperties: aFormProperties. "
	form setDescription: MAPriorityContainer new.
	form setChildren: (self getDictionaryFromProps: aFormProperties)."
	^ form yourself  
	
	"form := aFormProperties asComponent.
	self halt.
	props := self getDictionaryFromProps: aFormProperties.
	form setChildren: nil.
	form setChildren: props.
	self halt.
	^ form yourself"
]

{ #category : #'as yet unclassified' }
FUFormPropertiesReport class >> getDictionaryFromProps: aFormProperties [
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

{ #category : #'as yet unclassified' }
FUFormPropertiesReport >> goBack [
	self call: (FUTaskReport from: self session currentlyLoggedUser tasks )
]

{ #category : #rendering }
FUFormPropertiesReport >> renderButtonFinish: html [
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
FUFormPropertiesReport >> renderContentOn: html [
	super renderContentOn: html.
	"self renderRows: html."
	self renderButtonFinish: html.
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

{ #category : #rendering }
FUFormPropertiesReport >> renderRows: html [
	|counter|
	counter := 1.
	self rows do: [ :row | 
		html render: (formProperties at: counter) asComponent. 
		counter := counter + 1 ]
]

{ #category : #'as yet unclassified' }
FUFormPropertiesReport >> validateForm [
	self session currentTask status: 'done'. 
	self goBack 
]
