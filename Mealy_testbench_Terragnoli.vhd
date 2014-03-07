--------------------------------------------------------------------------------
-- Company: ECE281 Dream Team
-- Engineer: C3C John Paul Terragnoli 
--
-- Create Date:   00:02:11 03/07/2014
-- Design Name:   Mealy_testbench_Terragnoli
-- Module Name:   C:/Users/C16John.Terragnoli/Documents/Documents/My Documents/Academics/Sophomore Year/Spring Semester/ECE 281/ISE Project Stuff/CE3_Terragnoli/Mealy_testbench_Terragnoli.vhd
-- Project Name:  CE3_Terragnoli
-- Target Device:  MealyElevatorController.vhd
-- Tool versions:  1.0
-- Description:   tests the MealyElevatorController.vhd file.  
-- 
-- VHDL Test Bench Created by ISE for module: MealyElevatorController_Shell
-- 
-- Dependencies:MealyElevatorController.vhd
-- 
-- Revision: NONE
-- Revision 0.01 - File Created
-- Additional Comments:NONE
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mealy_testbench_Terragnoli IS
END Mealy_testbench_Terragnoli;
 
ARCHITECTURE behavior OF Mealy_testbench_Terragnoli IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MealyElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0);
         nextfloor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);
   signal nextfloor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: MealyElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor,
          nextfloor => nextfloor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 
 ----------------------------------------------------------------
 --THE TEST CASES FOR THIS TESTBENCH ARE THE SAME AS FOR THE MOORE MACHINE, 
 --SINCE IT IS CREATED THE PROGRAM FOR THE SAME THING.  
 ---------------------------------------------------------------- 


   -- Stimulus process
   stim_proc: process
   begin		
           -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		
		--the initial reset.  
		--this is the first case starting on floor one.  
		reset <= '1'; 
		stop <= '0'; 
		up_down <= '0'; 
		wait for clk_period;
		--checking the floor: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
		
				--checking the nextfloor: 
		assert (nextfloor = "0001")report
			"nextfloor  hhmmmm is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0001";
		
		
		
		
		
		--now we want to start going up.  
		reset <= '0';
		stop <= '0'; 
		up_down <='1';
			--checking the nextfloor: 
		assert (nextfloor = "0010")report
			"nextfloor  ummmm is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0010";
		
		
		--checking the floor: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
			wait for clk_period/2;
					--checking the nextfloor: 
					
					
		assert (nextfloor = "0011")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0011";
		wait for clk_period/2;
		
		
		
		
		
		--on second floor
		reset <= '0';
		stop <= '1'; 
		up_down <='1';
		
		--checking the floor: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
			
					--checking the nextfloor: 
		assert (nextfloor = "0010")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0010";
		
		wait for clk_period*2;
		
		--move to third floor.  
		reset <= '0';
		stop <= '0'; 
		up_down <='1';
		
		--checking the floor: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
			
			--checking the nextfloor: 
		assert (nextfloor = "0011")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0011";
		
		wait for clk_period/2;
		--must account for the floor changing when checking the nextfloor. 
					--checking the nextfloor: 
		assert (nextfloor = "0100")report
			"floor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0100";	
		
		wait for clk_period/2;
		
		
		
		
		
		
		
		
		--hold on third floor
		reset <= '0';
		stop <= '1'; 
		up_down <='1';
		
		--checking the output: 
		assert (floor = "0011")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0011";
			
		--checking the nextfloor: 
		assert (nextfloor = "0011")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0011";	

		wait for clk_period*2;
      
		
		
		
		--moving to fourth floor
		reset <= '0';
		stop <= '0'; 
		up_down <='1';
		
		
		--checking the output: 
		assert (floor = "0011")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0011";
			
			--checking the nextfloor: 
		assert (nextfloor = "0100")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0100";	
		
		wait for clk_period;
		
		
		--holding on fourth floor;
		reset <= '0';
		stop <= '1'; 
		up_down <='0';
		
		--checking the floor: 
		assert (floor = "0100")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0100";
			
			--checking the nextfloor: 
		assert (nextfloor = "0100")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0100";	
		wait for (3*clk_period)/4;
			--checking the nextfloor: 
		assert (nextfloor = "0011")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0011";	
		wait for (clk_period)/4;
		
		
		--moving down.  Should not require a change of inputs after this.  
		reset <= '0';
		stop <= '0'; 
		up_down <='0';
		wait for clk_period;
				--checking the output: 
		assert (floor = "0011")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0011";
			
		--checking the nextfloor: 
		assert (nextfloor = "0010")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0010";	
			
			
		wait for clk_period*2;
		
		wait for clk_period;
		
					--checking the output: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
			
			--checking the nextfloor: 
		assert (nextfloor = "0001")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0001";	
		
		wait for clk_period;
		
					--checking the output: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
			
						--checking the nextfloor: 
		assert (nextfloor = "0001")report
			"nextfloor is  " & std_logic'IMAGE(nextfloor(3))
			&std_logic'IMAGE(nextfloor(2))
			&std_logic'IMAGE(nextfloor(1))
			&std_logic'IMAGE(nextfloor(0))
			& "but floor should be 0001";	
		
		wait for clk_period;
 

      wait;
   end process;

END;
