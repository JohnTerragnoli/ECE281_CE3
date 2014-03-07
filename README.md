ECE281_CE3
==========


#**Purpose**

The purpose of this computer exercise was to construct, using VHDL, the logic for an elevator.  This elevator will be able to travel to 4 different floors. It uses a clock, has the inputs, don't move, move up or down, and also records the floor that it is currently on.  

This machine was created in two different ways.  One way used a Moore machine and the other used a Mealy machine.  The process of their construction and their results can be seen below: 


#**Moore Machine Construction**
A shell/template of the Moore machine was used to create the actual code for the Moore machine.  This code can be seen here:  https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Original%20MooreElevatorController_Shell.vhd

This code was then altered to remove some of the lines that might produce errors later in the future, and also to complete the instructsions for the elevator if it is on the third or fourth floor.  The floors are considered the states in this finite state machine.  The diagram of the finite state machine can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/FiniteStateDiagram.PNG "Finite State Diagram")


The information from this diagram was used to code the behavior of the elevator when on the third and fourth floors given various inputs.  

