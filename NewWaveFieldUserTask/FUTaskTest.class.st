Class {
	#name : #FUTaskTest,
	#superclass : #TestCase,
	#category : #'NewWaveFieldUserTask-Tests'
}

{ #category : #accessing }
FUTaskTest >> testSettingVariablesValues [
| task taskDone |
task := FUTask new.
taskDone := FUTask
	status: 'done'.
self assert: task status equals: 'waiting' .
self assert: taskDone status equals: 'done' .

]
