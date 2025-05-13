library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_numeric.all;




entity PS2_receiver_State_Machine is
port(
sys_clk : in std_logic; -- System Clock
reset_n : in std_logic; -- Active Low Reset
ps2_clk : in std_logic; -- The raw PS/2 clock
ps2_data : in std_logic; -- The raw input of PS/2
data_out : out std_logic_vector(7 downto 0); -- Processed output
data_valid : out std_logic; --One cycle pulse when byte is valid.
framing_error: out_std_logic --High if start/parity/stop bit failed. 
);
end entity PS2_receiver_State_Machine;

architecture RSM of P2S_receiver_State_Machine is 

-- 



