-- Author : Sanjoy Paul
---------------------------------------------------------------------

  library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;

  entity counter_up_down_tb IS
  end entity;

  architecture behavior of counter_up_down_tb is 

  -- Component Declaration
          component counter_up_down is
          port(
                  clk : in  STD_LOGIC;
						rst : in  STD_LOGIC;
						updown : in  STD_LOGIC;
						count : out  STD_LOGIC_VECTOR (3 downto 0)
                  );
          end component;

          signal clk, rst, updown : std_logic := '0' ;
          signal count :  std_logic_vector(3 downto 0);
			 constant num_of_clocks : integer := 30 ;
			 signal i : integer :=0 ;
          constant t : time := 20 ns;

  begin

  -- Component Instantiation
          uut: counter_up_down port map(
                  clk => clk,
						rst => rst,
						updown => updown,
						count => count       
						);


  --  Test Bench Statements
     tb : process
     begin

        rst <= '0';
		  clk <= '0';
		  wait for t/2;
		  clk <= '1' ;
		  wait for t/2 ;
		  
		  if (i= num_of_clocks) then
		  wait;
		  else
		  i <= i+1;
		  end if;
		  
		  if (i < 14) then
		  updown <= '0';
		  else
		  updown <= '1';
		  end if;
		  
     end process tb;
  --  End Test Bench 

  end;
