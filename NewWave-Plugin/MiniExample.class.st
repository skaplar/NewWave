Class {
	#name : #MiniExample,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot'
	],
	#category : #'NewWave-Plugin'
}

{ #category : #'instance creation' }
MiniExample class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #initialization }
MiniExample >> baseTemplateNew [
	^'
	<form action="http://localhost:8081/addNewEntity" method="post">
			{{ name }}
			{{> partial }}
			<button type="submit" class="btn btn-primary">Submit</button>
	</form>'
]

{ #category : #initialization }
MiniExample >> determineComponent: aComponent [
	aComponent logCr.
	aComponent = 'text' ifTrue: [ 
	^ '<input type="text" class="form-control" id="{{ label }}" name="{{ label }}" placeholder="Enter {{ label }}">'].
	aComponent = 'number' ifTrue: [ 
	^ '<input type="number" class="form-control" id="{{ label }}" name="{{ label }}" placeholder="Enter {{ label }}">'].
]

{ #category : #initialization }
MiniExample >> displayForm: aRequest [
	|forma x s templateString partial parts p |
	x := 
'{
  "name": "Worker",
  "formProperties": [
    {
      "name": "firstName",
      "type": "text",
      "label": "First Name"
    },
    {
      "name": "lastName",
      "type": "text",
      "label": "Last Name"
    }
  ]
}'.
	s := NeoJSONReader fromString: x.
	templateString := String new writeStream.
	templateString nextPutAll: self getStyle.
	templateString nextPutAll: self baseTemplateNew.
	partial := String new writeStream.
	parts := Dictionary new.
	(s at: 'formProperties') do: [
		:el | 
		| tmp |
		tmp := self preparePartialNew: el.
		parts at: (el at: 'name') put: tmp.
		partial nextPutAll: '{{> '.
		partial nextPutAll: (el at: 'name').
		partial nextPutAll: '}}'.
	].
	parts logCr.
	partial contents logCr.
	p := partial contents asMustacheTemplate value: '' asDictionary partials: parts.
	^ templateString contents asMustacheTemplate value: (NeoJSONReader 
         fromString: x) partials: {'partial' -> p } asDictionary.
	"^ templateString contents asMustacheTemplate value: (NeoJSONReader 
         fromString: x) partials: {'partial' -> p } asDictionary."
		
]

{ #category : #initialization }
MiniExample >> getStyle [
	^ '
	<link rel="stylesheet" type="text/css" href="http://localhost:8082/www/mystyle.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		
	</style>
	<h1>Proba</h1>'.
]

{ #category : #initialization }
MiniExample >> initialize [ 
	super initialize.
]

{ #category : #initialization }
MiniExample >> initializePort: anInteger [
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
MiniExample >> preparePartialNew: s [
| templateString |
templateString := String new writeStream.
templateString nextPutAll:
'
<div class="form-group">
	<label for="{{ label }}">{{ label }}</label>
'.
templateString nextPutAll: (self determineComponent: (s at: 'type')).
templateString nextPutAll: '</div>'.
^ templateString contents asMustacheTemplate value: { 
	'label' -> (s at: 'label').
} asDictionary.

]

{ #category : #initialization }
MiniExample >> registerErrorHandlers [
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #initialization }
MiniExample >> registerRoutes [
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/displayForm' -> (Send message: #displayForm: to: self); output: #html.
]

{ #category : #initialization }
MiniExample >> start [
	teapot start.
	teapot serveStatic: 'www/mystyle.css' from: 'www/mystyle.css'.
	^ self.
]

{ #category : #initialization }
MiniExample >> stop [
	teapot stop.
]
