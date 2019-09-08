Class {
	#name : #FormProperty,
	#superclass : #Element,
	#instVars : [
		'name',
		'type',
		'variable',
		'formValues'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
FormProperty >> addFormValue: aValue [
	formValues add: aValue
]

{ #category : #'as yet unclassified' }
FormProperty >> booleanDescription [

	^ MABooleanDescription new 
		accessor: #FormProperty;
		label: self name;
		priority: 50;
		componentClass: MATextInputComponent;
		comment: (self name, ' not valid');
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FormProperty >> dateDescription [
	
	^ MADateDescription new 
		accessor: #variable;
		label: self name;
		priority: 10;
		componentClass: MADateInputComponent; 
		comment: (self name, ' not valid');
		beRequired;
		addCondition: [ :value | value > Date today ];
		yourself
]

{ #category : #'acessing-magritte' }
FormProperty >> descriptionName [
"	<magritteDescription>
	^ MAStringDescription new 
		accessor: #variable;
		label: self name;
		priority: 100"
]

{ #category : #'acessing-magritte' }
FormProperty >> descriptionVariable [
	<magritteDescription>
	^ self findDescription 
]

{ #category : #'as yet unclassified' }
FormProperty >> emailDescription [
	
	^ MAStringDescription new 
		accessor: #variable;
		label: self name;
		priority: 0;
		componentClass: MATextInputComponent;
		comment: (self name, ' not valid');
		addCondition: [ :value | value matches: '#*@#*.#*' ]
		labelled: 'Please enter a valid email';
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FormProperty >> findDescription [
	self type caseOf: {
  		'boolean' -> [^ self booleanDescription].
  		'string' ->  [ ^ self stringDescription].
  		'number' -> [ ^ self numberDescription].
		'singleOption' -> [ ^ self singleOptionDescription] .
		'phone' -> [ ^ self phoneDescription ].	
		'email' -> [ ^ self emailDescription ].	
		'date' -> [ ^ self dateDescription  ]
	 } otherwise: [] 
]

{ #category : #initialization }
FormProperty >> formValues [
	^ formValues
]

{ #category : #'as yet unclassified' }
FormProperty >> getMagritteDescription [
	^ self findDescription 
]

{ #category : #initialization }
FormProperty >> initialize [ 
	super initialize.
	formValues := OrderedCollection new.

]

{ #category : #initialization }
FormProperty >> name [
	^ name
]

{ #category : #initialization }
FormProperty >> name: aName [
	name := aName
]

{ #category : #'as yet unclassified' }
FormProperty >> numberDescription [

	^ MANumberDescription new 
		accessor: #variable;
		label: self name;
		priority: 10;
		comment: (self name, ' not valid');
		componentClass: MATextInputComponent;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FormProperty >> phoneDescription [ 
	
	^ MAStringDescription new 
		accessor: #variable;
		label: self name;
		priority: 0;
		comment: (self name, ' not valid');
		componentClass: MATextInputComponent;
		addCondition: [ :value | value matches: '^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$' ]
		labelled: 'Please enter a valid phone number';
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FormProperty >> singleOptionDescription [

	^ MASingleOptionDescription new 
		accessor: #variable;
		label: self name;
		priority: 0;
		comment: (self name, ' not valid');
		options: self formValues;
		componentClass: MASingleSelectionComponent;
		beSorted;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FormProperty >> stringDescription [

	^ MAStringDescription new 
		accessor: #variable;
		label: self name;
		priority: 0;
		comment: (self name, ' not valid');
		componentClass: MATextInputComponent;
		beRequired;
		yourself
]

{ #category : #initialization }
FormProperty >> type [ 
	^ type
]

{ #category : #initialization }
FormProperty >> type: aType [
	type := aType
]

{ #category : #initialization }
FormProperty >> variable [ 
	^ variable
]

{ #category : #initialization }
FormProperty >> variable: aVariable [ 
	variable := aVariable
]
