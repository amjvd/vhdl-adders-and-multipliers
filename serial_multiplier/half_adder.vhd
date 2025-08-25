library IEEE;
use IEEE.std_logic_1164.all;

-- Half Adder entity
entity half_adder is
  port(
    a     : in  std_logic;
    b     : in  std_logic;
    sum   : out std_logic;
    carry : out std_logic
  );
end half_adder;

architecture behavioral of half_adder is
  -- Internal signals for XOR and AND logic
  signal temp_sum   : std_logic;
  signal temp_carry : std_logic;
begin

  -- XOR gate to calculate sum
  temp_sum <= a xor b;
  sum <= temp_sum;

  -- AND gate to calculate carry
  temp_carry <= a and b;
  carry <= temp_carry;

end behavioral;
