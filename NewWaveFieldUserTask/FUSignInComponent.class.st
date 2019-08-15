Class {
	#name : #FUSignInComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'username',
		'password',
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUSignInComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself

]

{ #category : #accessing }
FUSignInComponent >> component [
	^ component

]

{ #category : #accessing }
FUSignInComponent >> component: aComponent [
	component := aComponent 


]

{ #category : #accessing }
FUSignInComponent >> password [ 		
	^ password
]

{ #category : #accessing }
FUSignInComponent >> password: aPassword [
	password := aPassword 
]

{ #category : #rendering }
FUSignInComponent >> renderButtonsOn: html [
	html tbsSubmitButton
	bePrimary;
	callback: [ self validate ];
	value: 'SignIn'

]

{ #category : #rendering }
FUSignInComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Sign in'.
		html horizontalRule.
		self renderSignInForm: html]
]

{ #category : #rendering }
FUSignInComponent >> renderPasswordField: html [
	html tbsFormGroup: [
		html label with: 'Password'.
		html passwordInput
		tbsFormControl;
		callback: [ :value | password := value ];
		value: password 
	]

]

{ #category : #rendering }
FUSignInComponent >> renderSignInForm: html [
	html tbsContainer: [
			html tbsColumn
				extraSmallSize: 0;
				smallSize: 2;
				mediumSize: 4. 
			html tbsColumn
				extraSmallSize: 12;
				smallSize: 8;
				mediumSize: 4;
			with: [ 
				html tbsModalBody: [
				html tbsForm: [
					self renderUsernameField: html.
					self renderPasswordField: html.
					html tbsModalFooter: [ self renderButtonsOn: html ]
					] 
				]
			].		
			html tbsColumn
				extraSmallSize: 0;
				smallSize: 2;
				mediumSize: 4. 
	
 	]
]

{ #category : #rendering }
FUSignInComponent >> renderUsernameField: html [
	html tbsFormGroup: [ 
		html label with: 'Username'.
		html textInput tbsFormControl;
		attributeAt: 'autofocus' put: 'true';
		callback: [ :value | username := value ];
		value: username 
	]
]

{ #category : #accessing }
FUSignInComponent >> username [ 
	^ username
]

{ #category : #accessing }
FUSignInComponent >> username: anUsername [
	username := anUsername 
]

{ #category : #accessing }
FUSignInComponent >> validate [
	"^ component tryConnectionWithLogin: self account andPassword: self password"
	^ true
]
