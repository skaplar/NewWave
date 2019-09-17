Class {
	#name : #FUApplication,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
FUApplication class >> createDemo [
| df1 df2 df3 df4 df5 df6 df7 df8 ordCol|

df1 := FUDataField new.
df1 label: 'First Name'.
df1 type: 'string'.
df1 fieldID: 'first_name_89234u34'.
df1 defaultValue: nil.
df1 optionValues: nil.
df1 result: ''.

df2 := FUDataField new.
df2 label: 'Last Name'.
df2 type: 'string'.
df2 fieldID: 'last_name_6432kl23'.
df2 defaultValue: nil.
df2 optionValues: nil.
df2 result: ''.

df3 := FUDataField new.
df3 label: 'Gender'.
df3 type: 'singleOption'.
df3 fieldID: 'gender_ji3b254054'.
df3 defaultValue: 'Male'.
ordCol := OrderedCollection new add: 'Male'; add: 'Female'.
df3 optionValues: ordCol.
df3 result: ''.

df4 := FUDataField new.
df4 label: 'Email'.
df4 type: 'email'.
df4 fieldID: 'email_or8e3r23'.
df4 defaultValue: nil.
df4 optionValues: nil.
df4 result: ''.

df5 := FUDataField new.
df5 label: 'Phone number'.
df5 type: 'phone'.
df5 fieldID: 'phone_number_9423ujfd'.
df5 defaultValue: nil.
df5 optionValues: nil.
df5 result: ''.

df6 := FUDataField new.
df6 label: 'Date of Birth'.
df6 type: 'date'.
df6 fieldID: 'date_of_birth_jr04udf92'.
df6 defaultValue: nil.
df6 optionValues: nil.
df6 result: ''.

df7 := FUDataField new.
df7 label: 'Height'.
df7 type: 'number'.
df7 fieldID: 'height_idofs943'.
df7 defaultValue: nil.
df7 optionValues: nil.
df7 result: ''.

df8 := FUDataField new.
df8 label: 'Has insurance'.
df8 type: 'boolean'.
df8 fieldID: 'has_insurance_745c1du4'.
df8 defaultValue: nil.
df8 optionValues: nil.
df8 result: ''.


self current
	addUser: ((FUUser username: 'user1' password: (SHA256 hashMessage: 'user1')) 
		addTask: (FUDataTask new taskID: 4123; userID: 'user1'; details: 'Give us basic information about you.'; addDataField: df1; addDataField: df2; addDataField: df3; addDataField: df4; addDataField: df5; addDataField: df6; addDataField: df7; addDataField: df8);
		addTask: (FUDataTask new taskID: 6420; userID: 'user1'; details: 'Confirm your identity.'; addDataField: df1; addDataField: df2; addDataField: df4));
	addUser: ((FUUser username: 'user2' password: (SHA256 hashMessage: 'user2')) 
		addTask: (FUDataTask new taskID: 7546; userID: 'user2'; details: 'Give us basic information about you.'; addDataField: df1; addDataField: df2; addDataField: df3; addDataField: df4; addDataField: df5; addDataField: df6; addDataField: df7; addDataField: df8);
		addTask: (FUDataTask new taskID: 6251; userID: 'user2'; details: 'Give us the basic health information.'; addDataField: df3; addDataField: df6; addDataField: df7; addDataField: df8))
]

{ #category : #accessing }
FUApplication class >> current [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]

]

{ #category : #'class initialization' }
FUApplication class >> initialize [
	self reset

]

{ #category : #initialization }
FUApplication class >> reset [
	uniqueInstance := nil
]

{ #category : #adding }
FUApplication >> addTask: aTask [
	| aUser |
	aUser := self findUser: (aTask userID).
	aUser isNil 
		ifTrue: [ ^ 'BAD REQUEST' ].
	aUser addTask: aTask.
	^ 'OK'
	
]

{ #category : #adding }
FUApplication >> addUser: anUser [
	self users at: (anUser username asString) put: anUser. 
	^ 'OK'
]

{ #category : #'as yet unclassified' }
FUApplication >> createUserWithUsername: aUsername andPassword: aPassword [
	| newUser |
	newUser := FUUser new
		username: aUsername;
		password: aPassword;
		tasks: OrderedCollection new.
	self addUser: newUser.
	^ newUser 
		
	
]

{ #category : #'as yet unclassified' }
FUApplication >> findUser: aUserID [
	| user |
	user := users at: aUserID ifAbsent: nil.
	^ user
]

{ #category : #operations }
FUApplication >> getUserWithUsername: aUsername andPassword: aPassword [
	| user userList|
	user := users at: aUsername ifAbsent: nil.
	user isNil 
		ifTrue: [^ nil].
	user password = aPassword
		ifTrue: [^ user]
		ifFalse: [^ nil]
]

{ #category : #initialization }
FUApplication >> initialize [
	super initialize.
	users := Dictionary new
]

{ #category : #testing }
FUApplication >> isUsernameUnique: aUsername [
	| user |
	user := users at: aUsername ifAbsent: nil.
	^ user isNil
	
]

{ #category : #testing }
FUApplication >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
FUApplication >> users [
	^ users 
]

{ #category : #accessing }
FUApplication >> users: anUsers [
	users := anUsers 
]
