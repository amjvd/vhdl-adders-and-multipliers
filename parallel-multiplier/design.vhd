library IEEE;
use IEEE.std_logic_1164.all;

-- 4x4 parallel multiplier using AND gates, half adders, and full adders
entity Parallel_Multiplier is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Product : out std_logic_vector(7 downto 0)
    );
end Parallel_Multiplier;

architecture structural of Parallel_Multiplier is

    component AND_Gate
        port (A, B : in std_logic; X : out std_logic);
    end component;

    component HalfAdder
        port (A, B : in std_logic; Sum, Carry : out std_logic);
    end component;

    component FullAdder
        port (A, B, Cin : in std_logic; Sum, Cout : out std_logic);
    end component;

    signal PP : std_logic_vector(15 downto 0); -- partial products
    signal SumSig, CarrySig : std_logic_vector(10 downto 0); -- intermediate sums and carries

begin
    -- Generate partial products
    P0: AND_Gate port map(A(0), B(0), PP(0));
    P1: AND_Gate port map(A(1), B(0), PP(1));
    P2: AND_Gate port map(A(0), B(1), PP(2));
    P3: AND_Gate port map(A(2), B(0), PP(3));
    P4: AND_Gate port map(A(1), B(1), PP(4));
    P5: AND_Gate port map(A(3), B(0), PP(5));
    P6: AND_Gate port map(A(2), B(1), PP(6));
    P7: AND_Gate port map(A(3), B(1), PP(7));
    P8: AND_Gate port map(A(0), B(2), PP(8));
    P9: AND_Gate port map(A(1), B(2), PP(9));
    P10: AND_Gate port map(A(2), B(2), PP(10));
    P11: AND_Gate port map(A(3), B(2), PP(11));
    P12: AND_Gate port map(A(0), B(3), PP(12));
    P13: AND_Gate port map(A(1), B(3), PP(13));
    P14: AND_Gate port map(A(2), B(3), PP(14));
    P15: AND_Gate port map(A(3), B(3), PP(15));

    -- First addition stage
    Product(0) <= PP(0);

    HA1: HalfAdder port map(PP(1), PP(2), Product(1), CarrySig(0));
    HA2: HalfAdder port map(PP(3), PP(4), SumSig(0), CarrySig(1));
    HA3: HalfAdder port map(PP(5), PP(6), SumSig(1), CarrySig(2));

    -- Second addition stage
    FA1: FullAdder port map(PP(8), SumSig(0), CarrySig(0), Product(2), CarrySig(3));
    FA2: FullAdder port map(PP(9), SumSig(1), CarrySig(1), SumSig(2), CarrySig(4));
    FA3: FullAdder port map(PP(10), PP(7), CarrySig(2), SumSig(3), CarrySig(5));

    -- Third addition stage
    FA4: FullAdder port map(PP(12), SumSig(2), CarrySig(3), Product(3), CarrySig(6));
    FA5: FullAdder port map(PP(13), SumSig(3), CarrySig(4), SumSig(4), CarrySig(7));
    FA6: FullAdder port map(PP(14), PP(11), CarrySig(5), SumSig(5), CarrySig(8));

    -- Final ripple carry addition
    HA4: HalfAdder port map(CarrySig(6), SumSig(4), Product(4), CarrySig(9));
    FA7: FullAdder port map(CarrySig(9), SumSig(5), CarrySig(7), Product(5), CarrySig(10));
    FA8: FullAdder port map(CarrySig(10), PP(15), CarrySig(8), Product(6), Product(7));

end structural;
