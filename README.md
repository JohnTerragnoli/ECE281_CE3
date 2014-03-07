ECE281_CE3
==========


#**Purpose**

The purpose of this computer exercise was to construct, using VHDL, the logic for an elevator.  This elevator will be able to travel to 4 different floors. It uses a clock, has the inputs, don't move, move up or down, and also records the floor that it is currently on.  

This machine was created in two different ways.  One way used a Moore machine and the other used a Mealy machine.  Difference between a Moore and a Mealy machine is that the outputs in a Moore machine are determined only by the state of the system.  On the other hand, the outputs for mealy machines are dependent on the state of the system and the inputs of a system.   

The process of their construction and their results can be seen below: 


#**Moore Machine Construction**
A shell/template of the Moore machine was used to create the actual code for the Moore machine.  This code can be seen here:  https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Original%20MooreElevatorController_Shell.vhd

This code was then altered to remove some of the lines that might produce errors later in the future, and also to complete the instructsions for the elevator if it is on the third or fourth floor.  The floors are considered the states in this finite state machine.  The diagram of the finite state machine can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/FiniteStateDiagram.PNG "Finite State Diagram")


The information from this diagram was used to code the behavior of the elevator when on the third and fourth floors given various inputs.  


The code that defines the behavior of the elevator through the Moore model can be seen here: 
https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/MooreElevatorController_Shell.vhd   

Some important changes were made to the code aside from adding the behavior of the elevator on the third and fourth floors.  Insead of using an "and" statemnent in the logic to determin if the clock is a a rising edge, the code was simply changed to "RISING_EDGE(CLK)".  This wording is more precise and will prevent future confusion when other users try to add to this code. Also, at the bottom of the code, the output of the system was related to the state of the system.  This completed the Moore diagram.  

#**Questions*
Is reset synchronous or asynchronous? 
It is synchronous because the logic involving the reset only occurs on the rising edge of a clock, thus ensuring that it is in sync with the clock.  






#**Documentation**
C3C Hunter Her Helped me understand that the nextFloor logic was simply predicting what the next floor would be for the elevator given the current state and conditions.  He said that he aquired this information from Dr. Neebel.  

