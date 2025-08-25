library IEEE;
use IEEE.std_logic_1164.all;

-- Half adder using XOR and AND gates
entity HalfAdder is
    port (
        A, B : in std_logic;
        Sum, Carry : out std_logic
    );
end HalfAdder;

architecture structural of HalfAdder is

    component XOR_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

    component AND_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

begin
    -- Sum output
    XOR1: XOR_Gate port map(A => A, B => B, X => Sum);
    
    -- Carry output
    AND1: AND_Gate port map(A => A, B => B, X => Carry);

end structural;
