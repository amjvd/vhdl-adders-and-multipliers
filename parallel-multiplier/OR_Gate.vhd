library IEEE;
use IEEE.std_logic_1164.all;

-- OR gate module with 3 ns delay
entity OR_Gate is
    port (
        A, B : in std_logic;
        X : out std_logic
    );
end OR_Gate;

architecture rtl of OR_Gate is
begin
    X <= A or B after 3 ns;
end rtl;
