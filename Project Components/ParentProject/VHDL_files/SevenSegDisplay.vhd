library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SevenSegDisplay is
    Port (
        clk          : in  std_logic;  
        display_mode : in  std_logic_vector(2 downto 0);
        digit_one    : out std_logic_vector(6 downto 0);
        digit_two    : out std_logic_vector(6 downto 0);
        digit_three  : out std_logic_vector(6 downto 0);
        digit_four   : out std_logic_vector(6 downto 0);
        digit_five   : out std_logic_vector(6 downto 0);
        digit_six    : out std_logic_vector(6 downto 0)
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

    constant TEXT_TRAIN  : string_array := (
        "011101", -- T
        "011011", -- R
        "001010", -- A
        "010010", -- I
        "010111", -- N
        "100100"  -- _
    );

    constant TEXT_PLAY   : string_array := (
        "011001", -- P
        "010101", -- L
        "001010", -- A
        "100010", -- Y
        "100100", -- _
        "100100"  -- _
    );

    -- (Optionally keep pause/resume if you use those codes 100/101)
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

    -- BCD digit values
    signal digit_one_value   : std_logic_vector(5 downto 0);
    signal digit_two_value   : std_logic_vector(5 downto 0);
    signal digit_three_value : std_logic_vector(5 downto 0);
    signal digit_four_value  : std_logic_vector(5 downto 0);
    signal digit_five_value  : std_logic_vector(5 downto 0);
    signal digit_six_value   : std_logic_vector(5 downto 0);

    component Alphanumeric_to_SevenSeg is
        Port (
            BCD_digit    : in  std_logic_vector(5 downto 0);
            SevenSeg_out : out std_logic_vector(6 downto 0)
        );
    end component;

begin

    -- Display logic based on display_mode
    process(clk)
    begin
        if rising_edge(clk) then
            case display_mode is

                when "000" =>  -- None
                    digit_one_value   <= "111111";
                    digit_two_value   <= "111111";
                    digit_three_value <= "111111";
                    digit_four_value  <= "111111";
                    digit_five_value  <= "111111";
                    digit_six_value   <= "111111";

                when "011" =>  -- START
                    digit_one_value   <= TEXT_START(5);
                    digit_two_value   <= TEXT_START(4);
                    digit_three_value <= TEXT_START(3);
                    digit_four_value  <= TEXT_START(2);
                    digit_five_value  <= TEXT_START(1);
                    digit_six_value   <= TEXT_START(0);

                when "110" =>  -- TRAIN
                    digit_one_value   <= TEXT_TRAIN(5);
                    digit_two_value   <= TEXT_TRAIN(4);
                    digit_three_value <= TEXT_TRAIN(3);
                    digit_four_value  <= TEXT_TRAIN(2);
                    digit_five_value  <= TEXT_TRAIN(1);
                    digit_six_value   <= TEXT_TRAIN(0);

                when "010" =>  -- PLAY
                    digit_one_value   <= TEXT_PLAY(5);
                    digit_two_value   <= TEXT_PLAY(4);
                    digit_three_value <= TEXT_PLAY(3);
                    digit_four_value  <= TEXT_PLAY(2);
                    digit_five_value  <= TEXT_PLAY(1);
                    digit_six_value   <= TEXT_PLAY(0);

                when "100" =>  -- PAUSE (if used)
                    digit_one_value   <= TEXT_PAUSE(5);
                    digit_two_value   <= TEXT_PAUSE(4);
                    digit_three_value <= TEXT_PAUSE(3);
                    digit_four_value  <= TEXT_PAUSE(2);
                    digit_five_value  <= TEXT_PAUSE(1);
                    digit_six_value   <= TEXT_PAUSE(0);

                when "101" =>  -- RESUME (if used)
                    digit_one_value   <= TEXT_RESUME(5);
                    digit_two_value   <= TEXT_RESUME(4);
                    digit_three_value <= TEXT_RESUME(3);
                    digit_four_value  <= TEXT_RESUME(2);
                    digit_five_value  <= TEXT_RESUME(1);
                    digit_six_value   <= TEXT_RESUME(0);

                when others =>
                    digit_one_value   <= "111111";
                    digit_two_value   <= "111111";
                    digit_three_value <= "111111";
                    digit_four_value  <= "111111";
                    digit_five_value  <= "111111";
                    digit_six_value   <= "111111";

            end case;
        end if;
    end process;

    -- Instantiate converters
    digit_one_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_one_value, SevenSeg_out => digit_one);
    digit_two_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_two_value, SevenSeg_out => digit_two);
    digit_three_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_three_value, SevenSeg_out => digit_three);
    digit_four_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_four_value, SevenSeg_out => digit_four);
    digit_five_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_five_value, SevenSeg_out => digit_five);
    digit_six_Counter: Alphanumeric_to_SevenSeg
        port map (BCD_digit => digit_six_value, SevenSeg_out => digit_six);

end architecture Behavioral;
