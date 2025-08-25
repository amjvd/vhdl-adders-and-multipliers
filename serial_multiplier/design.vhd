library IEEE;
use IEEE.std_logic_1164.all;

entity serial_multiplier is
  port(
    clk             : in  std_logic;
    rst             : in  std_logic;
    load            : in  std_logic;
    multiplier_in   : in  std_logic_vector(3 downto 0);
    multiplicand_in : in  std_logic_vector(3 downto 0);
    product_out     : out std_logic_vector(7 downto 0)
  );
end serial_multiplier;

architecture structural of serial_multiplier is

  -- Declare components needed for multiplication
  component shift_reg_r
    port(clk, load, shift: in std_logic; din: in std_logic_vector(3 downto 0); dout: out std_logic_vector(3 downto 0));
  end component;

  component shift_reg_d
    port(clk, load, shift: in std_logic; din: in std_logic_vector(3 downto 0); dout: out std_logic_vector(7 downto 0));
  end component;

  component result_reg_p
    port(clk, clear, load: in std_logic; din: in std_logic_vector(7 downto 0); dout: out std_logic_vector(7 downto 0));
  end component;

  component adder8
    port(A, B: in std_logic_vector(7 downto 0); Sum: out std_logic_vector(7 downto 0); Cout: out std_logic);
  end component;

  -- Internal signals for data and control
  signal mul_reg           : std_logic_vector(3 downto 0);
  signal mcand_reg         : std_logic_vector(7 downto 0);
  signal prod_reg          : std_logic_vector(7 downto 0);
  signal sum_tmp           : std_logic_vector(7 downto 0);
  signal carry_tmp         : std_logic;
  signal masked_mcand      : std_logic_vector(7 downto 0);

  signal shift_enable      : std_logic := '0';
  signal add_enable        : std_logic := '0';
  signal counter           : integer range 0 to 4 := 0;

  type state_type is (IDLE, ADD, SHIFT);
  signal state : state_type := IDLE;

begin

  -- Connect the multiplier shift register
  reg_multiplier: shift_reg_r
    port map(clk => clk, load => load, shift => shift_enable, din => multiplier_in, dout => mul_reg);

  -- Connect the multiplicand shift register
  reg_multiplicand: shift_reg_d
    port map(clk => clk, load => load, shift => shift_enable, din => multiplicand_in, dout => mcand_reg);

  -- Connect the result register
  reg_result: result_reg_p
    port map(clk => clk, clear => load, load => add_enable, din => sum_tmp, dout => prod_reg);

  -- Connect the 8-bit adder
  adder_unit: adder8
    port map(A => prod_reg, B => masked_mcand, Sum => sum_tmp, Cout => carry_tmp);

  -- Output assignment
  product_out <= prod_reg;

  -- Multiplicand masking depending on multiplier LSB
  process(mul_reg, mcand_reg)
  begin
    if mul_reg(0) = '1' then
      masked_mcand <= mcand_reg;
    else
      masked_mcand <= (others => '0');
    end if;
  end process;

  -- Main state machine for multiplication
  process(clk, rst)
  begin
    if rst = '1' then
      state <= IDLE;
      shift_enable <= '0';
      add_enable <= '0';
      counter <= 0;
    elsif rising_edge(clk) then
      case state is
        when IDLE =>
          shift_enable <= '0';
          add_enable <= '0';
          if load = '1' then
            counter <= 0;
            state <= ADD;
          end if;

        when ADD =>
          add_enable <= '1';
          shift_enable <= '0';
          state <= SHIFT;

        when SHIFT =>
          add_enable <= '0';
          shift_enable <= '1';
          if counter = 3 then
            state <= IDLE;
          else
            counter <= counter + 1;
            state <= ADD;
          end if;

      end case;
    end if;
  end process;

end structural;
