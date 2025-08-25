library IEEE;
use IEEE.std_logic_1164.all;

-- XOR gate module with 4 ns delay
entity XOR_Gate is
    port (
        A, B : in std_logic;
        X : out std_logic
    );
end XOR_Gate;

architecture rtl of XOR_Gate is
begin
    X <= A xor B after 4 ns;
end rtl;
