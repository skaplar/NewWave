Class {
	#name : #NWUserManagementDict,
	#superclass : #Object,
	#instVars : [
		'userManagementsDict'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #initialization }
NWUserManagementDict >> addNewUserManagement: aManagement withName: aName [
	userManagementsDict at: aName put: aManagement.
]

{ #category : #initialization }
NWUserManagementDict >> findUserManagementByName: aUserManagementName [
	^ userManagementsDict at: aUserManagementName.
]

{ #category : #initialization }
NWUserManagementDict >> initialize [ 
	super initialize.
	userManagementsDict := Dictionary new. 
]

{ #category : #initialization }
NWUserManagementDict >> userManagementsDict [
	^ userManagementsDict
]
