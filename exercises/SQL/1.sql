-- ###################
-- ### Exercise 1A ###
-- ###################

SELECT
	Title,
	'S' + FORMAT(Season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')
FROM
	GameOfThrones

-->

-- Episode                                   Episode
-- Winter Is Coming                          S01E01
-- The Kingsroad                             S01E02
-- Lord Snow                                 S01E03
-- Cripples, Bastards, and Broken Things     S01E04
-- The Wolf and the Lion                     S01E05
-- A Golden Crown                            S01E06
-- You Win or You Die                        S01E07
-- The Pointy End                            S01E08
-- Baelor                                    S01E09
-- Fire and Blood                            S01E10
-- The North Remembers                       S02E01
-- The Night Lands                           S02E02



-- ###################
-- ### Exercise 1F ###
-- ###################

SELECT
	Name,
	Red,
	Green,
	Blue
INTO
	Colors2
FROM
	Colors

SELECT
	Name,
	'#' +
	CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Red), 2) +
	CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Green), 2) +
	CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Blue), 2)
	AS 'Code',
	Red,
	Green,
	Blue
FROM
	Colors2

-->

-- Name            Code        Red     Green    Blue
-- aliceblue       #F0F8FF     240     248      255
-- antiquewhite    #FAEBD7     250     235      215
-- aqua            #00FFFF     0       255      255
