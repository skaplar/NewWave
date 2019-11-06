Class {
	#name : #FUUserTest,
	#superclass : #TestCase,
	#category : #'NewWaveFieldUserTask-Tests'
}

{ #category : #tests }
FUUserTest >> testAddingUser [
	| user |
	user := FUApplication current createUserWithUsername: 'test' 
					andPassword: (SHA256 hashMessage: 'test').
	self assert: user notNil
	
	
]

{ #category : #tests }
FUUserTest >> testCreatingUser [
	| user |
	user := FUUser 
		username: 'test' 
		password: 'test'.
	self assert: user username equals: 'test'.
	self assert: user password equals: 'test'
	
	
]
