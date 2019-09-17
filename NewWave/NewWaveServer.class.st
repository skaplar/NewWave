Class {
	#name : #NewWaveServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot',
		'engine',
		'element',
		'pendingTasks'
	],
	#category : #'NewWave-Server'
}

{ #category : #'as yet unclassified' }
NewWaveServer class >> serveOn: portNumber [ 
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #'as yet unclassified' }
NewWaveServer class >> serveOn: portNumber waveEngine: aWaveEngine [ 
	^ self new  
		initializePort: portNumber;
		engine: aWaveEngine; 
		start
]

{ #category : #adding }
NewWaveServer >> addEvent: aRequest [ 
	engine engineAnnouncer announce: (WaveAnnouncer with: 'Izvrsen').
	^ 'Izvrsen'
]

{ #category : #adding }
NewWaveServer >> addNewEntity: aRequest [
	| tmp |
	(aRequest at: 'firstName') logCr.
	(aRequest at: 'lastName') logCr.
	tmp := NeoJSONWriter toString: aRequest entity fields.
	engine engineAnnouncer announce: (WaveAnnouncer with: tmp).
	^ 'Adding of entity executed'.
]

{ #category : #adding }
NewWaveServer >> addTask: aTask user: aUser [ 
	| tasks |
	tasks := pendingTasks
		at: aUser
		ifPresent: [ 
			pendingTasks at: aUser add: aTask.
		]
		ifAbsentPut: [ OrderedCollection with: aTask ].
]

{ #category : #accessing }
NewWaveServer >> element [
	^ element
]

{ #category : #accessing }
NewWaveServer >> element: anObject [
	element := anObject
]

{ #category : #accessing }
NewWaveServer >> engine [
	^ engine
]

{ #category : #accessing }
NewWaveServer >> engine: anObject [
	engine := anObject
]

{ #category : #initialization }
NewWaveServer >> initialize [ 
	super initialize.
	pendingTasks := Dictionary new.
]

{ #category : #initialization }
NewWaveServer >> initializePort: anInteger [ 
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

{ #category : #accessing }
NewWaveServer >> pendingTasks [
	^ pendingTasks
]

{ #category : #accessing }
NewWaveServer >> port: anObject [
	port := anObject
]

{ #category : #'as yet unclassified' }
NewWaveServer >> readEvents: aRequest [ 
	| json n prvi |
	"n := engine mainExecutor flowHandler node."
	"json := String streamContents: [ :stream |
		(NeoJSONWriter on: (NeoJSONMockStream on: stream))
			prettyPrint: true;
			nextPut: n ]."
	"^ n."
	n := pendingTasks at: 'default'.
	n ifNil: [ ^ 'Non-existing user' ].
	n ifEmpty: [ ^ 'Empty' ].
	prvi := n first. 
	^ prvi value.
]

{ #category : #'as yet unclassified' }
NewWaveServer >> registerErrorHandlers [ 
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #'as yet unclassified' }
NewWaveServer >> registerRoutes [ 
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/events' -> (Send message: #readEvents: to: self); output: #json;
		GET: '/eventzz' -> (Send message: #addEvent: to: self); output: #json;
		POST: '/addNewEntity' -> (Send message: #addNewEntity: to: self).
]

{ #category : #removing }
NewWaveServer >> removeTask: aTask user: aUser [ 
	| tasks |
	tasks := pendingTasks at: aUser ifAbsent: [ ^ '{"result": "Empty"}'].
	tasks remove: aTask.
]

{ #category : #accessing }
NewWaveServer >> start [ 
	teapot start.
	^ self.
]

{ #category : #accessing }
NewWaveServer >> stop [ 
	teapot stop.
]
