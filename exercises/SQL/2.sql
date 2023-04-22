-- ###################
-- ### Exercise 2A ###
-- ###################

SELECT
	[Period],
	MIN([Number]) AS 'From',
	MAX([Number]) AS 'To',
	FORMAT(AVG(StableIsotopes * 1.0),	'#.##') AS 'Average Isotopes',
	STRING_AGG(Symbol, ', ') AS 'Symbols'
FROM
	[Elements]
GROUP BY
	[Period]

-->

-- Period	From	To		Average Isotopes	Symbols
-- 1		1		2		2					H, He
-- 2		3		10		2					Li, Be, B, C, N, O, F, Ne
-- 3		11		18		2.25				Na, Mg, Al, Si, P, S, Cl, Ar
-- 4		19		36		2.88				K, Ca, Sc, Ti, V, Cr, Mn, Fe, Co, Ni, Cu, Zn, Ga, Ge, As, Se, Br, Kr
-- 5		37		54		3.73				Rb, Sr, Y, Zr, Nb, Mo, Tc, Ru, Rh, Pd, Ag, Cd, In, Sn, Sb, Te, I, Xe
-- 6		55		86		3.31				Cs, Ba, La, Ce, Pr, Nd, Pm, Sm, Eu, Gd, Tb, Dy, Ho, Er, Tm, Yb, Lu, Hf, Ta, W, Re, Os, Ir, Pt, Au, Hg, Tl, Pb, Bi, Po, At, Rn
-- 7		87		118		NULL				Fr, Ra, Ac, Th, Pa, U, Np, Pu, Am, Cm, Bk, Cf, Es, Fm, Md, No, Lr, Rf, Db, Sg, Bh, Hs, Mt, Ds, Rg, Cp, Nh, Fl, Mc, Lv, Ts, Og



-- ###################
-- ### Exercise 2B ###
-- ###################

SELECT
	Region,
	Country,
	City,
	COUNT(City) AS 'Customers'
FROM
	Company.Customers
GROUP BY
	Region,
	Country,
	City

-->

-- Region			Country		City		Customers
-- British Isles	Ireland		Cork		1
-- British Isles	UK			Cowes		1
-- British Isles	UK			London		6
-- Central America	Mexico		México D.F.	4
-- Eastern Europe	Poland		Warszawa	1
-- North America	Canada		Montréal	1



-- ###################
-- ### Exercise 2C ###
-- ###################

DECLARE @season_info NVARCHAR(max) = ''

SELECT
	@season_info += CONCAT(
		'Season ', Season,
		' broadcasted from ', DATENAME(MONTH, MIN([Original Air Date])),
		' to ', DATENAME(MONTH, MAX([Original Air Date])),
		' of ', DATEPART(YEAR, MIN([Original Air Date])), '.',
		' Total of ', COUNT(Episode), ' episodes',
		' seen by an average of ', FORMAT(AVG([U.S. Viewers(millions)]), '#.##'), ' million people in the US.', CHAR(13))
FROM
	GameOfThrones
GROUP BY
	Season

PRINT @season_info

-->

-- Season 1 broadcasted from April to June of 2011. Total of 10 episodes seen by an average of 2.52 million people in the US.
-- Season 2 broadcasted from April to June of 2012. Total of 10 episodes seen by an average of 3.8 million people in the US.
-- Season 3 broadcasted from March to June of 2013. Total of 10 episodes seen by an average of 4.97 million people in the US.



-- ###################
-- ### Exercise 2D ###
-- ###################

SELECT
	FirstName + ' ' + LastName AS 'Name',
	RIGHT((YEAR(GETDATE()) - LEFT(ID, 2)), 2) + ' years old' AS 'Age', -- last 2 numbers of [current year - birth year] (i.e. 2023 - 13 = 2010 -> 10)
	CASE
		WHEN SUBSTRING(ID, 10, 1) % 2 = 0 THEN 'Female'
		ELSE 'Male'
	END AS 'Gender'
FROM
	Users
ORDER BY
	FirstName,
	LastName

-->

-- Name				Age				Gender
-- Alexander Dahl	49 years old	Male
-- Alvin Lindholm	70 years old	Male
-- Anders Hansson	41 years old	Male
-- Anne Åkerman		48 years old	Female
-- Annette Bergfalk	61 years old	Female



-- ###################
-- ### Exercise 2E ###
-- ###################

-- TODO: check mortality calculation

SELECT
	Region,
	COUNT(Country) AS 'Countries',
	SUM(CAST([Population] AS BIGINT)) AS 'Population',
	SUM([Area (sq# mi#)]) AS 'Area (square miles)',
	FORMAT(SUM(CAST([Population] AS BIGINT)) * 1.0 / SUM([Area (sq# mi#)]), '#.##') AS 'Population Density (per square mile)',
	ROUND(AVG(CAST(REPLACE([Infant mortality (per 1000 births)], ',', '.') AS FLOAT)) * 100, 0) AS 'Infant Mortality (per 100.000)'
FROM
	Countries
GROUP BY
	Region

-->

-- Region				Countries	Population		Area (square miles)	Population Density (per square mile)	Infant Mortality (per 100.000)
-- ASIA (EX. NEAR EAST)	28			3687982236		23096712			159.68									4178
-- BALTICS				3			7184974			175015				41.05									810
-- C.W. OF IND. STATES	12			280081548		22100843			12.67									4441
-- EASTERN EUROPE		12			119914717		1152222				104.07									1269
-- LATIN AMER. & CARIB	45			561824599		20544084			27.35									2009
-- NEAR EAST			16			195068377		4355586				44.79									2338
-- NORTHERN AFRICA		6			161407133		6018890				26.82									3092
-- NORTHERN AMERICA		5			331672307		21782471			15.23									863
-- OCEANIA				21			33131662		8519812				3.89									2020
-- SUB-SAHARAN AFRICA	51			749437000		24341406			30.79									8004
-- WESTERN EUROPE		28			396339998		3710478				106.82									473



-- ###################
-- ### Exercise 2F ###
-- ###################

-- TODO: fix space before country

SELECT
	CASE
		WHEN [Location served] LIKE '%,%' THEN RIGHT([Location served], CHARINDEX(',', REVERSE([Location served])) - 1)
		ELSE [Location served]
	END AS 'Country',
	COUNT(DISTINCT(IATA)) as 'Airports',
	SUM(CASE WHEN ICAO IS NULL THEN 1 ELSE 0 END) AS 'Missing ICAO',
	FORMAT(SUM(CASE WHEN ICAO IS NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(DISTINCT(IATA)) * 100, '0.##') AS 'Missing ICAO (%)'
FROM
	airports
GROUP BY
	CASE
		WHEN [Location served] LIKE '%,%' THEN RIGHT([Location served], CHARINDEX(',', REVERSE([Location served])) - 1)
		ELSE [Location served]
	END

-->

-- Country								Airports		Missing ICAO		Missing ICAO (%)
--  Argentina							105				11					10.48
--  Ascension and Tristan da Cunha		2				0					0
--  Australia							612				108					17.65