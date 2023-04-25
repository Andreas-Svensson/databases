-- ###################
-- ### Exercise 1A ###
-- ###################


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
