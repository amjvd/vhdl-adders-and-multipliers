library IEEE;
use IEEE.std_logic_1164.all;

-- Full adder using XOR, AND, and OR gates
entity FullAdder is
    port (
        A, B, Cin : in std_logic;
        Sum, Cout : out std_logic
    );
end FullAdder;

architecture structural of FullAdder is

    signal tempSum, tempCarry1, tempCarry2 : std_logic;

    component XOR_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

    component AND_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

    component OR_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

begin
    -- Internal connections
    XOR1: XOR_Gate port map(A => A, B => B, X => tempSum);
    XOR2: XOR_Gate port map(A => tempSum, B => Cin, X => Sum);
    AND1: AND_Gate port map(A => A, B => B, X => tempCarry1);
    AND2: AND_Gate port map(A => tempSum, B => Cin, X => tempCarry2);
    OR1 : OR_Gate port map(A => tempCarry1, B => tempCarry2, X => Cout);

end structural;
