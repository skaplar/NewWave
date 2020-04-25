Extension { #name : #NWCustomTaskEventBehavior }

{ #category : #'*NewWave-UserManagment' }
NWCustomTaskEventBehavior >> isUserAssigned: anAssignedUser plugin: loadUserManagment [
	^ loadUserManagment findUser: anAssignedUser.
]

{ #category : #'*NewWave-UserManagment' }
NWCustomTaskEventBehavior >> taskHasUserOrGroup: aTask [
	"This is where we check if the task has assigned a User. If it has everything is ok. 
	However, it is allowed only group to be assigned. In that case we set the user to NullUser and continue.
	The problem is when nor user nor group are assigned. Then false is returned."
	aTask user isNotNil ifTrue: [ ^ true ].
	aTask group isNotNil ifTrue: [  
		aTask user: NWNullUser new.
		^ true.
		].
	^ false.
]
