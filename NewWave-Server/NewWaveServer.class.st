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

{ #category : #'instance creation' }
NewWaveServer class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #'instance creation' }
NewWaveServer class >> serveOn: portNumber waveEngine: aWaveEngine [
	^ self new  
		initializePort: portNumber;
		engine: aWaveEngine; 
		start
]

{ #category : #routes }
NewWaveServer >> addEvent: aRequest [
	engine engineAnnouncer announce: (WaveAnnouncer with: 'Izvrsen').
	^ 'Izvrsen'
		
]

{ #category : #routes }
NewWaveServer >> addNewEntity: aRequest [
	| tmp |
	(aRequest at: 'ime') logCr.
	(aRequest at: 'prezime') logCr.
	tmp := NeoJSONWriter toString: aRequest entity fields.
	engine engineAnnouncer announce: (WaveAnnouncer with: tmp).
	^ 'Adding of entity executed'.
]

{ #category : #routes }
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

{ #category : #initialization }
NewWaveServer >> engine [
	^ engine
]

{ #category : #initialization }
NewWaveServer >> engine: waveEngine [
	engine := waveEngine
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

{ #category : #initialization }
NewWaveServer >> pendingTasks [
	^ pendingTasks
]

{ #category : #initialization }
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
	"n ifEmpty: [ ^ NeoJSONWriter toStringPretty: { #result -> 'empty'.} ]."
	prvi := n first. 
	^ prvi value.
		
]

{ #category : #initialization }
NewWaveServer >> registerErrorHandlers [
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #initialization }
NewWaveServer >> registerRoutes [
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/events' -> (Send message: #readEvents: to: self); output: #json;
		GET: '/eventzz' -> (Send message: #addEvent: to: self); output: #json;
		POST: '/addNewEntity' -> (Send message: #addNewEntity: to: self).
]

{ #category : #routes }
NewWaveServer >> removeTask: aTask user: aUser [
	| tasks |
	tasks := pendingTasks at: aUser ifAbsent: [ ^ '{"result": "Empty"}'].
	tasks remove: aTask.
]

{ #category : #controlling }
NewWaveServer >> start [
	teapot start.
	^ self.
]

{ #category : #controlling }
NewWaveServer >> stop [
	teapot stop.
]
