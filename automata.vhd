LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY automata IS
PORT (
--puerto de entrada para registros
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

--seleccion de operacion, y seleccion de registro
   input_bit, Slct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

--reloj
Clk : IN std_logic;

--salida, muestra un registro seleccionado
   Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END automata;

architecture Behavior of automata is
begin
process(Clk, input_bit, Slct)
begin

VARIABLE estado_actual, siguiente_estado : std_logic_vector(2 downto 0);
VARIABLE D1, D2, D3 : std_logic_vector(3 downto 0);

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

--Operaciones realizadas por los estados

--Estado B, escribe en un registro lo que este recibiendo por las entradas
if estado_actual = "001" THEN
if Slct = "00" then
D1 <= D;
elsif Slct = "01" then
D2 <= D;
elsif Slct = "10" then
D3 <= D;
end if;

--Estado C, muestra por las salidas el contenido de un registro
elsif estado_actual = "010" then
if Slct = "00" then
Q <= D1;
elsif Slct = "01" then
Q <= D2;
elsif Slct = "10" then
Q <= D3;
end if;

--Estado D, copia al registro 2 en el 3
elsif estado_actual = "011" then
D3 <= D2;

--Estado E, copia al registro 1 en el 2
elsif estado_actual = "100" then
D2 <= D1;

--Estado F, copia al registro 3 en el 1
elsif estado_actual = "101" then
D1 <= D3;

end if;

end if;
end process;

end architecture;