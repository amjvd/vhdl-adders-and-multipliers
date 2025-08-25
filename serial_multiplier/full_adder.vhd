library IEEE;
use IEEE.std_logic_1164.all;

-- Full Adder entity
entity full_adder is
  port(
    a     : in  std_logic;
    b     : in  std_logic;
    cin   : in  std_logic;
    sum   : out std_logic;
    carry : out std_logic
  );
end full_adder;

architecture behavioral of full_adder is
  -- Internal signals for two half adders
  signal sum_half1 : std_logic;
  signal carry_half1 : std_logic;
  signal carry_half2 : std_logic;
begin

  -- First half adder: sum of a and b
  HA1: entity work.half_adder
    port map(
      a => a,
      b => b,
      sum => sum_half1,
      carry => carry_half1
    );

  -- Second half adder: sum of sum_half1 and cin
  HA2: entity work.half_adder
    port map(
      a => sum_half1,
      b => cin,
      sum => sum,
      carry => carry_half2
    );

  -- OR gate to combine carries from both half adders
  carry <= carry_half1 or carry_half2;

end behavioral;
