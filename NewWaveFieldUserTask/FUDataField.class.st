Class {
	#name : #FUDataField,
	#superclass : #Object,
	#instVars : [
		'label',
		'fieldID',
		'type',
		'defaultValue',
		'result',
		'optionValues'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #adding }
FUDataField >> addOptionValue: aValue [
	optionValues ifNil: [ optionValues := OrderedCollection new ].
	optionValues add: aValue
]

{ #category : #'as yet unclassified' }
FUDataField >> booleanDescription [
	^ MABooleanDescription new 
		accessor: #result;
		label: self label;
		priority: 50;
		comment: (self label, ' not valid');
		yourself
]

{ #category : #'as yet unclassified' }
FUDataField >> dateDescription [
	^ MADateDescription new 
		accessor: #result;
		label: self label;
		priority: 10;
		comment: (self label, ' not valid');
		yourself
]

{ #category : #accessing }
FUDataField >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
FUDataField >> defaultValue: aDefaultValue [
	defaultValue := aDefaultValue
]

{ #category : #'acessing-magritte' }
FUDataField >> descriptionResult [
	<magritteDescription>
	^ self findDescription 
]

{ #category : #'as yet unclassified' }
FUDataField >> emailDescription [	
	^ MAStringDescription new 
		accessor: #result;
		label: self label;
		priority: 0;
		componentClass: MATextInputComponent;
		comment: (self label, ' not valid');
		addCondition: [ :value | value matches: '#*@#*.#*' ]
		labelled: 'Please enter a valid email';
		yourself
]

{ #category : #accessing }
FUDataField >> fieldID [
	^ fieldID
]

{ #category : #accessing }
FUDataField >> fieldID: aFieldID [
	fieldID := aFieldID
]

{ #category : #'as yet unclassified' }
FUDataField >> findDescription [
	self defaultValue isNotNil
		ifTrue: [ self result: self defaultValue ].
	self type caseOf: {
  		'boolean' -> [^ self booleanDescription].
  		'string' ->  [ ^ self stringDescription].
  		'number' -> [ ^ self numberDescription].
		'singleOption' -> [ ^ self singleOptionDescription] .
		'phone' -> [ ^ self phoneDescription ].	
		'email' -> [ ^ self emailDescription ].	
		'date' -> [ ^ self dateDescription  ]
	 } otherwise: [^ self stringDescription] 
]

{ #category : #initialization }
FUDataField >> initialize [ 	
	super initialize 
]

{ #category : #accessing }
FUDataField >> label [ 
	^ label
]

{ #category : #accessing }
FUDataField >> label: aLabel [ 
	label := aLabel
]

{ #category : #'as yet unclassified' }
FUDataField >> numberDescription [

	^ MANumberDescription new 
		accessor: #result;
		label: self label;
		priority: 10;
		comment: (self label, ' not valid');
		yourself
]

{ #category : #accessing }
FUDataField >> optionValues [
	^ optionValues
]

{ #category : #accessing }
FUDataField >> optionValues: aOptionValues [
	optionValues := aOptionValues
]

{ #category : #'as yet unclassified' }
FUDataField >> phoneDescription [ 	
	^ MAStringDescription new 
		accessor: #result;
		label: self label;
		priority: 0;
		comment: (self label, ' not valid');
		componentClass: MATextInputComponent;
		addCondition: [ :value | value matches: '^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$' ]
		labelled: 'Please enter a valid phone number [060 123 456]';
		yourself
]

{ #category : #accessing }
FUDataField >> result [
	^ result 
]

{ #category : #accessing }
FUDataField >> result: aResult [
	result := aResult 
]

{ #category : #'as yet unclassified' }
FUDataField >> singleOptionDescription [

	^ MASingleOptionDescription new 
		accessor: #result;
		label: self label;
		priority: 0;
		comment: (self label, ' not valid');
		options: self optionValues;
		beSorted;
		yourself
]

{ #category : #'as yet unclassified' }
FUDataField >> stringDescription [
	^ MAStringDescription new 
		accessor: #result;
		label: self label;
		priority: 0;
		comment: (self label, ' not valid');
		componentClass: MATextInputComponent;
		yourself
]

{ #category : #accessing }
FUDataField >> type [
	^ type 
]

{ #category : #accessing }
FUDataField >> type: aType [
	type := aType
]
