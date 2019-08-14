Class {
	#name : #SimpleFormToBuild,
	#superclass : #ComposablePresenterWithModel,
	#instVars : [
		'lblName',
		'lblLastName',
		'txtName',
		'txtLastName'
	],
	#category : #'NewWave-Model'
}

{ #category : #specs }
SimpleFormToBuild class >> defaultSpec [

	<spec: #default>

	| fontWidth labelsWidth rowHeight |
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	labelsWidth := fontWidth * 8.
	rowHeight := self inputTextHeight.
	
	^ SpecLayout composed
		newColumn: [ :col | 

			col newRow: [ :row | 
				row add: #lblName right: labelsWidth.
				row add: #txtName ]
			height: rowHeight.
		
			col newRow: [ :row | 
				row add: #lblLastName right: labelsWidth.
				row add: #txtLastName ]
			height: rowHeight.

		"fill the rest of the space"
		col newRow: [ :row |  ] ]; 
			
		yourself.	
]

{ #category : #initialization }
SimpleFormToBuild >> initializeWidgets [
	
	lblName := self newLabel label: 'Name:'.
	txtName := self newTextInput.

	lblLastName := self newLabel label: 'Last Name:'.
	txtLastName := self newTextInput.
	
	self focusOrder 
		add: lblName;
		add: txtName;
		add: lblLastName;
		add: txtLastName.
	
]

{ #category : #initialization }
SimpleFormToBuild >> lblLastName [
	^ lblLastName
]

{ #category : #initialization }
SimpleFormToBuild >> lblLastName: aValue [
	lblLastName := aValue
]

{ #category : #initialization }
SimpleFormToBuild >> lblName [
	^ lblName
]

{ #category : #initialization }
SimpleFormToBuild >> lblName: aValue [
	lblName := aValue
]

{ #category : #initialization }
SimpleFormToBuild >> title [
	^ 'Example Title'
]

{ #category : #initialization }
SimpleFormToBuild >> txtLastName [
	^ txtLastName
]

{ #category : #initialization }
SimpleFormToBuild >> txtLastName: aValue [
	txtLastName := aValue
]

{ #category : #initialization }
SimpleFormToBuild >> txtName [
	^ txtName
]

{ #category : #initialization }
SimpleFormToBuild >> txtName: aValue [
	txtName := aValue
]
