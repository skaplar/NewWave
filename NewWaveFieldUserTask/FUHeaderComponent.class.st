Class {
	#name : #FUHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUHeaderComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

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
	component call: FUSignUpComponent new
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
	html tbsNavbar beDefault; 
	with: [
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
	self session isLogged
	ifTrue: [ 
		html form: [
			html tbsNavbarButton
			tbsPullRight;
			callback:  [self session reset] ;
			with: ' SignOut'  ]
		]
	ifFalse: [ 		
		html form: [ 
			html tbsNavbarButton
			tbsPullRight;
			callback: [self goToSignUpView] ;
			with: ' SignUp'  ]
		]
]
