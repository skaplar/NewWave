Trait {
	#name : #TItemAwareElementTrait,
	#instVars : [
		'itemDefinition'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #initialization }
TItemAwareElementTrait >> initializeTrait [
	itemDefinition := NWItemDefinition new.
]

{ #category : #initialization }
TItemAwareElementTrait >> itemDefinition [
	^ itemDefinition
]
