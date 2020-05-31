Extension { #name : #WaveEngine }

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> loadDefaultUsersAndGroups [
	"This is the default management."
	pluginData
		at: #NWUserManagement
		put: UserManagment new defineDefaultUserManagement.
]

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> loadUsersAndGroups [
	"This is the default management."
	pluginData
		at: #NWUserManagement
		put: (NWUserManagement
			  						   pathToUsers:'/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/users.json'
										pathToGroups: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/groups.json'
										pathToMemberships: '/Users/sebastijan.kaplar/Desktop/NewWave-UserManagement/membership.json'
										).
]

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> loadUsersAndGroups: aNWUserManagement [
	pluginData
		at: #NWUserManagement
		put: aNWUserManagement.
]

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> userManagement [  
	^ pluginData at: #NWUserManagement.

		
]
