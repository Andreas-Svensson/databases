-- ###################
-- ### Exercise 5A ###
-- ###################

SELECT -- TOP 1
	ar.Name AS 'Artist',
	COUNT(t.TrackID) AS 'Tracks',
	SUM(t.Milliseconds) / 60000 AS 'Total Duration (min)'
FROM
	Music.Artists ar
	JOIN Music.Albums al ON ar.ArtistID = al.ArtistID
	JOIN Music.Tracks t ON al.AlbumID = t.AlbumID
	JOIN Music.Media_Types m ON t.MediaTypeID = m.MediaTypeID
WHERE
	m.Name <> 'Protected MPEG-4 video file'
GROUP BY
	ar.Name
ORDER BY
	[Total Duration (min)] DESC

-->

-- Artist           Tracks     Total Duration (hours)
-- Iron Maiden      213        1197
-- Led Zeppelin     114        668
-- Metallica        112        648



-- ###################
-- ### Exercise 5B ###
-- ###################

SELECT -- TOP 1
	ar.Name AS 'Artist',
	COUNT(t.TrackID) AS 'Tracks',
	SUM(t.Milliseconds) / 60000 AS 'Total Duration (min)',
	FORMAT(DATEADD(ms, SUM(t.Milliseconds) / COUNT(t.TrackID), '00:00'), 'mm:ss') AS 'Average Duration (min:sec)'
FROM
	Music.Artists ar
	JOIN Music.Albums al ON ar.ArtistID = al.ArtistID
	JOIN Music.Tracks t ON al.AlbumID = t.AlbumID
	JOIN Music.Media_Types m ON t.MediaTypeID = m.MediaTypeID
WHERE
	m.Name <> 'Protected MPEG-4 video file'
GROUP BY
	ar.Name
ORDER BY
	[Total Duration (min)] DESC

-->

-- Artist           Tracks     Total Duration (hours)     Average Duration (min:sec)
-- Iron Maiden      213        1197                       05:37
-- Led Zeppelin     114        668                        05:51
-- Metallica        112        648                        05:47



-- ###################
-- ### Exercise 5C ###
-- ###################

SELECT
	CAST(SUM(Bytes / POWER(10.0, 9)) AS DECIMAL (8, 2)) AS 'Total File Size of Video Files (GB)'
FROM
	Music.Media_Types m
	JOIN Music.Tracks t ON m.MediaTypeID = t.MediaTypeID
WHERE
	m.Name = 'Protected MPEG-4 video file'

-->

-- Total File Size of Video Files (GB)
-- 89.99



