Class {
	#name : #NewWavePropertyDescriptionTest,
	#superclass : #TestCase,
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #tests }
NewWavePropertyDescriptionTest >> testAddingProperty [
	| prop |
	prop := NewWaveDOPropertyDescription new.
	prop varName: 'First Name'.
	prop varType: 'ByteString'.
	prop varValue: 'Mike'.
	
	self assert: prop varName equals: 'First Name'.
	self assert: prop varType equals: 'ByteString'.
	self assert: prop varValue equals: 'Mike'.
]
