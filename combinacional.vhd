LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY combinacional IS
PORT (
        --puerto de entrada para registros
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

        --seleccion de operacion, y seleccion de registro
        Slct : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

        --reloj
        Clk : IN std_logic;

        estado_actual: inout std_logic_vector(2 downto 0);

        --salida, muestra un registro seleccionado
        Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END combinacional;

architecture Behavior of combinacional is
begin
    process(Clk, Slct)
    begin
    VARIABLE D1, D2, D3 : std_logic_vector(3 downto 0);

    if rising_edge(Clk) then

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