Class {
	#name : #NWNullGroup,
	#superclass : #Group,
	#category : #'NewWave-UserManagment'
}

{ #category : #initialization }
NWNullGroup >> initialize [ 
	super initialize.
	self groupName: ''.
]
