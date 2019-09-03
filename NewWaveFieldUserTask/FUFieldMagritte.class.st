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
	Smalltalk globals at: #ABooleanMagretteNewWave put: field name.
	^ MABooleanDescription new 
		accessor: #ABooleanMagretteNewWave;
		label: field name;
		priority: counter;
		componentClass: MATextInputComponent;
		comment: '';
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
FUFieldMagritte >> dateDescription [
	Smalltalk globals at: #ADateMagretteNewWave put: field name.
	^ MADateDescription new 
		accessor: #ADateMagretteNewWave;
		label: field name;
		priority: counter;
		componentClass: MADateInputComponent; 
		comment: '';
		beRequired;
		addCondition: [ :value | (Date fromString: value) <= Date today];
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> emailDescription [
	Smalltalk globals at: #AEmailMagretteNewWave put: field name.
	^ MAStringDescription new 
		accessor: #AEmailMagretteNewWave;
		label: field name;
		priority: counter;
		componentClass: MATextInputComponent;
		comment: '';
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
	<magritteDescription>
	^ self giveDescription 
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> giveDescription [
	field type caseOf: {
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
FUFieldMagritte >> initialize [
	super initialize.
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> numberDescription [
	Smalltalk globals at: #ANumberMagretteNewWave put: field name.
	^ MANumberDescription new 
		accessor: #ANumberMagretteNewWave;
		label: field name;
		priority: counter;
		comment: '';
		componentClass: MATextInputComponent;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> phoneDescription [ 
	Smalltalk globals at: #APhoneMagretteNewWave put: field name.
	^ MAStringDescription new 
		accessor: #APhoneMagretteNewWave;
		label: field name;
		priority: counter;
		comment: '';
		componentClass: MATextInputComponent;
		addCondition: [ :value | value matches: '^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$' ]
		labelled: 'Please enter a valid phone number';
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> singleOptionDescription [
	Smalltalk globals at: #ASingleOptionMagretteNewWave put: field name.
	^ MASingleOptionDescription new 
		accessor: #ASingleOptionMagretteNewWave;
		label: field name;
		priority: counter;
		comment: '';
		options: field formValues;
		componentClass: MASingleSelectionComponent;
		beSorted;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
FUFieldMagritte >> stringDescription [
	Smalltalk globals at: #AStringMagretteNewWave put: field name.
	^ MAStringDescription new 
		accessor: #AStringMagretteNewWave;
		label: field name;
		priority: counter;
		comment: '';
		componentClass: MATextInputComponent;
		beRequired;
		yourself
]
