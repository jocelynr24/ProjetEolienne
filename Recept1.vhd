LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Recept1 is
	port
	(	signal stClk : in std_logic;
		signal stTSOP : in std_logic;
		signal stPresence : out std_logic
	);
end Recept1;

architecture Recept1_arch of Recept1 is
signal iCtDec : integer range 0 to 3200;
	begin
		process(stClk)
		begin
			if(stClk'event and stClk='1') then
				if(stTSOP='0') then
				iCtDec <= 3200;
				elsif(iCtDec > 0) then
				iCtDec <= iCtDec - 1;
				end if;
			end if;
		end process;
stPresence <= '1' when(iCtDec = 0)
		 else '0';
end Recept1_arch;