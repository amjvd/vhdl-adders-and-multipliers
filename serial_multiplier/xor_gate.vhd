library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
  port(
    a : in std_logic;
    b : in std_logic;
    u : out std_logic
  );
end xor_gate;

architecture structural of xor_gate is

  -- Declare the components used in XOR gate logic
  component not_gate is
    port(
      x : in std_logic;
      z : out std_logic
    );
  end component;

  component and_gate is
    port(
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;

  component or_gate is
    port(
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;

  -- Internal signals for intermediate logic steps
  signal na : std_logic;
  signal nb : std_logic;
  signal t1 : std_logic;
  signal t2 : std_logic;

begin

  -- NOT gates to invert inputs
  U1: not_gate port map(x => b, z => nb); -- Invert b
  U2: not_gate port map(x => a, z => na); -- Invert a

  -- AND gates to compute intermediate terms
  U3: and_gate port map(x => a, y => nb, z => t1); -- a AND NOT(b)
  U4: and_gate port map(x => na, y => b, z => t2); -- NOT(a) AND b

  -- OR gate to finalize XOR logic
  U5: or_gate port map(x => t1, y => t2, z => u); -- (a AND NOT(b)) OR (NOT(a) AND b)

end structural;
