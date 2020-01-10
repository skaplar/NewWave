Class {
	#name : #NewWaveDOClassDescriptionTest,
	#superclass : #TestCase,
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #tests }
NewWaveDOClassDescriptionTest >> testAddAllToProps [
	| obj coll collItem|
	obj := NewWaveDOClassDescription new.
	coll := OrderedCollection new.
	
	collItem := NewWaveDOPropertyDescription new
		varName: 'First Name';
		varType: 'ByteString';
		varValue: 'Mike'.
	coll add: collItem .
	collItem := NewWaveDOPropertyDescription new
		varName: 'Last Name';
		varType: 'ByteString';
		varValue: 'Doe'.
	coll add: collItem .
	
	obj className: 'Person'.
	obj addAllToProps: coll.
	self assert: obj properties size equals: 2
]

{ #category : #tests }
NewWaveDOClassDescriptionTest >> testCreate [
	| obj |
	obj := NewWaveDOClassDescription new.
	obj className: 'Person'.
	obj properties: OrderedCollection new.
	self assert: obj className1 equals: 'Person'.
	self assert: obj properties isEmpty 
]
