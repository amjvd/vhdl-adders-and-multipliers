library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
  port(
    x : in  std_logic;
    y : in  std_logic;
    z : out std_logic
  );
end or_gate;

architecture behavioral of or_gate is
begin

  -- Output is logical OR of inputs
  z <= x or y;

end behavioral;
