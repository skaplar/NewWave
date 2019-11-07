Class {
	#name : #FUDOClassDescriptionTest,
	#superclass : #TestCase,
	#category : #'NewWaveFieldUserTask-Tests'
}

{ #category : #tests }
FUDOClassDescriptionTest >> testAddAllToProps [
	| obj coll collItem|
	obj := FUDOClassDescription new.
	coll := OrderedCollection new.
	
	collItem := FUDOPropertyDescription new
		varName: 'First Name';
		varType: 'ByteString';
		varValue: 'Mike'.
	coll add: collItem .
	collItem := FUDOPropertyDescription new
		varName: 'Last Name';
		varType: 'ByteString';
		varValue: 'Doe'.
	coll add: collItem .
	
	obj className: 'Person'.
	obj addAllToProps: coll.
	self assert: obj properties size equals: 2
]

{ #category : #tests }
FUDOClassDescriptionTest >> testCreate [
	| obj |
	obj := FUDOClassDescription new.
	obj className: 'Person'.
	obj properties: OrderedCollection new.
	self assert: obj className1 equals: 'Person'.
	self assert: obj properties isEmpty 
]
