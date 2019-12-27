Class {
	#name : #NWTextFieldType,
	#superclass : #NWFieldType,
	#category : #'NewWave-Core'
}

{ #category : #accessing }
NWTextFieldType class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	super neoJsonMapping: mapper.
]

{ #category : #initialization }
NWTextFieldType >> initialize [ 
	super initialize.
	name := 'text'.
]
