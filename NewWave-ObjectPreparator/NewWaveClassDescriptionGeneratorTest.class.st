Class {
	#name : #NewWaveClassDescriptionGeneratorTest,
	#superclass : #TestCase,
	#category : #'NewWave-ObjectPreparator-Tests'
}

{ #category : #tests }
NewWaveClassDescriptionGeneratorTest >> testCollectInsVars [
	| nwClassDescriptionGenerator |
	nwClassDescriptionGenerator := NWClassDescriptionGenerator dataObject: Adresa example3.
	self assert: nwClassDescriptionGenerator collectInstVars size equals: 4.
	
	
]

{ #category : #tests }
NewWaveClassDescriptionGeneratorTest >> testCreateClassDescriptionCreation [
	| nwClassDescriptionGenerator classDescriptionClass |
	nwClassDescriptionGenerator := NWClassDescriptionGenerator dataObject: Adresa example3.
	classDescriptionClass := nwClassDescriptionGenerator createClassDescription class.
	self assert: classDescriptionClass equals: NewWaveDOClassDescription.
	
	
]
