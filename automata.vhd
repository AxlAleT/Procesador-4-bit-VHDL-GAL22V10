LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY secuencial IS
	PORT (
			--seleccion de operacion, y seleccion de registro
			input_bit : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

			--reloj
			Clk : IN std_logic

			estado_actual: inout std_logic_vector(2 downto 0);
	);
END secuencial;


architecture Behavior of secuencial is

begin
	process(Clk, input_bit)
	begin

	VARIABLE siguiente_estado : std_logic_vector(2 downto 0);

	if rising_edge(Clk) then

		estado_actual <= siguiente_estado;

		--Asignacion de estados
		
		--Los estados A, B, C o F pueden dar lugar a A, B, C o D
		if estado_actual = "000" or estado_actual = "001"
		or estado_actual = "010" or estado_actual = "101" THEN

			if input_bit = "00" THEN
			siguiente_estado <= "000";
			elsif input_bit = "01" THEN
			siguiente_estado <= "001";
			elsif input_bit = "10" THEN
			siguiente_estado <= "010";
			elsif input_bit = "11" THEN
			siguiente_estado <= "011";
			end if;

		--D, E solo pueden dar lugar al siguiente estado
		elsif estado_actual = "011" THEN
		siguiente_estado <= "100";
		elsif estado_actual = "100" THEN
		siguiente_estado <= "101";
		end if;

	end if;
	end process;

end architecture;