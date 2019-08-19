Class {
	#name : #FUSignUpComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'username',
		'password',
		'passwordRepeated',
		'showSignUpError',
		'errorMessage',
		'component'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUSignUpComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #accessing }
FUSignUpComponent >> component [
	^ component
]

{ #category : #accessing }
FUSignUpComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #accessing }
FUSignUpComponent >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
FUSignUpComponent >> errorMessage: aMessage [
	errorMessage := aMessage 
]

{ #category : #operations }
FUSignUpComponent >> goToAllTasksView: aUser [ 
	self call: (FUAllUserTasksComponent new tasks: aUser tasks)
]

{ #category : #testing }
FUSignUpComponent >> hasSignUpError [
	^ showSignUpError ifNil: [ false ]
]

{ #category : #accessing }
FUSignUpComponent >> password [ 	
	^password
]

{ #category : #accessing }
FUSignUpComponent >> password: aPassword [	
	password := aPassword 
]

{ #category : #rendering }
FUSignUpComponent >> renderButtonsOn: html [
	html tbsSubmitButton
	bePrimary;
	callback: [ self validate ];
	value: 'SignIn'
]

{ #category : #rendering }
FUSignUpComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Create new user account. Sign up here'.
		html horizontalRule.
		self renderSignUpForm: html]
]

{ #category : #rendering }
FUSignUpComponent >> renderPasswordField: html [
	html tbsFormGroup: [
		html label with: 'Password'.
		html passwordInput
		tbsFormControl;
		callback: [ :value | password := value ];
		value: password 
	]
]

{ #category : #rendering }
FUSignUpComponent >> renderRepeatPasswordField: html [
	html tbsFormGroup: [
		html label with: 'Repeat password'.
		html passwordInput
		tbsFormControl;
		callback: [ :value | passwordRepeated := value ];
		value: passwordRepeated 
	]
]

{ #category : #rendering }
FUSignUpComponent >> renderSignUpErrorMessageIfAnyOn: html [
	self hasSignUpError ifTrue: [
		showSignUpError := false.
		html html: '<br><br>'.
		html tbsAlert   
		beDanger ;
		with: self errorMessage 
	]
]

{ #category : #rendering }
FUSignUpComponent >> renderSignUpForm: html [
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
					self renderRepeatPasswordField: html.
					html tbsModalFooter: [ 
						self renderButtonsOn: html.
						self renderSignUpErrorMessageIfAnyOn: html.]
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
FUSignUpComponent >> renderUsernameField: html [
	html tbsFormGroup: [ 
		html label with: 'New username'.
		html textInput tbsFormControl;
		attributeAt: 'autofocus' put: 'true';
		callback: [ :value | username := value ];
		value: username 
	]
]

{ #category : #comparing }
FUSignUpComponent >> signUpErrorOccurred [
	showSignUpError := true
]

{ #category : #'as yet unclassified' }
FUSignUpComponent >> tryCreatingUserWithUsername: aUsername andPassword: aPassword [
	|user|
	user := FUApplication current createUserWithUsername: aUsername 
					andPassword: (SHA256 hashMessage: aPassword).
	user isNil 
		ifTrue: [ self signUpErrorOccurred ]
		ifFalse: [ self session currentlyLoggedUser: user.
						self goToAllTasksView: user ]
]

{ #category : #accessing }
FUSignUpComponent >> username [ 
	^ username
]

{ #category : #accessing }
FUSignUpComponent >> username: anUsername [
	username := anUsername
]

{ #category : #accessing }
FUSignUpComponent >> validate [
	password = passwordRepeated 
	ifTrue: [
			^ self validateUniqueRequest: self username andPassword: self password
		 ]
	ifFalse: [ 
		self errorMessage: 'Passwords are not matching'.
		self signUpErrorOccurred ]
	
]

{ #category : #'as yet unclassified' }
FUSignUpComponent >> validateUniqueRequest: aUsername andPassword: aPassword [
	(FUApplication current isUsernameUnique: aUsername)
		ifTrue: [  
			^ self tryCreatingUserWithUsername: self username andPassword: self password]
		ifFalse: [ 
			self errorMessage: 'Try different username.'.
			self signUpErrorOccurred ]
]
