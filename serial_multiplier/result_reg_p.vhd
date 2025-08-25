library IEEE;
use IEEE.std_logic_1164.all;

entity result_reg_p is
  port(
    clk   : in std_logic;
    clear : in std_logic;
    load  : in std_logic;
    din   : in std_logic_vector(7 downto 0);
    dout  : out std_logic_vector(7 downto 0)
  );
end result_reg_p;

architecture behavioral of result_reg_p is

  -- Internal register for storing the result
  signal result_reg : std_logic_vector(7 downto 0);

begin

  -- Load or clear result register
  process(clk)
  begin
    if rising_edge(clk) then
      if clear = '1' then
        result_reg <= (others => '0'); -- Clear register to zero
      elsif load = '1' then
        result_reg <= din; -- Load new result
      end if;
    end if;
  end process;

  -- Output assignment
  dout <= result_reg;

end behavioral;
