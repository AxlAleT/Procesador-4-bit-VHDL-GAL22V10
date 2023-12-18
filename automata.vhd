LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY automata IS
	PORT ( 
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	    input_bit, Slct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		Clk : IN std_logic;

	    Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
    );
END automata;

architecture Behavior of automata is
	
	signal estado_actual, siguiente_estado : std_logic_vector(2 downto 0);
	signal D1, D2, D3 : std_logic_vector(3 downto 0);

	begin
		siguiente_estado <= "0000";

		process(Clk, input_bit, estado_actual, Slct)

			when Clock'EVENT AND Clock = '1'
				
				estado_actual <= siguiente_estado;

				\los estados A, B, C o F pueden dar lugar a A, B, C o D \
				if 	estado_actual = "000" or estado_actual = "001"
					or estado_actual = "010" or estado_actual = "101" THEN

						if input_bit = "00" THEN
							siguiente_estado = "000";
						elsif input_bit = "01" THEN
							siguiente_estado = "001";
						elsif input_bit = "10" THEN
							siguiente_estado = "010";
						elsif input_bit = "11" THEN
							siguiente_estado = "011";
							
				\ D, E solo pueden dar lugar al siguiente estado\
				elsif estado_actual = "011" THEN
					siguiente_estado = "100";
				elsif estado_actual = "100" THEN
					siguiente_estado = "101";





  end architecture;
  