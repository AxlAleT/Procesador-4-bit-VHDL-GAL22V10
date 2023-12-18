LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg8 IS
	PORT ( 
	D : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	Clock : IN STD_LOGIC ;
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
	) ;
END reg8;

ARCHITECTURE Behavior OF reg8 IS
BEGIN
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			Q <= D;
		END IF;
	END PROCESS;
END Behavior;
