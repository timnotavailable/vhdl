----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/07/19 14:54:14
-- Design Name: 
-- Module Name: Signal_selection - Behavioral
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



entity Signal_selection is
  generic(
    NBITS  : integer  := 16 ;
    LATENCY  : integer := 50
          );
  port(
       clk_i: in std_logic;
       --signal from signal_detection
       detected_signal_valid_i: in std_logic;
       --FIFO control signal
       signal_selection_tdata_i: in std_logic_vector(NBITS-1 downto 0);
       signal_selection_tvalid_i: in std_logic;
       signal_selection_tready_o: out std_logic;
       --to ila
       signal_sel_ila_valid_o: out std_logic;
       selected_signal_o: out std_logic_vector(NBITS-1 downto 0)
       );
end Signal_selection;

architecture Behavioral of Signal_selection is

  type fsm_type is (IDLE,signal_selection);
  type signal_type is record
    fsm:fsm_type;
    counter: integer;
    
  end record;
  
   CONSTANT REC_DEFAULT : signal_type := (fsm=>IDLE,counter=>0);
    signal current_state:  signal_type := REC_DEFAULT;
    signal next_state: signal_type  := REC_DEFAULT; 
    signal ready_counter : integer:= 0;
begin
 
   
  
  --after some time(latency)  began to read FIFO   ,but when??????
    --signal_selection_tready_o<='1';
    --selected_signal_o<=signal_selection_tdata_i;
  
  
  seq_proc: process(clk_i)
  begin
  if rising_edge(clk_i) then
     current_state<=next_state;
      if signal_selection_tvalid_i='1'  then 
        ready_counter<=ready_counter+1;
              if  ready_counter>=20  then 
                signal_selection_tready_o<='1';
                ready_counter<=100;
              else   
                signal_selection_tready_o<='0';
              end if;
      end if;
   

  end if;    
  end process;
  
  
  comb_proc:process(detected_signal_valid_i,current_state,signal_selection_tdata_i)
  begin
      next_state<=current_state;
    Case current_state.fsm is
        When  IDLE  =>
           signal_sel_ila_valid_o<='0';
           next_state.counter<=0;
           selected_signal_o<=(others=>'0');
           
           if  detected_signal_valid_i='1'   then 
               next_state.fsm<=signal_selection;   
           end if;
           
        When  signal_selection  =>   
           next_state.counter<=current_state.counter+1;
           
            -- if current_state.counter>=3 then 
                selected_signal_o<= signal_selection_tdata_i;
                signal_sel_ila_valid_o<='1';
             --end if;
 
           
           
            if  current_state.counter>=Latency   then --detected_signal_valid_i='0'
               next_state.fsm<=IDLE;
           end if;
       end case;  
   end process;
end Behavioral;
