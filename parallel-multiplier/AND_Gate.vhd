library IEEE;
use IEEE.std_logic_1164.all;

-- AND gate module with 3 ns delay
entity AND_Gate is
    port (
        A, B : in std_logic;
        X : out std_logic
    );
end AND_Gate;

architecture rtl of AND_Gate is
begin
    X <= A and B after 3 ns;
end rtl;
