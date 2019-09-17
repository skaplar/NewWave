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
		select: [ :t | #(#result) includes: t accessor selector ]  
		"^ aProperty magritteDescription
		select: [ :t | #(#variable) includes: t accessor selector ] "
]

{ #category : #'instance creation' }
FUDataFieldReport class >> from: aFormProperties [

	| form editing|
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
FUDataFieldReport class >> getDictionaryFromProps: aFormProperties [
	| dict counter temp|
	dict := Dictionary new.
			counter := 1.
	aFormProperties isNil 
		ifFalse: [ 
			aFormProperties do: [ :prop | 
				temp := prop asComponent.
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
	self rows do: [ :row | html render: row asComponent ].
]

{ #category : #'rendering-table' }
FUDataFieldReport >> renderTableBodyOn: html [ 
	self visible isEmpty 
		ifTrue: [ 
			html tableRow
				class: 'empty';
				with: [ 
					html tableData
						colSpan: self visibleColumns size;
						with: self tableEmpty ] ]
		ifFalse: [
			self visible keysAndValuesDo: [ :index :row | 
				html tableRow
					class: (self rowStyleForNumber: index);
					with: [ "html render: (row asComponent) 
						"self visibleColumns do: [ :col | 
							col 
								renderCell: row 
								index: index
								on: html ] ] ] ]
]

{ #category : #'as yet unclassified' }
FUDataFieldReport >> validateForm [
self halt.
	self goBack 
]
