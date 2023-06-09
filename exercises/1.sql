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
-- ### Exercise 1D ###
-- ###################

SELECT * INTO Elements2 FROM Elements

DELETE FROM
	Elements2
WHERE
	Name IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
	OR LEFT(Name, 1) IN ('d', 'k', 'm', 'o', 'u')

SELECT * FROM Elements2

-->

-- Number      Symbol       Name          Period     Group     Mass     Radius     Valenceel     Stableisotopes     Meltingpoint     Boilingpoint     Density
-- 1           H            Hydrogen      1          1         1,008    25         1             2                  14,1             20,3             0,084
-- -           -            -             -          -         -        -          -             -                  -                -                -         <-- DROPPED Helium
-- 3           Li           Lithium       2          1         6,941    145        1             2                  454              1615             0,53
-- 4           Be           Beryllium     2          2         9,012    105        2             1                  1551             3750             1,85
-- 5           B            Boron         2          13        10,81    85         3             2                  2349             4200             2,46
-- 6           C            Carbon        2          14        12,011   70         4             2                  3820             5100             3,51
-- -           -            -             -          -         -        -          -             -                  -                -                -         <-- DROPPED Nitrogen
-- -           -            -             -          -         -        -          -             -                  -                -                -         <-- DROPPED Oxygen
-- 9           F            Fluorine      2          17        18,998   50         7             1                  53,5             85               1,58



-- ###################
-- ### Exercise 1E ###
-- ###################

SELECT
	Symbol,
	Name,
	CASE -- Name starts with same letter(s) as Symbol
		WHEN LEFT(Name, LEN(Symbol)) = Symbol THEN 'Yes'
		ELSE 'No'
		END AS 'YES/NO'
INTO
	Elements3
FROM
	Elements

SELECT * FROM Elements3

-->

-- Symbol     Name          YES/NO
-- H          Hydrogen      Yes
-- He         Helium        Yes
-- Li         Lithium       Yes
-- Be         Beryllium     Yes
-- B          Boron         Yes
-- C          Carbon        Yes
-- N          Nitrogen      Yes
-- O          Oxygen        Yes
-- F          Fluorine      Yes
-- Ne         Neon          Yes
-- Na         Sodium        No
-- Mg         Magnesium     No
-- Al         Aluminium     Yes



-- ###################
-- ### Exercise 1F ###
-- ###################

SELECT Name, Red, Green, Blue INTO Colors2 FROM Colors

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



-- ###################
-- ### Exercise 1G ###
-- ###################

SELECT
	Integer,
	CAST(Integer AS FLOAT) / 100 AS 'Float',
	String,
	-- NOTE: have to add DAY Integer - 1 because 2019-01-00 is not a valid date
	CAST(DATEADD(DAY, [Integer] - 1, DATEADD(MINUTE, [Integer], '2019-01-01 09:00:00')) AS DATETIME2) AS 'DateTime',
	Integer % 2 AS 'Bool'
FROM
	Types

-->

-- Integer     Float       String        DateTime                         Bool
-- 1           0,01        Alfa          2019-01-01 09:01:00.0000000       1
-- 2           0,02        Bravo         2019-01-02 09:02:00.0000000       0
-- 3           0,03        Charlie       2019-01-03 09:03:00.0000000       1
-- 4           0,04        Delta         2019-01-04 09:04:00.0000000       0
-- 5           0,05        Echo          2019-01-05 09:05:00.0000000       1
-- 6           0,06        Foxtrot       2019-01-06 09:06:00.0000000       0
-- 7           0,07        Golf          2019-01-07 09:07:00.0000000       1
-- 8           0,08        Hotel         2019-01-08 09:08:00.0000000       0
-- 9           0,09        India         2019-01-09 09:09:00.0000000       1
-- 10          0,1         Juliett       2019-01-10 09:10:00.0000000       0
-- 11          0,11        Kilo          2019-01-11 09:11:00.0000000       1

