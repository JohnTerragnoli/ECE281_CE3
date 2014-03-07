--------------------------------------------------------------------------------
-- Company: ECE281 All Stars
-- Engineer: C3C John Paul Terragnoli 
--
-- Create Date:   20:27:30 03/06/2014
-- Design Name:   Moore Testbench
-- Module Name:   C:/Users/C16John.Terragnoli/Documents/Documents/My Documents/
--Academics/Sophomore Year/Spring Semester/ECE 281/ISE Project Stuff/
--CE3_Terragnoli/Moore_testbench_Terragnoli.vhd
-- Project Name:  CE3_Terragnoli
-- Target Device:  Moore Design Shell
-- Description:   Tests the Moore Design Shell to make sure that it works correctly. 
-- 
-- VHDL Test Bench Created by ISE for module: MooreElevatorController_Shell
-- 
-- Dependencies: Moore Design Shell
-- 
-- Revision: 1.0
-- Revision 0.01 - File Created
-- Additional Comments: NONE
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
 
ENTITY Moore_testbench_Terragnoli IS
END Moore_testbench_Terragnoli;
 
ARCHITECTURE behavior OF Moore_testbench_Terragnoli IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MooreElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);

   -- Clock period definitions
	-- this will use a frequency of 50MHz.  
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MooreElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		--this is the first case starting on floor one.  
		reset <= '1'; 
		stop <= '0'; 
		up_down <= '0'; 
		
		--checking the output: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
		wait for clk_period;
		
		--now we want to start going up.  
		reset <= '0';
		stop <= '0'; 
		up_down <='1';
		
		--checking the output: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
		
		wait for clk_period;
		
		
		--on second floor
		reset <= '0';
		stop <= '1'; 
		up_down <='1';
		
		--checking the output: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
		
		wait for clk_period*2;
		
		--move to third floor.  
		reset <= '0';
		stop <= '0'; 
		up_down <='1';
		
		--checking the output: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
		
		wait for clk_period;
		
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
		
		wait for clk_period;
		
		
		--holding on fourth floor;
		reset <= '0';
		stop <= '1'; 
		up_down <='0';
		
		--checking the output: 
		assert (floor = "0100")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0100";
		wait for clk_period*2;
		
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
		
		wait for clk_period;
		
					--checking the output: 
		assert (floor = "0010")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0010";
		
		wait for clk_period;
		
					--checking the output: 
		assert (floor = "0001")report
			"floor is  " & std_logic'IMAGE(floor(3))
			&std_logic'IMAGE(floor(2))
			&std_logic'IMAGE(floor(1))
			&std_logic'IMAGE(floor(0))
			& "but floor should be 0001";
		
		wait for clk_period;
		

      wait;
   end process;

END;
