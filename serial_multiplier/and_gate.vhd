library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
  port(
    x : in  std_logic;
    y : in  std_logic;
    z : out std_logic
  );
end and_gate;

architecture behavioral of and_gate is
begin

  -- Output is logical AND of inputs
  z <= x and y;

end behavioral;
