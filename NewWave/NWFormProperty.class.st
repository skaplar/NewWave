"
I represent a form property.

    Instance Variables
	formValues:		<Object>
	label:		<Object>
	name:		<Object>
	type:		<Object>
	variable:		<Object>


    Implementation Points
"
Class {
	#name : #NWFormProperty,
	#superclass : #NWElement,
	#instVars : [
		'name',
		'type',
		'variable',
		'formValues',
		'label'
	],
	#category : #'NewWave-Core'
}

{ #category : #accessing }
NWFormProperty class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name type variable formValues label) ] 
]

{ #category : #initialization }
NWFormProperty >> addFormValue: aValue [
	formValues add: aValue
]

{ #category : #'as yet unclassified' }
NWFormProperty >> booleanDescription [

	^ MABooleanDescription new 
		accessor: #variable;
		label: self name;
		priority: 50;
		comment: (self name, ' not valid');
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
NWFormProperty >> dateDescription [
	^ MADateDescription new 
		accessor: #variable;
		label: self name;
		priority: 10;
		comment: (self name, ' not valid');
		beRequired;
		addCondition: [ :value | value > Date today ];
		yourself
]

{ #category : #'as yet unclassified' }
NWFormProperty >> emailDescription [
	
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
NWFormProperty >> findDescription [
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
NWFormProperty >> formValues [
	^ formValues
]

{ #category : #'as yet unclassified' }
NWFormProperty >> getMagritteDescription [
	^ self findDescription 
]

{ #category : #initialization }
NWFormProperty >> initialize [ 
	super initialize.
	formValues := OrderedCollection new.

]

{ #category : #accessing }
NWFormProperty >> label [
	^ label
]

{ #category : #accessing }
NWFormProperty >> label: anObject [
	label := anObject
]

{ #category : #initialization }
NWFormProperty >> name [
	^ name
]

{ #category : #initialization }
NWFormProperty >> name: aName [
	name := aName
]

{ #category : #'as yet unclassified' }
NWFormProperty >> numberDescription [

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
NWFormProperty >> phoneDescription [ 
	
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
NWFormProperty >> singleOptionDescription [

	^ MASingleOptionDescription new 
		accessor: #variable;
		label: self name;
		priority: 0;
		comment: (self name, ' not valid');
		options: self formValues;
		beSorted;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
NWFormProperty >> stringDescription [

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
NWFormProperty >> type [ 
	^ type
]

{ #category : #initialization }
NWFormProperty >> type: aType [
	type := aType
]

{ #category : #initialization }
NWFormProperty >> variable [ 
	^ variable
]

{ #category : #initialization }
NWFormProperty >> variable: aVariable [ 
	variable := aVariable
]
