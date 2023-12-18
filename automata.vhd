LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY automata IS
	PORT ( 
        D0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	    Clock : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		OE : IN STD_LOGIC;
		LE : IN STD_LOGIC;
		LOAD : IN STD_LOGIC;
		SWAPT : IN STD_LOGIC; 
	    Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
    );
END automata;

architecture structural of automata is
	component reg8 is
	  port (
		D : in std_logic_vector(3 downto 0);
		Clock : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	  );
	end component;
	
	signal D1, D2, D3 : std_logic_vector(3 downto 0);
	signal Clock : std_logic;
	signal Q1, Q2, Q3 : std_logic_vector(3 downto 0);
	
  begin
	instance1: reg8 port map (
	  D => D1,
	  Clock => Clock,
	  Q => Q1
	);
	
	instance2: reg8 port map (
	  D => D2,
	  Clock => Clock,
	  Q => Q2
	);
	
	instance3: reg8 port map (
	  D => D3,
	  Clock => Clock,
	  Q => Q3
	);


  end architecture;
  