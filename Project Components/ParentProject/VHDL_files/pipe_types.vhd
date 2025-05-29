library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package pipe_types is
  type pipe_array_type is array(2 downto 0) of std_logic_vector(10 downto 0);
  type game_state_t is (S_TITLE, S_GS, S_TRAIN, S_PLAY, S_DEATH);
end package;

package body pipe_types is
end package body;
