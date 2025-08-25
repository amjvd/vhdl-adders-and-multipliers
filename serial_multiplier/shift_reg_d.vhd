library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_d is
  port(
    clk   : in std_logic;
    load  : in std_logic;
    shift : in std_logic;
    din   : in std_logic_vector(3 downto 0);
    dout  : out std_logic_vector(7 downto 0)
  );
end shift_reg_d;

architecture behavioral of shift_reg_d is

  -- Register for shifting multiplicand
  signal data_reg : std_logic_vector(7 downto 0);

begin

  -- Shift logic
  process(clk)
  begin
    if rising_edge(clk) then
      if load = '1' then
        data_reg(3 downto 0) <= din;        -- Load 4-bit input into lower bits
        data_reg(7 downto 4) <= (others => '0'); -- Clear upper bits
      elsif shift = '1' then
        data_reg <= data_reg(6 downto 0) & '0';  -- Shift left, fill right with 0
      end if;
    end if;
  end process;

  -- Output connection
  dout <= data_reg;

end behavioral;
