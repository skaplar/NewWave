Class {
	#name : #UserManagment,
	#superclass : #Object,
	#category : #'NewWave-UserManagment-Example'
}

{ #category : #'as yet unclassified' }
UserManagment >> defineUserManagement [
	| se t1 adresa1 do ee proc1 engine user1 user2 user3 user4 user5 group1 group2 group3 group4 group5 |

	engine := WaveEngine new.
	engine loadUsersAndGroups.
	
	user1 := NWUser new.
	user1 userId: '1'.
	user1 firstname: 'Lazar'.
	user1 lastname: 'Lazarevic'.
	user1 email: 'laza@laza.com'.
	user1 username: 'test'.
	user1 password: 'test'.
	engine userManagement addUser: user1.
	
	
	user2 := NWUser new.
	user2 userId: '2'.
	user2 firstname: 'Nikola'.
	user2 lastname: 'Nikolic'.
	user2 email: 'nikola@nikolic.com'.
	user2 username: 'test'.
	user2 password: 'test'.
	engine userManagement addUser: user2.
	
	user3 := NWUser new.
	user3 userId: '3'.
	user3 firstname: 'Marko'.
	user3 lastname: 'Markovic'.
	user3 email: 'mark@mark.com'.
	user3 username: 'test'.
	user3 password: 'test'.
	engine userManagement addUser: user3.
	
	user4 := NWUser new.
	user4 userId: '4'.
	user4 firstname: 'Milos'.
	user4 lastname: 'Milosevic'.
	user4 email: 'milos@misa.com'.	
	user4 username: 'test'.
	user4 password: 'test'.
	engine userManagement addUser: user4.
	
	user5 := NWUser new.
	user5 userId: '5'.
	user5 firstname: 'Nemanja'.
	user5 lastname: 'Nemanjic'.
	user5 username: 'test'.
	user5 password: 'test'.
	user5 email: 'nemanja@nemanja.com'.
	engine userManagement addUser: user5.

	group1 := Group new.
	group1 groupId: '1'.
	group1 groupName: 'admin'.
	engine userManagement addGroup: group1.
	
	group2 := Group new.
	group2 groupId: '2'.
	group2 groupName: 'HR'.
	engine userManagement addGroup: group2.
	
	group3 := Group new.
	group3 groupId: '3'.
	group3 groupName: 'user'.
	engine userManagement addGroup: group3.
	
	group4 := Group new.
	group4 groupId: '4'.
	group4 groupName: 'manufacturer'.
	engine userManagement addGroup: group4.
	
	group5 := Group new.
	group5 groupId: '5'.
	group5 groupName: 'gold user'.
	engine userManagement addGroup: group5.
	
	se := NWStartEvent new.
	se description: 'Start'.

	t1 := NWUserTask new.
	t1 description: 'BA'.
	t1 name: 'Taskerinoa'.
	t1 group: group1.
	t1 user: user1.
	adresa1 := Adresa example2.

	do := NWDataObject new.
	do itemDef structureRef: adresa1. 
	do valuedDataObject: adresa1.
	do name: 'Adresa example2'.

		
	t1 addDataOutputAssociation: do.

	t1 value: 'Adresica value'.

	ee := NWEndEvent new.
	ee description: 'End'.
	
	se addOutgoingEdge: t1.
	t1 addOutgoingEdge: ee.
	
	proc1 := NWProcess id: '2' name: 'Process 2' initialFlowElement: se.
	proc1 addDataObject: do.

	FUApplicationRootComponent initialize.
	FUApplication createDemo.

	engine addProcess: proc1 name: (proc1 processInstanceId). 
	engine startTeapotServer.
	engine startProcess: (proc1 processInstanceId).
]
