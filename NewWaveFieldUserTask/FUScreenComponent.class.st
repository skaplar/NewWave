Class {
	#name : #FUScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #hooks }
FUScreenComponent >> children [
	^ { header }

]

{ #category : #'as yet unclassified' }
FUScreenComponent >> createHeaderComponent [
	^ FUHeaderComponent new

]

{ #category : #initialization }
FUScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
FUScreenComponent >> renderContentOn: html [
	html render: header

]
