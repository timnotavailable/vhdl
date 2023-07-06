----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/07/19 16:00:59
-- Design Name: 
-- Module Name: Pedestal_subtraction - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
library work;

entity Pedestal_subtraction is
  generic(
   NBITS: integer :=16
          );
  port   (
    clk_i        : in std_logic;
    pedestal_i   : in std_logic_vector(NBITS-1 downto 0);
    origin_signal_i : in  std_logic_vector(NBITS-1 downto 0);
    pedestal_subtraction_o: out std_logic_vector(NBITS-1 downto 0)
          );
      
end Pedestal_subtraction;

architecture Behavioral of Pedestal_subtraction is
    signal pedestal   : signed(NBITS-1 downto 0);
    signal origin_signal : signed(NBITS-1 downto 0);


begin
    pedestal<=signed(pedestal_i);
    origin_signal<=signed(origin_signal_i);
  
   
   process(clk_i)
   begin 
     if rising_edge(clk_i) then
        pedestal_subtraction_o<=std_logic_vector(origin_signal-pedestal+100);
      end if;
   end process;

end Behavioral;
