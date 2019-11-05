"
I am a class that contains all the informations for the creating of descriptions.
Key in description dictionary conforms to varType instance property from NewWaveDOPropertyDescription.
Value is the MagritteDescription.

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	descriptionDictionary:		<Object>


    Implementation Points
"
Class {
	#name : #NewWaveDODescriptionSelector,
	#superclass : #Object,
	#instVars : [
		'descriptionDictionary'
	],
	#category : #'NewWave-ObjectPreparator'
}

{ #category : #accessing }
NewWaveDODescriptionSelector >> descriptionDictionary [
	^ descriptionDictionary
]

{ #category : #accessing }
NewWaveDODescriptionSelector >> descriptionDictionary: anObject [
	descriptionDictionary := anObject
]

{ #category : #initialization }
NewWaveDODescriptionSelector >> initialize [ 
	super initialize.
	self descriptionDictionary: {
			('ByteString' -> MAStringDescription new) .
			('SmallInteger' -> MANumberDescription new). } asDictionary 
]
