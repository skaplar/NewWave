Class {
	#name : #NewWavePlugin,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot'
	],
	#category : #'NewWave-Plugin'
}

{ #category : #'instance creation' }
NewWavePlugin class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #initialization }
NewWavePlugin >> baseTemplate [
	^'
	<form action="http://localhost:8081/addNewEntity" method="post">
			{{ name  }}
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
NewWavePlugin >> baseTemplateNew [
	^'
	<form action="http://localhost:8081/addNewEntity" method="post">
			{{ visibleClassName }}
			{{> partial }}
			<button type="submit" class="btn btn-primary">Submit</button>
	</form>'
]

{ #category : #initialization }
NewWavePlugin >> determineComponent: aComponent [
	aComponent = 'TextFieldComponent' ifTrue: [ 
	^ '<input type="text" class="form-control" id="{{ label }}" name="{{ label }}" placeholder="Enter {{ label }}">'].
	aComponent = 'NumberComponent' ifTrue: [ 
	^ '<input type="number" class="form-control" id="{{ label }}" name="{{ label }}" placeholder="Enter {{ label }}">'].
]

{ #category : #initialization }
NewWavePlugin >> displayFieldUserForm: aRequest [
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
NewWavePlugin >> displayForm: aRequest [
	|forma s templateString partial parts p |
	forma := (ZnEasy get: 'http://localhost:8081/events') entity string.
	s := NeoJSONReader fromString: forma.
	s = 'Empty' ifTrue: [ ^ 'Nista' ].
	templateString := String new writeStream.
	templateString nextPutAll: self getStyle.
	templateString nextPutAll: self baseTemplateNew.
	partial := '<input type="text" class="form-control" id="{{ label }}" name="{{ name }}" placeholder="Enter {{ label }}">'.
	partial := String new writeStream.
	parts := Dictionary new.
	(s at: 'visibleElements') do: [
		:el | 
		| tmp |
		tmp := self preparePartialNew: el.
		parts at: (el at: 'columnLabel') put: tmp.
		partial nextPutAll: '{{> '.
		partial nextPutAll: (el at: 'columnLabel').
		partial nextPutAll: '}}'.
	].
	parts logCr.
	partial contents logCr.
	p := partial contents asMustacheTemplate value: '' asDictionary partials: parts.
	^ templateString contents asMustacheTemplate value: (NeoJSONReader 
         fromString: forma) partials: {'partial' -> p } asDictionary.
		
]

{ #category : #initialization }
NewWavePlugin >> getStyle [
	^ '
	<link rel="stylesheet" type="text/css" href="http://localhost:8082/www/mystyle.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		
	</style>
	<h1>Proba</h1>'.
]

{ #category : #initialization }
NewWavePlugin >> initialize [ 
	super initialize.
]

{ #category : #initialization }
NewWavePlugin >> initializePort: anInteger [
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
NewWavePlugin >> preparePartial [

^'{{#wrapped}} {{tekst}} {{/wrapped}}' asMustacheTemplate value: { 
	'tekst' -> '{{ component }}'.
	'label' -> '{{ label }}'.
	'wrapped' -> [ :render| self determineComponent: render value ]  
} asDictionary.
]

{ #category : #initialization }
NewWavePlugin >> preparePartialNew: s [
| templateString |
templateString := String new writeStream.
templateString nextPutAll:
'
<div class="form-group">
	<label for="{{ label }}">{{ label }}</label>
'.
templateString nextPutAll: (self determineComponent: (s at: 'component')).
templateString nextPutAll: '</div>'.
^ templateString contents asMustacheTemplate value: { 
	'label' -> (s at: 'columnLabel').
} asDictionary.

]

{ #category : #initialization }
NewWavePlugin >> registerErrorHandlers [
	teapot
		exception: TeaNoSuchParam -> (Send message: #missingParam:request: to: self).
		"exception: BookNotFound -> (Send message: #bookNotFound:request: to: self);
		exception: Error -> (TeaResponse serverError body: { #code -> 'ERROR' } asDictionary )	"	
]

{ #category : #initialization }
NewWavePlugin >> registerRoutes [
	teapot
		GET: '/' -> '<h1>It works!</h1>';output: #html;
		GET: '/displayForm' -> (Send message: #displayForm: to: self); output: #html;
		GET: '/displayFieldUserForm' -> (Send message: #displayFieldUserForm: to: self); output: #html.
]

{ #category : #initialization }
NewWavePlugin >> start [
	teapot start.
	teapot serveStatic: 'www/mystyle.css' from: 'www/mystyle.css'.
	^ self.
]

{ #category : #initialization }
NewWavePlugin >> stop [
	teapot stop.
]
