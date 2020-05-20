Class {
	#name : #Group,
	#superclass : #Object,
	#instVars : [
		'groupId',
		'groupName',
		'users',
		'subgroups'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #accessing }
Group class >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: #ArrayOfGroups
			customDo: [ :mapping | mapping listOfElementSchema: self ].
	
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(groupId groupName users).
		(mapping mapInstVar: #subgroups) valueSchema: #ArrayOfGroups ].
	
		
]

{ #category : #adding }
Group >> addUser: anElement [
	users add: anElement.
]

{ #category : #accessing }
Group >> groupId [
	^ groupId
]

{ #category : #accessing }
Group >> groupId: aGroupId [
	groupId := aGroupId
]

{ #category : #accessing }
Group >> groupName [ 
	^ groupName
]

{ #category : #accessing }
Group >> groupName: aName [
	groupName := aName
]

{ #category : #initialization }
Group >> initialize [
	super initialize.
	
]

{ #category : #accessing }
Group >> neoJsonMapping: mapper [
	"For inheritance mapping to work, the schema/classname must be self,
	but the instance variables have to be enumerated manually per class"
	mapper for: #ArrayOfGroups do: [ :mapping |
		mapping mapInstVars: #(groupId groupName users subgroups) ] 
]

{ #category : #accessing }
Group >> subgroups [
	^ subgroups 
]

{ #category : #accessing }
Group >> users [ 	
	^ users
]
