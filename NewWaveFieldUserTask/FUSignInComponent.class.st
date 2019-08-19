Class {
	#name : #FUSignInComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'username',
		'password',
		'component',
		'showLoginError'
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

{ #category : #operations }
FUSignInComponent >> goToAllTasksView: aUser [ 
	self call: (FUAllUserTasksComponent new tasks: aUser tasks)
]

{ #category : #testing }
FUSignInComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]

]

{ #category : #operations }
FUSignInComponent >> loginErrorMessage [
	^ 'Credentials must be wrong. Try again'
]

{ #category : #comparing }
FUSignInComponent >> loginErrorOccurred [
	showLoginError := true

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
	self session isLogged 
	ifTrue: [ self goToAllTasksView: self session currentlyLoggedUser ]
	ifFalse: [ 
		super renderContentOn: html.
		html tbsContainer: [
			html heading: 'Sign in'.
			html horizontalRule.
			self renderSignInForm: html]
	]
]

{ #category : #rendering }
FUSignInComponent >> renderLoginErrorMessageIfAnyOn: html [
	self hasLoginError ifTrue: [
		showLoginError := false.
		html html: '<br><br>'.
		html tbsAlert   
		beDanger ;
		with: self loginErrorMessage
	]

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
					html tbsModalFooter: [ 
						self renderButtonsOn: html.
						self renderLoginErrorMessageIfAnyOn: html.]
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

{ #category : #operations }
FUSignInComponent >> tryConnectionWithUsername: aUsername andPassword: aPassword [
	|user|
	user := FUApplication current getUserWithUsername: aUsername 
					andPassword: (SHA256 hashMessage: aPassword).
	user isNil 
		ifTrue: [ self loginErrorOccurred ]
		ifFalse: [ self session currentlyLoggedUser: user.
						self goToAllTasksView: user ]
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
	^ self tryConnectionWithUsername: self username andPassword: self password
]
