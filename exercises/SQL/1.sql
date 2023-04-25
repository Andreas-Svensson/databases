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
-- ### Exercise 1B ###
-- ###################

SELECT
	ID,
	LOWER(LEFT(FirstName, 2) + LEFT(LastName, 2)) AS 'UserName',
	Password,
	FirstName,
	LastName,
	Email,
	Phone
INTO
	Users2
FROM
	Users

SELECT * FROM Users2

-->

-- ID              UserName     Password                             FirstName     LastName        Email                             Phone
-- 500603-4268     jole         422cf6c6f212dde0fa96c532de240104     Johanna       Lennartsson     johanna.lennartsson@gmail.com     070-9428041
-- 500607-6521     cakn         c5aa65949d20f6b20e1a922c13d974e7     Catharina     Knutson         catharina.knutson@yahoo.com       0702-3351252
-- 530407-7989     ulal         4fec58181bb416f09f8ef0f69433584f     Ulla          Alvarsson       ulla.alvarsson@hotmail.com        070-9922357


-- ###################
-- ### Exercise 1C ###
-- ###################

SELECT
	IATA,
	ICAO,
	[Airport Name],
	[Location Served],
	ISNULL(Time, '-') AS 'Time',
	ISNULL(DST, '-') AS 'DST'
INTO
	Airports2
FROM
	Airports

SELECT * FROM Airports2

-->

-- IATA     ICAO     Airport Name                                  Location Served                            Time          DST
-- AAA      NTGA     Anaa Airport                                  Anaa, Tuamotus, French Polynesia           UTC−10:00	    -
-- AAB      YARY     Arrabury Airport                              Arrabury, Queensland, Australia            UTC+10:00	    -
-- AAC      HEAR     El Arish International Airport                El Arish, Egypt                            UTC+02:00     -
-- AAD      NULL     Adado Airport                                 Adado (Cadaado), Galguduud, Somalia        UTC+03:00	    -
-- AAE      DABB     Rabah Bitat Airport (Les Salines Airport)     Annaba, Algeria                            UTC+01:00	    -
-- AAF      KAAF     Apalachicola Regional Airport                 Apalachicola, Florida, United States       UTC−05:00	    Mar-Nov



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
