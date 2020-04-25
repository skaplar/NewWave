Class {
	#name : #Membership,
	#superclass : #Object,
	#instVars : [
		'groupId',
		'userId'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #accessing }
Membership class >> neoJsonMapping: mapper [
	mapper for: #ArrayOfMemberships
			customDo: [ :mapping | mapping listOfElementSchema: self ].
	
]

{ #category : #accessing }
Membership >> groupId [ 
	^ groupId.
]

{ #category : #accessing }
Membership >> groupId: aGroupId [
	groupId := aGroupId.
]

{ #category : #accessing }
Membership >> userId [
	^ userId.
]

{ #category : #accessing }
Membership >> userId: anUserId [
	userId:= anUserId.
]
