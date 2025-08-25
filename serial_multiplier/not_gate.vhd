library IEEE;
use IEEE.std_logic_1164.all;

entity not_gate is
  port(
    x : in  std_logic;
    z : out std_logic
  );
end not_gate;

architecture behavioral of not_gate is
begin

  -- Simple NOT logic
  z <= not x;

end behavioral;
