Class {
	#name : #FUFieldComponent,
	#superclass : #WAComponent,
	#instVars : [
		'field'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #accessing }
FUFieldComponent >> field [
	^ field
]

{ #category : #accessing }
FUFieldComponent >> field: aField [
	field := aField
]

{ #category : #initialization }
FUFieldComponent >> initialize [
	super initialize.
]

{ #category : #rendering }
FUFieldComponent >> renderContentOn: html [
	html tbsContainer: [ 
		html tbsColumn
				extraSmallSize: 5;
				smallSize: 4;
				mediumSize: 3;
			with: [ html text: self field name].
		html tbsColumn
				extraSmallSize: 7;
				smallSize: 6;
				mediumSize: 6;
			with: [ self renderFieldType: html ].			
		html tbsColumn 
				extraSmallSize: 0;
				smallSize: 2;
				mediumSize: 3
		]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldDate: html [
	html tbsFormGroup: [
		html dateInput
		callback: [ :value | field variable: value ];
		with: Date today 
	]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldEmail: html [
	html tbsFormGroup: [
		html emailInput tbsFormControl;
		callback: [ :v | field variable: v ];
		value: self field variable 
	]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldNumber: html [
	html tbsFormGroup: [
		html numberInput tbsFormControl;
		callback: [ :v | field variable: v ];
		value: self field variable 
	]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldPhone: html [
	html tbsFormGroup: [
		html telephoneInput tbsFormControl;
		callback: [ :v | field variable: v ];
		value: self field variable 
	]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldSingleChoice: html [
	| group |
	html tbsFormGroup: [
		html unorderedList: [
            group := html radioGroup.
            self field formValues do: [ :each | 
                group radioButton
                    selected: each = self field variable;
                    callback: [ :value | self field variable ];  
                    with: each.
							html html: '<br>'.] ] ].	
]

{ #category : #rendering }
FUFieldComponent >> renderFieldString: html [
	html tbsFormGroup: [
		html textInput tbsFormControl size: 30 ;
		callback: [ :v | field variable: v ];
		value: self field variable 
	]
]

{ #category : #rendering }
FUFieldComponent >> renderFieldType: html [
	self field type = 'string'
	ifTrue: [ self renderFieldString: html] .
	
	self field type = 'number'
	ifTrue: [ self renderFieldNumber: html ].
	
	self field type = 'date'
	ifTrue: [ self renderFieldDate: html ].
	
	self field type = 'email'
	ifTrue: [ self renderFieldEmail: html ].
	
	self field type = 'phone'
	ifTrue: [ self renderFieldPhone: html ].
	
	self field type = 'singleChoice'
	ifTrue: [ self renderFieldSingleChoice: html ]
	
]
