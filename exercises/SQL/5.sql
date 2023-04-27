-- ###################
-- ### Exercise 5A ###
-- ###################

SELECT TOP 1
	ar.Name AS 'Artist',
	COUNT(DISTINCT t.TrackID) AS 'Tracks',
	CAST(SUM(t.Milliseconds) / 3600000.0 AS DECIMAL (6, 2)) AS 'Total Duration (hours)'
FROM
	Music.Artists ar
	JOIN Music.Albums al ON ar.ArtistID = al.ArtistID
	JOIN MUsic.Tracks t ON al.AlbumID = t.AlbumID
GROUP BY
	ar.Name
ORDER BY
	[Total Duration (hours)] DESC

-->

-- Artist     Tracks     Total Duration (hours)
-- Lost       92         66.19


