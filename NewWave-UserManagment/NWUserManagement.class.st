Class {
	#name : #NWUserManagement,
	#superclass : #Object,
	#instVars : [
		'groups',
		'users',
		'engine',
		'pathToUsers',
		'pathToGroups',
		'memberships'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #'as yet unclassified' }
NWUserManagement class >> pathToUsers: aPathToUsers pathToGroups: aPathToGroups pathToMemberships: aPathToMembership [
	^ self new  
		loadGroups: aPathToGroups;
		loadUsers: aPathToUsers;
		loadMemberships: aPathToMembership;
		yourself.
	
]

{ #category : #'as yet unclassified' }
NWUserManagement class >> waveEngine: aWaveEngine pathToUsers: aPathToUsers pathToGroups: aPathToGroups pathToMemberships: aPathToMembership [
	^ self new  
		initializeEngine: aWaveEngine pathToGroups: aPathToGroups pathToUsers: aPathToUsers pathToMemberships: aPathToMembership;
		yourself.
	
]

{ #category : #adding }
NWUserManagement >> addGroup: aGroup [
	groups add: aGroup.
]

{ #category : #adding }
NWUserManagement >> addMembership: aMembership [
	memberships  add: aMembership.
]

{ #category : #adding }
NWUserManagement >> addUser: anUser [
	users add: anUser 
]

{ #category : #accessing }
NWUserManagement >> engine [ 
	^ engine .
	
]

{ #category : #accessing }
NWUserManagement >> engine: aWaveEngine [
	engine := aWaveEngine 
]

{ #category : #'as yet unclassified' }
NWUserManagement >> findGroup: aGroupId [
	^ groups detect: [ :each | each groupId = aGroupId  ]
]

{ #category : #'as yet unclassified' }
NWUserManagement >> findUser: anUserId [
	^ users  detect: [ :each | each userId = anUserId ]
]

{ #category : #'as yet unclassified' }
NWUserManagement >> findUserByName: aUserName [
	^ users detect: [ :each | each username = aUserName ]
]

{ #category : #accessing }
NWUserManagement >> groups [ 	
	^ groups
]

{ #category : #initialization }
NWUserManagement >> initialize [
	super initialize.
	users := OrderedCollection new.
	groups := OrderedCollection new.
	memberships := OrderedCollection new.
]

{ #category : #initialization }
NWUserManagement >> initializeEngine: anEngine pathToGroups: aPathToGroups pathToUsers: aPathToUsers pathToMemberships: aPathToMembership [
	self initialize.
	users:= self loadUsers: aPathToUsers.
	groups:= self loadGroups: aPathToGroups.
	memberships:= self loadMemberships: aPathToMembership.
	engine:= anEngine.  
]

{ #category : #'as yet unclassified' }
NWUserManagement >> loadGroups: pathToFile [
	^ groups :=pathToFile asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		listClass: OrderedCollection;
		for: #ArrayOfGroups
			customDo: [ :mapping | mapping listOfElementSchema: Group ];
		 nextAs: #ArrayOfGroups ].
]

{ #category : #'as yet unclassified' }
NWUserManagement >> loadMemberships: pathToMemberships [
	^ memberships:= pathToMemberships asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		mapInstVarsFor: Membership ;
		listClass: OrderedCollection;
		for: #OrderedCollectionOfMembership
			customDo: [ :mapping | mapping listOfElementSchema: Membership ];
		 nextAs: #OrderedCollectionOfMembership ].
]

{ #category : #'as yet unclassified' }
NWUserManagement >> loadUsers: pathToFile [
	^ users := pathToFile asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		mapInstVarsFor: NWUser;
		listClass: OrderedCollection;
		for: #ArrayOfUsers
			customDo: [ :mapping | mapping listOfElementSchema: NWUser ];
		 nextAs: #ArrayOfUsers ].	
]

{ #category : #accessing }
NWUserManagement >> memberships [
	^ memberships 
]

{ #category : #accessing }
NWUserManagement >> pathToGroups [
	^ pathToGroups.
]

{ #category : #accessing }
NWUserManagement >> pathToGroups: aPathToGroups [
	pathToGroups:= aPathToGroups
]

{ #category : #accessing }
NWUserManagement >> pathToUsers [
	^ pathToUsers.
]

{ #category : #accessing }
NWUserManagement >> pathToUsers: aPathToUsers [
	pathToUsers:= aPathToUsers
]

{ #category : #accessing }
NWUserManagement >> users [ 
	^ users  
]
