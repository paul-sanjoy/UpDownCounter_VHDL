----------------------------------------------------------------------------------
-- Author : Sanjoy Paul
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_up_down is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           updown : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_up_down;

architecture Behavioral of counter_up_down is

signal temp:STD_LOGIC_VECTOR(3 downto 0):= "0000";

begin

	process(clk,rst)
	
	begin
	
	if(rst='1')then
	temp<= "0000";
	elsif(rising_edge(clk))then
		if(updown='0')then
		temp <= temp +1;
		else
		temp <= temp -1;
		end if;
	end if;
	
	end process;
	
	count<=temp;

end Behavioral;

