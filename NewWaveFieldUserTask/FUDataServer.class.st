Class {
	#name : #FUDataServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot'
	],
	#category : #'NewWaveFieldUserTask-Server'
}

{ #category : #'as yet unclassified' }
FUDataServer class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #'as yet unclassified' }
FUDataServer >> createDataFields: json [
	| dataFields tempField|
	dataFields := OrderedCollection new.
	json do: [ :field | 
		tempField := FUDataField new 
			label: (field at: 'label'); 
			fieldID: (field at: 'fieldID'); 
			type: (field at: 'type'); 
			defaultValue: (field at: 'defaultValue'); 
			result: (field at: 'result'); 
			optionValues: (field at: 'optionValues').
		dataFields add: tempField.
		].
	^ dataFields
	
]

{ #category : #'as yet unclassified' }
FUDataServer >> createDataForm: aRequest [
   | json dataTask |
   json := JSJsonParser parse: aRequest entity.
   dataTask := (FUDataTask new
         taskID: (json at: 'taskID');
         userID: (json at: 'userID');
         details: (json at: 'details');
         addDataFields: (self createDataFields: (json at: 'dataFields'));
         yourself).
	^ FUApplication current addTask: dataTask
]

{ #category : #'as yet unclassified' }
FUDataServer >> createUser: aRequest [
   | json aUser|
   json := JSJsonParser parse: aRequest entity.
   aUser := (FUUser new
         username: (json at: 'username');
         password: (SHA256 hashMessage: (json at: 'password')); 
         yourself).
	^ FUApplication current addUser: aUser
]

{ #category : #'as yet unclassified' }
FUDataServer >> dataTest: aRequest [
	| jsonString |
	jsonString := NeoJSONObject fromString: '{"foo":1,"bar":-2}'.
	^ jsonString 
]

{ #category : #initialization }
FUDataServer >> initializePort: anInteger [
	teapot := Teapot configure: { 
		#port -> anInteger.
		#debugMode -> true.
		#defaultOutput -> #json.
	 }.

	^ self
		registerRoutes;
		registerErrorHandlers;
		yourself.
]

{ #category : #'as yet unclassified' }
FUDataServer >> registerErrorHandlers [ 
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
]

{ #category : #'as yet unclassified' }
FUDataServer >> registerRoutes [
	teapot
		GET: '/' -> (Send message: #dataTest: to: self); output: #json;
		POST: '/newTask' -> (Send message: #createDataForm: to: self);
		POST: '/newUser' -> (Send message: #createUser: to: self).
]

{ #category : #accessing }
FUDataServer >> start [ 
	teapot start.
	^ self.
]

{ #category : #accessing }
FUDataServer >> stop [ 
	teapot stop
]
