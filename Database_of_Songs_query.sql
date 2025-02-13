create database musicDB

-- This table stores information about musicians or brands.

create table artists (
	artist_id int primary key auto_increment,
	artist_name varchar(100) not null,
	birth_date date,
	nationality varchar(50)
);

-- This tables stores different music genres.

create table genres (
	genre_id int primary key auto_increment,
    genre_name varchar(50) not null
);

-- This table storea albums, linked to the artist.

create table albums (
	albums_id int primary key auto_increment,
    album_name varchar(100) not null,
    release_year int,
    artist_id int,
    foreign key (artist_id) references
artists(artist_id)
);


-- This table stores songs, linked to the album and genre.

create table songs (
	song_id int primary key auto_increment,
    song_title varchar(100) not null,
    album_id int,
    genre_id int,
    duration time,
    release_date date,
    foreign key (album_id) references
albums(albums_id),
    foreign key (genre_id) references
genres(genre_id)
);

-- This table stores playlists of songs. 

create table playlist(
	playlist_id int primary key auto_increment,
    playlist_name varchar(100) not null,
    create_at timestamp default
current_timestamp
);


-- This table links songs to specific playlists. 

create table playlist_songs (
	playlist_id int,
    song_id int,
    primary key (playlist_id,song_id),
    foreign key (playlist_id) references
playlist(playlist_id),
	foreign key (song_id) references songs(song_id)
);


-- Artists
INSERT INTO artists (artist_name, birth_date, nationality) VALUES
('The Beatles', '1960-01-01', 'British'),
('Adele', '1988-05-05', 'British'),
('Taylor Swift', '1989-12-13', 'American'),
('Elton John', '1947-03-25', 'British'),
('Billie Eilish', '2001-12-18', 'American'),
('Drake', '1986-10-24', 'Canadian'),
('Ed Sheeran', '1991-02-17', 'British'),
('BTS', '2013-06-13', 'South Korean'),
('Queen', '1970-01-01', 'British'),
('Beethoven', '1770-12-17', 'German');

-- Genres
INSERT INTO genres (genre_name) VALUES
('Pop'),
('Rock'),
('Jazz'),
('Classical'),
('Hip-Hop'),
('Electronic'),
('Reggae'),
('Blues'),
('Country'),
('Metal');

-- Albums
INSERT INTO albums (album_name, release_year, artist_id) VALUES
('Abbey Road', 1969, 1),
('25', 2015, 2),
('1989', 2014, 3),
('Goodbye Yellow Brick Road', 1973, 4),
('When We All Fall Asleep', 2019, 5),
('Scorpion', 2018, 6),
('Divide', 2017, 7),
('Map of the Soul: 7', 2020, 8),
('A Night at the Opera', 1975, 9),
('Symphony No. 5', 1808, 10);

-- Songs
INSERT INTO songs (song_title, album_id, genre_id, duration, release_date) VALUES
('Come Together', 1, 2, '00:04:19', '1969-09-26'),
('Hello', 2, 1, '00:04:55', '2015-10-23'),
('Shake It Off', 3, 1, '00:03:39', '2014-08-18'),
('Your Song', 4, 1, '00:04:00', '1973-10-05'),
('Bad Guy', 5, 5, '00:03:14', '2019-03-29'),
('Gods Plan', 6, 5, '00:03:18', '2018-01-19'),
('Shape of You', 7, 1, '00:03:53', '2017-01-06'),
('ON', 8, 5, '00:04:06', '2020-02-21'),
('Bohemian Rhapsody', 9, 2, '00:05:55', '1975-10-31'),
('Fifth Symphony', 10, 4, '00:07:05', '1808-12-22');

-- Playlists
INSERT INTO playlist (playlist_name) VALUES
('Chill Vibes'),
('Workout Mix'),
('Party Hits'),
('Relaxing Classics'),
('Top 100');

-- Playlist_Songs
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

-- Generating additional data (repeated with variations for a total of 1000 rows)
-- You can run a script to auto-generate more entries based on this template.


-- Get all songs by a specific artist:

select so.song_title
from songs as so
join albums as a on so.album_id = a.albums_id
join artists as ar on a.artist_id = ar.artist_id
where ar.artist_name = 'The Beatles';


-- Get all albums in a particular genre:

select al.album_name,g.genre_name
from albums as al
join songs as s on al.albums_id = s.album_id
join genres as g on s.genre_id = g.genre_id
where g.genre_name = 'Pop';

-- Get all songs in a playlist:

select s.song_title
from playlist_songs as ps
join songs as s on ps.song_id = s.song_id
where ps.playlist_id = 1;
    