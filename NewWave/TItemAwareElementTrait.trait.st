Trait {
	#name : #TItemAwareElementTrait,
	#instVars : [
		'itemDefinition'
	],
	#category : #'NewWave-Core'
}

{ #category : #initialization }
TItemAwareElementTrait >> initializeTrait [
	itemDefinition := ItemDefinition new.
]

{ #category : #initialization }
TItemAwareElementTrait >> itemDefinition [
	^ itemDefinition
]
