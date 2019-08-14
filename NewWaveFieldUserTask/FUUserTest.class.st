Class {
	#name : #FUUserTest,
	#superclass : #TestCase,
	#category : #'NewWaveFieldUserTask-Tests'
}

{ #category : #tests }
FUUserTest >> testCreatingUser [
	| user |
	user := FUUser 
		username: 'test' 
		password: 'test'.
	self assert: user username equals: 'test'.
	self assert: user password equals: 'test'
	
	
]

{ #category : #tests }
FUUserTest >> testCreatingUserAndTask [
	| user task|
	user := FUUser 
		username: 'test' 
		password: 'test'.
	task := FUTask 
		status: 'waiting'.
	user addTask: task.
	self assert: user getWaitingTasksSize = 1.
	
]

{ #category : #tests }
FUUserTest >> testCreatingUserTasks [
	| user task0 task1 task2|
	user := FUUser 
		username: 'test' 
		password: 'test'.
	task0 := FUTask 
		status: 'waiting'.
	user addTask: task0.
	task1 := FUTask 
		status: 'done'.
	user addTask: task1.
	task2 := FUTask new.
	user addTask: task2.
	
	self assert: user getWaitingTasksSize = 2.
	
]
