library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SevenSegDisplay is
    Port (
        clk         : in  std_logic;  -- Clock signal
      --  PB1         : in  std_logic;  -- KEY1 (start)
      --  PB2         : in  std_logic;  -- KEY2 (pause/resume)
      --  SW0         : in  std_logic;  -- DIP switch 0 (game/train)
		  display_mode : in std_logic_vector(2 downto 0);
        digit_one   : out std_logic_vector(6 downto 0);
        digit_two   : out std_logic_vector(6 downto 0);
        digit_three : out std_logic_vector(6 downto 0);
        digit_four  : out std_logic_vector(6 downto 0);
        digit_five  : out std_logic_vector(6 downto 0);
        digit_six   : out std_logic_vector(6 downto 0)
    );
end entity;
architecture Behavioral of SevenSegDisplay is

    type string_array is array (0 to 5) of std_logic_vector(5 downto 0);
	 
    constant TEXT_START  : string_array := (
        "100011", -- S
        "011101", -- T
        "001010", -- A
        "100010", -- R
        "011101", -- T
        "100100"  -- _
    );

    constant TEXT_SELECT : string_array := (
        "100011", -- S
        "001110", -- E
        "010101", -- L
        "001110", -- E
        "100011", -- C
        "011101" -- T
    );

    constant TEXT_PAUSE  : string_array := (
        "011001", -- P
        "001010", -- A
        "011110", -- U
        "100011", -- S
        "001110", -- E
        "100100"  -- _
    );

    constant TEXT_RESUME : string_array := (
        "100010", -- R
        "001110", -- E
        "100011", -- S
        "011110", -- U
        "010110", -- M
        "001110"  -- E
    );

    constant TEXT_GAME   : string_array := (
        "010000", -- G
        "001010", -- A
        "010110", -- M
        "001110", -- E
        "100100", -- _
        "100100"  -- _
    );

    constant TEXT_TRAIN  : string_array := (
        "011101", -- T
        "011011", -- R
        "001010", -- A
        "010010", -- I
        "010111", -- N
        "100100"  -- _
		  
    );
	 constant TEXT_PLAY	 : string_array := (
			"011001", -- P
			"010101", -- L
			"001010", -- A
			"100010", -- Y
			"100100", -- _
			"100100" -- _
	 );
    -- Internal signals
    --signal display_mode : std_logic_vector(2 downto 0) := "000"; -- 000: none, 001:train,010:game,011:start,100:pause,101:resume
    --keep track of the previous DIP switch state
    --signal prev_SW0 : std_logic := '0';
    --Keep track of the previous PB1 state
    --signal prev_PB1 : std_logic := '0';
    --keep track of the previous PB2 state
    --signal prev_PB2 : std_logic := '0';
    -- keep track of the previous mode of the game,either pause or resume
    --signal pause_resume : std_logic := '0'; -- 0: pause, 1: resume
    -- 7-segment display signals
    signal digit_one_value,digit_two_value,digit_three_value,digit_four_value,digit_five_value,digit_six_value: std_logic_vector(5 downto 0);
    --compent declared for the 7-segment display
	 
    component Alphanumeric_to_SevenSeg is
        Port (
            BCD_digit    : in std_logic_vector(5 downto 0);
            SevenSeg_out : out std_logic_vector(6 downto 0)
        );
    end component;
begin

    -- Display logic based on the display_mode signal
    process(clk)
    begin
			if rising_edge(clk) then
        case display_mode is
            when "000" => -- None
                digit_one_value   <= "111111"; -- All segments off
                digit_two_value   <= "111111";
                digit_three_value <= "111111";
                digit_four_value  <= "111111";
                digit_five_value  <= "111111";
                digit_six_value   <= "111111";

            when "001" => -- Train mode
                digit_one_value   <= TEXT_SELECT(5); -- Display 'T'
                digit_two_value   <= TEXT_SELECT(4); -- Display 'C'
                digit_three_value <= TEXT_SELECT(3); -- Display 'E'
                digit_four_value  <= TEXT_SELECT(2); -- Display 'L'
                digit_five_value  <= TEXT_SELECT(1); -- Display 'E'
                digit_six_value   <= TEXT_SELECT(0); -- Display 'S'

            when "010" => -- Game mode, change to display the text 'PLAY'
                digit_one_value   <= TEXT_PLAY(5); -- Display '_'
                digit_two_value   <= TEXT_PLAY(4); -- Display '_'
                digit_three_value <= TEXT_PLAY(3); -- Display 'Y'
                digit_four_value  <= TEXT_PLAY(2); -- Display 'A'
                digit_five_value  <= TEXT_PLAY(1); -- Display 'L'
                digit_six_value   <= TEXT_PLAY(0); -- Display 'P'

            when "011" => -- Start mode
                digit_one_value   <= TEXT_START(5); -- Display 'T'
                digit_two_value   <= TEXT_START(4); -- Display 'R'
                digit_three_value <= TEXT_START(3); -- Display 'A'
                digit_four_value  <= TEXT_START(2); -- Display 'T'
                digit_five_value  <= TEXT_START(1); -- Display 'S'
                digit_six_value   <= TEXT_START(0); -- Display 'none'

            when "100" => -- Pause mode
                digit_one_value   <= TEXT_PAUSE(5); -- Display 'E'
                digit_two_value   <= TEXT_PAUSE(4); -- Display 'S'
                digit_three_value <= TEXT_PAUSE(3); -- Display 'U'
                digit_four_value  <= TEXT_PAUSE(2); -- Display 'A'
                digit_five_value  <= TEXT_PAUSE(1); -- Display 'P'
                digit_six_value   <= TEXT_PAUSE(0); -- Display 'none'

            when "101" => -- Resume mode
                digit_one_value   <= TEXT_RESUME(5); -- Display 'E'
                digit_two_value   <= TEXT_RESUME(4); -- Display 'M'
                digit_three_value <= TEXT_RESUME(3); -- Display 'U'
                digit_four_value  <= TEXT_RESUME(2); -- Display 'S'
                digit_five_value  <= TEXT_RESUME(1); -- Display 'E'
                digit_six_value   <= TEXT_RESUME(0); -- Display 'R'

            when others =>
                digit_one_value   <= "111111"; -- All segments off
                digit_two_value   <= "111111";
                digit_three_value <= "111111";
                digit_four_value  <= "111111";
                digit_five_value  <= "111111";
                digit_six_value   <= "111111";
        end case;
		  end if;
    end process;
	 
    digit_one_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_one_value,
            SevenSeg_out => digit_one
        );
    digit_two_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_two_value,
            SevenSeg_out => digit_two
        );
    digit_three_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_three_value,
            SevenSeg_out => digit_three
        );
    digit_four_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_four_value,
            SevenSeg_out => digit_four
        );
    digit_five_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_five_value,
            SevenSeg_out => digit_five
        );
    digit_six_Counter: Alphanumeric_to_SevenSeg
        port map (
            BCD_digit    => digit_six_value,
            SevenSeg_out => digit_six
        );
end architecture Behavioral;