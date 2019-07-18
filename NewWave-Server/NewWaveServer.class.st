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

{ #category : #initialization }
NewWaveServer >> addEvent: aRequest [
	engine engineAnnouncer announce: (WaveAnnouncer with: 'Izvrsen').
	^ 'Izvrsen'
		
]

{ #category : #initialization }
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
	prvi := n first. 
	n remove: prvi. 
	^ prvi value.
	"element ifNil: [ ^ 'Nema nista' ] ifNotNil: [ ^ element value]. "
		
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
		GET: '/eventzz' -> (Send message: #addEvent: to: self); output: #json.
]

{ #category : #initialization }
NewWaveServer >> start [
	teapot start.
	^ self.
]

{ #category : #initialization }
NewWaveServer >> stop [
	teapot stop.
]
