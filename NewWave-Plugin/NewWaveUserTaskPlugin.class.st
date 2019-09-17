Class {
	#name : #NewWaveUserTaskPlugin,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot'
	],
	#category : #'NewWave-Plugin'
}

{ #category : #'instance creation' }
NewWaveUserTaskPlugin class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> baseTemplate [
	^'
	<form action="http://localhost:8081/addNewEntity" method="post">
			<h2> {{ name  }} </h2>
			{{# formProperties }}
				<div class="form-group">
					<label for="{{ label }}">{{ label }}</label>
					<input type={{type}} class="form-control" id="{{ label }}" name="{{ name }}" placeholder="Enter {{ label }}">
				</div>
			{{/ formProperties }}
			<button type="submit" class="btn btn-primary">Submit</button>
	</form>'
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> displayFieldUserForm: aRequest [
	|forma s templateString |
	forma := (ZnEasy get: 'http://localhost:8081/events') entity string.
	s := NeoJSONReader fromString: forma.
	s = 'Empty' ifTrue: [ ^ 'Nista' ].
	templateString := String new writeStream.
	templateString nextPutAll: self getStyle.
	templateString nextPutAll: self baseTemplate.
	^ templateString contents asMustacheTemplate value: (NeoJSONReader 
         fromString: forma).
		
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> getStyle [
	^ '
	<link rel="stylesheet" type="text/css" href="http://localhost:8082/www/mystyle.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		
	</style>'
	.
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> initialize [ 
	super initialize.
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> initializePort: anInteger [
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
NewWaveUserTaskPlugin >> registerErrorHandlers [
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> registerRoutes [
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/displayFieldUserForm' -> (Send message: #displayFieldUserForm: to: self); output: #html.
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> start [
	teapot start.
	teapot serveStatic: 'www/mystyle.css' from: 'www/mystyle.css'.
	^ self.
]

{ #category : #initialization }
NewWaveUserTaskPlugin >> stop [
	teapot stop.
]
