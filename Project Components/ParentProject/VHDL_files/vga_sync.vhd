library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity VGA_SYNC is
  port(
    clock_25Mhz      : in  std_logic;
    red, green, blue : in  std_logic;
    red_out          : out std_logic;
    green_out        : out std_logic;
    blue_out         : out std_logic;
    horiz_sync_out   : out std_logic;
    vert_sync_out    : out std_logic;
    pixel_row        : out std_logic_vector(9 downto 0);
    pixel_column     : out std_logic_vector(9 downto 0);
    video_on_out     : out std_logic
  );
end entity VGA_SYNC;

architecture a of VGA_SYNC is
  signal horiz_sync, vert_sync    : std_logic;
  signal video_on_h, video_on_v   : std_logic;
  signal h_count, v_count         : unsigned(9 downto 0) := (others => '0');
begin
  -- Combine horizontal & vertical for output
  video_on_out <= video_on_h and video_on_v;

  process(clock_25Mhz)
  begin
    if rising_edge(clock_25Mhz) then
      -- Horizontal counter (0–799)
      if h_count = to_unsigned(799,10) then
        h_count <= (others => '0');
      else
        h_count <= h_count + 1;
      end if;

      -- Horizontal sync (659–755)
      if h_count >= to_unsigned(659,10) and h_count <= to_unsigned(755,10) then
        horiz_sync <= '0';
      else
        horiz_sync <= '1';
      end if;

      -- Active‐video horizontal (0–639)
      if h_count <= to_unsigned(639,10) then
        video_on_h <= '1';
      else
        video_on_h <= '0';
      end if;
      pixel_column <= std_logic_vector(h_count);

      -- Vertical counter increments each line at pixel 699
      if h_count = to_unsigned(699,10) then
        if v_count = to_unsigned(524,10) then
          v_count <= (others => '0');
        else
          v_count <= v_count + 1;
        end if;
      end if;

      -- Vertical sync (493–494)
      if v_count >= to_unsigned(493,10) and v_count <= to_unsigned(494,10) then
        vert_sync <= '0';
      else
        vert_sync <= '1';
      end if;

      -- Active‐video vertical (0–479)
      if v_count <= to_unsigned(479,10) then
        video_on_v <= '1';
      else
        video_on_v <= '0';
      end if;
      pixel_row <= std_logic_vector(v_count);

      -- Gate RGB with active video
      if video_on_h = '1' and video_on_v = '1' then
        red_out   <= red;
        green_out <= green;
        blue_out  <= blue;
      else
        red_out   <= '0';
        green_out <= '0';
        blue_out  <= '0';
      end if;

      -- Sync outputs
      horiz_sync_out <= horiz_sync;
      vert_sync_out  <= vert_sync;
    end if;
  end process;
end architecture a;