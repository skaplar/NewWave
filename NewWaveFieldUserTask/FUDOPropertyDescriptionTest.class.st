Class {
	#name : #FUDOPropertyDescriptionTest,
	#superclass : #TestCase,
	#category : #'NewWaveFieldUserTask-Tests'
}

{ #category : #tests }
FUDOPropertyDescriptionTest >> testAddingProperty [
	| prop |
	prop := FUDOPropertyDescription new.
	prop varName: 'First Name'.
	prop varType: 'ByteString'.
	prop varValue: 'Mike'.
	
	self assert: prop varName equals: 'First Name'.
	self assert: prop varType equals: 'ByteString'.
	self assert: prop varValue equals: 'Mike'.
]
