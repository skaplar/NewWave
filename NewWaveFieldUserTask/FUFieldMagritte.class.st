Class {
	#name : #FUFieldMagritte,
	#superclass : #Object,
	#instVars : [
		'field',
		'counter'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
FUFieldMagritte >> booleanDescription [
	^ MABooleanDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		beRequired;
		yourself
]

{ #category : #accessing }
FUFieldMagritte >> counter [
	^ counter
]

{ #category : #accessing }
FUFieldMagritte >> counter: aCounter [
	counter := aCounter 
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> emailDescription [
	^ MAStringDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		addCondition: [ :value | value matches: '#*@#*.#*' ]
		labelled: 'Please enter a valid email';
		beRequired;
		yourself
]

{ #category : #accessing }
FUFieldMagritte >> field [
	^ field
]

{ #category : #accessing }
FUFieldMagritte >> field: aField [
	field := aField
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> fieldDescription [
	^ self giveDescription asComponent 
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> giveDescription [
	<magritteDescription>
	field type caseOf: {
  		'boolean' -> [^ self booleanDescription].
  		'string' ->  [ ^ self stringDescription].
  		'number' -> [ ^ self numberDescription].
		'singleOption' -> [ ^ self singleOptionDescription] .
		'phone' -> [ ^ self phoneDescription ].	
		'email' -> [ ^ self emailDescription ].	
	 } otherwise: []
]

{ #category : #initialization }
FUFieldMagritte >> initialize [
	super initialize.
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> numberDescription [
	^ MANumberDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> phoneDescription [ 
	^ MAStringDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		addCondition: [ :value | value matches: '^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$' ]
		labelled: 'Please enter a valid phone number';
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> singleOptionDescription [
	^ MASingleOptionDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		options: field formValues;
		beSorted;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> stringDescription [

	^ MAStringDescription new "
		accessor: field name;"
		label: field name;
		priority: counter;
		beRequired;
		yourself
]
