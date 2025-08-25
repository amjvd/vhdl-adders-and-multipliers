library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_r is
  port(
    clk   : in std_logic;
    load  : in std_logic;
    shift : in std_logic;
    din   : in std_logic_vector(3 downto 0);
    dout  : out std_logic_vector(3 downto 0)
  );
end shift_reg_r;

architecture behavioral of shift_reg_r is

  -- Register to hold shifted data
  signal data_reg : std_logic_vector(3 downto 0);

begin

  -- Shift register behavior
  process(clk)
  begin
    if rising_edge(clk) then
      if load = '1' then
        data_reg <= din;  -- Load input into register
      elsif shift = '1' then
        data_reg <= '0' & data_reg(3 downto 1);  -- Shift right, fill left with 0
      end if;
    end if;
  end process;

  -- Output connection
  dout <= data_reg;

end behavioral;
