Class {
	#name : #VisibleAssociationEnd,
	#superclass : #VisibleElement,
	#instVars : [
		'activationPanel',
		'targetPanel'
	],
	#category : #'NewWave-ClassModel'
}

{ #category : #accessing }
VisibleAssociationEnd >> activationPanel [
	^ activationPanel
]

{ #category : #accessing }
VisibleAssociationEnd >> activationPanel: anObject [
	activationPanel := anObject
]

{ #category : #accessing }
VisibleAssociationEnd >> targetPanel [
	^ targetPanel
]

{ #category : #accessing }
VisibleAssociationEnd >> targetPanel: anObject [
	targetPanel := anObject
]
