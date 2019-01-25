# NewWave

Workflow engine written in Pharo. Still in early development. 

## Example

In order to run the engine, for the minimal execution you need create Start and End, with the Sequence connecting them.


```smalltalk
start := StartEvent new.
start description: 'StartEvent'.

end := EndEvent new.
end description: 'End Event ee'.

seq1 := Sequence source: start target: end.
start addOutgoingFlow: seq1.
end addIncomingFlow: seq1. 

engine := WaveEngine new.
we := WaveExecutor initialNode: start.
engine addExecutor: we.
engine startEngine.
```

WaveExecutor is the executor for the engine, and it needs the node from which will start executing. 
In the example initialNode is named `start`. We supply the executor to the engine by calling `addExecutor:` and simply 
run the engine with `engine startEngine.`

Additional examples are in the `ExampleExecutions` class. 
We execute example by calling

```smalltalk
| e |
e := ExampleExecutions new.
e startExample1.
```

Output of the examples is in the `Transcript` for now.
