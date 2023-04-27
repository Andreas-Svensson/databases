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



-- ###################
-- ### Exercise 5D ###
-- ###################

SELECT
	p.Name,
	COUNT(DISTINCT a.ArtistID) AS 'Unique Artists'
FROM
	Music.Playlists p
	JOIN Music.playlist_track pt ON p.PlaylistID = pt.PlaylistID
	JOIN Music.Tracks t ON pt.TrackID = t.TrackID
	JOIN Music.Albums a ON t.AlbumID = a.AlbumID
GROUP BY
	p.PlaylistID,
	p.Name
ORDER BY
	[Unique Artists] DESC

-->

-- Playlist       Unique Artists
-- Music          198     <-- NOTE: 2 identical playlists named "Music" with different PlaylistID exist, this is why it's important to group on ID as well as Name
-- Music          198
-- 90’s Music     109
-- Classical      67



-- ###################
-- ### Exercise 5E ###
-- ###################

SELECT
	AVG(artist_count) AS 'Average Artists per Playlist'
FROM 
	(
    SELECT COUNT(DISTINCT a.ArtistID) AS artist_count
    FROM Music.Playlists p
    JOIN Music.Playlist_Track pt ON p.PlaylistID = pt.PlaylistID
    JOIN Music.Tracks t ON pt.TrackID = t.TrackID
    JOIN Music.Albums a ON t.AlbumID = a.AlbumID
    GROUP BY p.PlaylistID
	) AS subquery;

-->

-- Average Artists per Playlist
-- 49


