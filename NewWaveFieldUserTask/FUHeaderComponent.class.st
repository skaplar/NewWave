Class {
	#name : #FUHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #accessing }
FUHeaderComponent >> component [
	^ component


]

{ #category : #accessing }
FUHeaderComponent >> component: anObject [
	component := anObject

]

{ #category : #'as yet unclassified' }
FUHeaderComponent >> goToSignUpView [
]

{ #category : #rendering }
FUHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [
		html tbsNavbarBrand
			url: self application url;
			with: 'NewWave - process engine'
	]

]

{ #category : #rendering }
FUHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			html tbsColumn
				extraSmallSize: 11;
				smallSize: 10;
				mediumSize: 11;
			with: [self renderBrandOn: html].
			html tbsColumn
				extraSmallSize: 11;
				smallSize: 1;
				mediumSize: 1;
			with: [self renderSignUp: html]
		]
	]

]

{ #category : #rendering }
FUHeaderComponent >> renderSignUp: html [
	html tbsNavbarHeader: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToSignUpView ];
			with: [
				html text: ' SignUp' ]
		]

	
]
