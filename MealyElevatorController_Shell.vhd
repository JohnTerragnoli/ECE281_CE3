----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva
-- 
-- Create Date:    10:33:47 07/07/2012 
-- Design Name: 
-- Module Name:    MooreElevatorController_Silva - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- REVISION: 

-- Company: 281 Team
-- Engineer: C3C John Paul Terragnoli 
-- 
-- Create Date:    20:33:47 06/03/2014 
-- Design Name: 
-- Module Name:    MealyElecatorController_Shell - Behavioral 
-- Project Name:  CE3_Terragnoli 
-- Target Devices: MealyElecatorController_Shell
-- Tool versions: 1.0
-- Description: Programs an elevator to work with four floors.  
--
-- Dependencies: MealyElecatorController_Shell
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MealyElevatorController_Shell is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           floor : out  STD_LOGIC_VECTOR (3 downto 0);
			  nextfloor : out std_logic_vector (3 downto 0));
end MealyElevatorController_Shell;

architecture Behavioral of MealyElevatorController_Shell is

type floor_state_type is (floor1, floor2, floor3, floor4);

signal floor_state : floor_state_type;

begin

---------------------------------------------------------
--Code your Mealy machine next-state process below
--Question: Will it be different from your Moore Machine?
---------------------------------------------------------
floor_state_machine: process(clk)
begin
--Insert your state machine below:
--clk'event and clk='1' is VHDL-speak for a rising edge
	--but Capt. Sivla said that winners write it this way.  
	if RISING_EDGE(CLK)  then
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
		--synchronous.  
		if reset='1' then
			floor_state <= floor1;
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor1 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor2;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor1;
					end if;
				--when our current state is floor2
				when floor2 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor3; 			
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					--otherwise we're going to stay at floor2
					else
						floor_state <= floor2;
					end if;
				
--COMPLETE THE NEXT STATE LOGIC ASSIGNMENTS FOR FLOORS 3 AND 4

--logic for floor 3
				when floor3 =>
					if (up_down = '0' and stop = '0'	) then 
						floor_state <= floor2;
					elsif ( up_down = '1' and stop = '0') then 
						floor_state <= floor4; 	
					else
						floor_state <= floor3; 
					end if;
					
					
--logic for floor 4
				when floor4 =>
					if (up_down = '0' and stop = '0') then 
						floor_state <= floor3; 
					else 
						floor_state <= floor4; 
					end if;
				
				--This line accounts for phantom states
				--is this always the same?  
				when others =>
				--this makes sure that no memory is inferred.  
					floor_state <= floor1;
			end case;
		end if;
	end if;

end process;

-----------------------------------------------------------
--Code your Ouput Logic for your Mealy machine below
--Remember, now you have 2 outputs (floor and nextfloor)
-----------------------------------------------------------

--the output for the floor stays the same.  
floor <= "0001" when (floor_state =  floor1    ) else
			"0010" when (floor_state =  floor2) else
			"0011" when (      floor_state =  floor3) else
			"0100" when (      floor_state =  floor4) else
			--this last line should account for phantom states.  
			"0001";
		
--presents all possible cases for the nextfloor.  Even though I just realized not
--all of them are necessary.  
--This is basically predicting the nextfloor that the elevator would move to, if the 
--clock were to change at that exact moment.  		
nextfloor <= 	"0001" when (floor_state = floor1 and stop = '0' and up_down = '0') else
					"0010" when (floor_state = floor1 and stop = '0' and up_down = '1') else
					"0001" when (floor_state = floor1 and stop = '1' and up_down = '0') else
					"0001" when (floor_state = floor1 and stop = '1' and up_down = '1') else
					
					"0001" when (floor_state = floor2 and stop = '0' and up_down = '0') else
					"0011" when (floor_state = floor2 and stop = '0' and up_down = '1') else
					"0010" when (floor_state = floor2 and stop = '1' and up_down = '0') else
					"0010" when (floor_state = floor2 and stop = '1' and up_down = '1') else
					
					"0010" when (floor_state = floor3 and stop = '0' and up_down = '0') else
					"0100" when (floor_state = floor3 and stop = '0' and up_down = '1') else
					"0011" when (floor_state = floor3 and stop = '1' and up_down = '0') else
					"0011" when (floor_state = floor3 and stop = '1' and up_down = '1') else
					
					"0011" when (floor_state = floor4 and stop = '0' and up_down = '0') else
					"0100" when (floor_state = floor4 and stop = '0' and up_down = '1') else
					"0100" when (floor_state = floor4 and stop = '1' and up_down = '0') else
					"0100" when (floor_state = floor4 and stop = '1' and up_down = '1') else
					"0001";
							 
end Behavioral;

