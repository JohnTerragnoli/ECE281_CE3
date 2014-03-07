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


After this code was written, it was necessary to test the code.  To do this, a testbench was created that would "bring the elevator up to the top from the bottom floor, stopping for a clock cycle at each floor, and then back down without any stops".  The testbench was created to be self-checking.  Any errors that occured in the Moore machine would be directly brought to the user's attention through the console.  The code for this testbench can be seen here: https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Moore_testbench_Terragnoli.vhd


This testbench was then implimented.  The results can be seen in the picture below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/MooreTestbenchSnapchat.PNG "Results from Moore")

The results were compared with the sample results give in the lab.  These sample results can be seen here: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/ExampleScreenShot.PNG "Sample Results")

The results from the created Moore Machine exactly matched those from the example.  Also, none of the self-checking assertions in the testbench raised alarm.  Also, each and every testcase was examine to ensure that it had a logical output that conqured with the state diagram given in the instructions. Therefore, the Moore Machine must have been built right.  


#**Mealy Machine**
Once the Moore Machine was perfected, the same program was made using a Mealy Machine.  To do this, a shell was use, simpilarily to the creation of the Moore machine, to start out the program.  This shell can be seen here: https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Original%20MealyElevatorController_Shell.vhd  


The code deciding the present floor state in the Moore machine was copied and used in the Mealy machine to also define the present floor state.  This was used to find the output of the module, or the present floor that the elevator was on.  

Since a Mealy Machine uses its inputs directly to influence the outputs, this was done in this program.  The inputs were used, using logic, to define the nextfloor logic of the elevator.  This was then used as an output to the module.  The code for this module can be seen here: https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/MooreElevatorController_Shell.vhd


Once this logic was made, it became necessary to test it.  No example was given to compare to.  However, since the nextFloor logic was supposed to predict the next state the elevator would move to, given the present state and the inputs, the deisred outcomes were easy to analyze and figure out.  Thus, another self-checking testbench was created.  All of the outputs seemed logical.  Each and every testcase was examine to ensure that it had a logical output that conqured with the state diagram given in the instructions.  A visual represenation of these outputs can be seen below:  

![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Mealy_Testbench_Terragnoli_screenshot1.PNG "Mealy Simulation Results")

![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_CE3/master/Mealy_Testbench_Terragnoli_screenshot2.PNG "Mealy Simulation Results2")


Something that was interesting about these results was that the output from the Moore machine would only change on a rising edge, which the nextfloor output would change whenever the conditions dictated by the states and its inputs allowed it to.  



#**Questions**
Is reset synchronous or asynchronous? 
It is synchronous because the logic involving the reset only occurs on the rising edge of a clock, thus ensuring that it is in sync with the clock.  

Was the code for the next state of the Moore Machine the same for that of the Mealy machine?  
Yes, the same code was used.  However, when predicting the nextfloor of the system, other logic was used.  

#**Important Notes**
When designing the logic for this computer exercise, extra caution was used to ensure that no cases were left unspecified.  This way no decisions were left up to the computer/complier, which might decide to create latches or memory where there should not be any, which would create problems in the implementation and the future of the program.  
For some reason most of the self-checking testbenches were not returning true.  I did notice, however, that the tests seemed to be reading the value from slightly prior to where whey were supposed to be checking.  I did check all of the results manually, however, and they seemed accurate.  






#**Documentation**
C3C Hunter Her Helped me understand that the nextFloor logic was simply predicting what the next floor would be for the elevator given the current state and conditions.  He said that he aquired this information from Dr. Neebel.  

