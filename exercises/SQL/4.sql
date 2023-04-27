-- ##################
-- ### Exercise 4 ###
-- ##################

DECLARE @playlist varchar(max) = 'Heavy Metal Classic';

SELECT
	g.Name AS 'Genre',
	ar.Name AS 'Artist',
	al.Title AS 'Album',
	t.Name AS 'Track',
	FORMAT(DATEADD(ms, t.Milliseconds, '00:00'), 'mm:ss') AS 'Length',
	FORMAT(t.Bytes / 1048576.0, '#.0') + ' MiB' AS 'Size',
	ISNULL(t.Composer, '-') AS 'Composer'
FROM
	Music.Playlists p
	JOIN Music.Playlist_Track pt ON p.PlaylistId = pt.PlaylistId
	JOIN Music.Tracks t ON pt.TrackID = t.TrackID
	JOIN Music.Albums al ON t.AlbumID = al.AlbumID
	JOIN Music.Artists ar ON al.ArtistID = ar.ArtistID
	JOIN Music.Media_Types mt ON t.MediaTypeID = mt.MediaTypeID
	JOIN Music.Genres g ON t.GenreID = g.GenreID
WHERE
	p.Name = @playlist
ORDER BY
	Genre,
	Artist,
	Album,
	Track

-->

-- Genre           Artist            Album             Track          Length     Size         Composer
-- Heavy Metal     Iron Maiden       Killers           Killers        05:00      6.9 MiB      Steve Harris
-- Heavy Metal     Iron Maiden       Killers           Wrathchild     02:54      4.0 MiB      Steve Harris
-- Metal           Black Sabbath     Black Sabbath     N.I.B.         06:08      11.5 MiB     -