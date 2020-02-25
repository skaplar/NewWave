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
				extraSmallSize: 5;
				smallSize: 5;
				mediumSize: 5;
			with: [self renderBrandOn: html].
			html tbsColumn tbsDropdown: [ 
				html tbsDropdownAnchor with: [html text: 'Tasks '; tbsCaret].
				html tbsDropdownMenu: [ 		 
					html tbsDropdownMenuItem: [ html anchor callback: [ component call: (FUAllTasksListComponent new) ]; with: 'User tasks.'  ].
					html tbsDropdownMenuItem: [ html anchor callback: [ component call: (FUAllTasksByGroupListComponent new) ]; with: 'Group tasks.'  ].
				].
			].
			html tbsColumn
				extraSmallSize: 5;
				smallSize: 5;
				mediumSize: 5;
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
