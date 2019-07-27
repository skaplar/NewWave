Class {
	#name : #FormTransHelper,
	#superclass : #Object,
	#instVars : [
		'form',
		'dict'
	],
	#category : #'NewWave-Plugin'
}

{ #category : #accessing }
FormTransHelper class >> dictionary: aDict [
	^ self new 
		dict: aDict;
		yourself.
]

{ #category : #accessing }
FormTransHelper >> determineComponent: aComponent [
	aComponent = 'TextFieldComponent' ifTrue: [ ^ 'text' ].
	aComponent = 'NumberComponent' ifTrue: [ ^ 'number' ].
	
]

{ #category : #accessing }
FormTransHelper >> dict [ 
	^ dict
]

{ #category : #accessing }
FormTransHelper >> dict: aDictionary [
	dict := aDictionary
]

{ #category : #accessing }
FormTransHelper >> form [
	^ form
]

{ #category : #accessing }
FormTransHelper >> initialize [
	super initialize.
	form := Dictionary new.
]

{ #category : #accessing }
FormTransHelper >> performMapping [
	form at: 'visibleClassName' put: (dict at: 'visibleClassName').
	form at: 'modal' put: (dict at: 'modal').
	form at: 'visibleElements' put: OrderedCollection new.
	self populateElements: (dict at: 'visibleElements').
	
]

{ #category : #accessing }
FormTransHelper >> performTemplating [
	| template result partial |
	template := MustacheTemplate on: '{{ visibleClassName }} {{>partial}}'.
	partial := MustacheTemplate on: '
			{{# visibleElements }}
				<div class="form-group">
					<label for="{{ label }}">{{ label }}</label>
					{{> partial  }}
				</div>
			{{/ visibleElements }}'.
	^ result := template 
		value: { 'visibleClassName' -> (dict at: 'visibleClassName')} asDictionary
		partials: (Dictionary new
			at: 'partial' put: (partial value: {'visibleElements' -> (dict at: 'visibleElements')} asDictionary);
			yourself).
	
	"form at: 'visibleClassName' put: (dict at: 'visibleClassName').
	form at: 'modal' put: (dict at: 'modal').
	form at: 'visibleElements' put: OrderedCollection new.
	self populateElements: (dict at: 'visibleElements')."
	
]

{ #category : #accessing }
FormTransHelper >> populateElements: elements [
	elements do: [ :el | 
		| tmp oc |
		tmp := Dictionary new.
		tmp at: 'label' put: (el at: 'label').
		tmp at: 'component' put: (self determineComponent: (el at: 'component')).
		oc := form at: 'visibleElements'.
		oc add: tmp.		 
	]
	
]
