LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY test_tb IS
END test_tb;

ARCHITECTURE behavior OF test_tb IS
   signal clk : std_logic := '0';
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');
   signal segment7 : std_logic_vector(6 downto 0);
   constant clk_period : time := 1 ns;
BEGIN
   uut: entity work.test PORT MAP (clk,bcd,segment7);
   clk_process :process
   begin
                clk <= '0';
               wait for clk_period/2;
                clk <= '1';
                wait for clk_period/2;
   end process;     
   stim_proc: process
   begin               
     for i in 0 to 9 loop
           bcd <= conv_std_logic_vector(i,4);
          wait for 2 ns;
     end loop;
   end process;

END;