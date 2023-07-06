----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/07/13 16:58:13
-- Design Name: 
-- Module Name: signal_detection - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
library work;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signal_detection is
--  Port ( );
   generic
   (
     NBITS   : integer := 16;      
     NLENGTH : integer := 1024         -- to be integer power of 2
      );
   port 
    (
     rst_i : in std_logic;
     clk_i : in std_logic;
     pedestal_i:        in std_logic_vector(NBITS-1 downto 0);
     variance_i:        in std_logic_vector(2*NBITS-1 downto 0);
     origin_signal_i:   in std_logic_vector(NBITS-1 downto 0);
     detected_signal_o: out std_logic_vector(NBITS-1 downto 0);
     detected_signal_valid_o: out std_logic
      );
end signal_detection;

architecture Behavioral of signal_detection is

  type fsm_type is (IsSignal,NotSignal);
  type signal_type is record
      fsm: fsm_type;
      counter: integer;
      --output
      sampleIs_signal: unsigned(NBITS-1 downto 0);
      detect_signal:   unsigned(NBITS-1 downto 0); 
      --input
      origin_signal:   unsigned(NBITS-1 downto 0); 
      pedestal:   unsigned(NBITS-1 downto 0); 
      variance:   unsigned(2*NBITS-1 downto 0); 
  end record;
   
   CONSTANT REC_DEFAULT : signal_type := (fsm=>NotSignal,counter=>0,sampleIs_signal=>(others=>'0'),detect_signal=>(others=>'0'),origin_signal=>(others=>'0'),pedestal=>(others=>'0'),variance=>(others=>'0'));
    signal current_state:  signal_type := REC_DEFAULT;
    signal next_state: signal_type  := REC_DEFAULT; 
begin

  detected_signal_o  <=std_logic_vector(current_state.detect_signal);    --   -baseline 50
   
 
   seq_proc: process(clk_i)
    begin
       current_state<=next_state;
    end process;
   
   
   comb_proc: process(current_state,pedestal_i,variance_i,origin_signal_i,rst_i)
     begin
        next_state<=current_state;
        next_state.origin_signal<=unsigned(origin_signal_i);       --baseline +50
        next_state.pedestal<=unsigned(pedestal_i);
        next_state.variance<=unsigned(variance_i);
        
        Case current_state.fsm is
           When  Notsignal =>
              detected_signal_valid_o<='0';
             if  current_state.origin_signal>current_state.pedestal then     --avoid   pedestal> s_i
               if (current_state.origin_signal-current_state.pedestal)*(current_state.origin_signal-current_state.pedestal)>16*current_state.variance then
                 next_state.counter<=current_state.counter+1;
                 next_state.sampleIs_signal<=current_state.origin_signal-current_state.pedestal;
               else 
                 next_state.counter<=0;
              
               end if;
             end if;
              if current_state.counter>2 then
                 next_state.fsm<= IsSignal;              
              end if;
            
            When IsSignal  =>
               next_state.detect_signal<=current_state.origin_signal-current_state.pedestal;
               next_state.counter<=current_state.counter+1;
               detected_signal_valid_o<='1';
               
              -- if (origin_signal_i-pedestal_i)*(origin_signal_i-pedestal_i)<=16*variance_i then
                 if (current_state.origin_signal-current_state.pedestal)*(current_state.origin_signal-current_state.pedestal)<=16*current_state.variance then
                  next_state.counter<=0;
                  next_state.fsm<= NotSignal;
                  
               end if;
    
        
        end case;
        
        if rst_i='1' then
           next_state<=REC_DEFAULT;    
        end if;
     
     
     end process;
     


end Behavioral;
