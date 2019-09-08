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
]

{ #category : #'instance creation' }
FUFormPropertiesReport class >> from: aFormProperties [
	| form props children|
	form := MAContainerComponent new.
	form setChildren: (self getDictionaryFromProps: aFormProperties).
	form setDescription: MAPriorityContainer new.
	self halt.
	^ form yourself  
	
"	form := (aFormProperties at:1) asComponent.
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

{ #category : #'as yet unclassified' }
FUFormPropertiesReport >> validateForm [
	self session currentTask status: 'done'. 
	self goBack 
]
