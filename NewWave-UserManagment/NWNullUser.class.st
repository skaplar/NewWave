Class {
	#name : #NWNullUser,
	#superclass : #NWUser,
	#category : #'NewWave-UserManagment'
}

{ #category : #initialization }
NWNullUser >> initialize [ 
	super initialize.
	self username: ''
]
