library IEEE;
use IEEE.std_logic_1164.all;

entity adder8 is
  port(
    A    : in  std_logic_vector(7 downto 0);
    B    : in  std_logic_vector(7 downto 0);
    Sum  : out std_logic_vector(7 downto 0);
    Cout : out std_logic
  );
end adder8;

architecture behavioral of adder8 is

  -- Full adder component declaration
  component full_adder
    port(
      a     : in  std_logic;
      b     : in  std_logic;
      cin   : in  std_logic;
      sum   : out std_logic;
      carry : out std_logic
    );
  end component;

  -- Intermediate carry signals between stages
  signal carry_chain : std_logic_vector(7 downto 0);

begin

  -- First full adder with zero carry-in
  FA0: full_adder
    port map(
      a => A(0),
      b => B(0),
      cin => '0',
      sum => Sum(0),
      carry => carry_chain(0)
    );

  -- Remaining full adders
  FA1: full_adder
    port map(
      a => A(1),
      b => B(1),
      cin => carry_chain(0),
      sum => Sum(1),
      carry => carry_chain(1)
    );

  FA2: full_adder
    port map(
      a => A(2),
      b => B(2),
      cin => carry_chain(1),
      sum => Sum(2),
      carry => carry_chain(2)
    );

  FA3: full_adder
    port map(
      a => A(3),
      b => B(3),
      cin => carry_chain(2),
      sum => Sum(3),
      carry => carry_chain(3)
    );

  FA4: full_adder
    port map(
      a => A(4),
      b => B(4),
      cin => carry_chain(3),
      sum => Sum(4),
      carry => carry_chain(4)
    );

  FA5: full_adder
    port map(
      a => A(5),
      b => B(5),
      cin => carry_chain(4),
      sum => Sum(5),
      carry => carry_chain(5)
    );

  FA6: full_adder
    port map(
      a => A(6),
      b => B(6),
      cin => carry_chain(5),
      sum => Sum(6),
      carry => carry_chain(6)
    );

  FA7: full_adder
    port map(
      a => A(7),
      b => B(7),
      cin => carry_chain(6),
      sum => Sum(7),
      carry => Cout
    );

end behavioral;
