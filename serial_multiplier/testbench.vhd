library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is

  component serial_multiplier
    port(
      clk            : in std_logic;
      rst            : in std_logic;
      load           : in std_logic;
      multiplier_in  : in std_logic_vector(3 downto 0);
      multiplicand_in: in std_logic_vector(3 downto 0);
      product_out    : out std_logic_vector(7 downto 0)
    );
  end component;

  signal clk            : std_logic := '0';
  signal rst            : std_logic := '0';
  signal load           : std_logic := '0';
  signal multiplier_in  : std_logic_vector(3 downto 0);
  signal multiplicand_in: std_logic_vector(3 downto 0);
  signal product_out    : std_logic_vector(7 downto 0);

begin

  -- Instantiate DUT
  UUT: serial_multiplier port map(
    clk            => clk,
    rst            => rst,
    load           => load,
    multiplier_in  => multiplier_in,
    multiplicand_in=> multiplicand_in,
    product_out    => product_out
  );

  -- Clock generation
  clk_process : process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  -- Stimulus process
  stim_proc : process
  begin
    -- Apply reset
    rst <= '1';
    wait for 20 ns;
    rst <= '0';

    -----------------------------------
    -- Test 1: 0 × 12 = 0
    load <= '1';
    multiplier_in <= "0000"; -- 0
    multiplicand_in <= "1100"; -- 12
    wait for 10 ns;
    load <= '0';
    wait for 150 ns;

    -----------------------------------
    -- Test 2: 8 × 5 = 40
    load <= '1';
    multiplier_in <= "1000"; -- 8
    multiplicand_in <= "0101"; -- 5
    wait for 10 ns;
    load <= '0';
    wait for 150 ns;

    -----------------------------------
    -- Test 3: 7 × 2 = 14
    load <= '1';
    multiplier_in <= "0111"; -- 7
    multiplicand_in <= "0010"; -- 2
    wait for 10 ns;
    load <= '0';
    wait for 150 ns;

    -----------------------------------
    -- Test 4: 5 × 3 = 15
    load <= '1';
    multiplier_in <= "0101"; -- 5
    multiplicand_in <= "0011"; -- 3
    wait for 10 ns;
    load <= '0';
    wait for 150 ns;

    -----------------------------------
    -- Test 5: 15 × 15 = 225
    load <= '1';
    multiplier_in <= "1111"; -- 15
    multiplicand_in <= "1111"; -- 15
    wait for 10 ns;
    load <= '0';
    wait for 150 ns;

    -- End of tests
    wait for 100 ns;

    -- End the simulation to stop the infinite loop
    assert false report "Simulation Finished" severity failure;

  end process;

end tb;
