DROP TABLE IF EXISTS settings;
CREATE TABLE settings (
    albumFolderFormat TEXT NOT NULL,
    apiKeyIndex INTEGER,
    audioQuality TEXT,
    checkExist BOOLEAN,
    downloadDelay BOOLEAN,
    downloadPath TEXT,
    includeEP BOOLEAN,
    language INTEGER,
    lyricFile BOOLEAN,
    multiThread BOOLEAN,
    playlistFolderFormat TEXT NOT NULL,
    saveAlbumInfo BOOLEAN,
    saveCovers BOOLEAN,
    showProgress BOOLEAN,
    showTrackInfo BOOLEAN,
    trackFileFormat TEXT NOT NULL,
    usePlaylistFolder BOOLEAN,
    scanUserPlaylists BOOLEAN,
    lidarrUrl TEXT,
    lidarrApi TEXT,
    tidalToken BLOB,
    plexUrl TEXT,
    plexToken TEXT,
    plexHomePath TEXT
);

DROP TABLE IF EXISTS tidal_artists;
CREATE TABLE tidal_artists (
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT,
    url TEXT,
    path TEXT,
    queued BOOLEAN,
    downloaded BOOLEAN
);

DROP TABLE IF EXISTS tidal_albums;
CREATE TABLE tidal_albums (
    id INTEGER NOT NULL PRIMARY KEY,
    title TEXT,
    duration INTEGER,
    numberOfTracks INTEGER,
    numberOfVolumes INTEGER,
    releaseDate DATE,
    type  TEXT,
    version TEXT,
    cover TEXT,
    explicit BOOLEAN,
    audioQuality TEXT,
    audioModes TEXT,
    artist INTEGER,
    artists TEXT,
    url TEXT,
    path TEXT,
    queued BOOLEAN,
    downloaded BOOLEAN
);

DROP TABLE IF EXISTS tidal_playlists;
CREATE TABLE tidal_playlists (
    uuid TEXT NOT NULL PRIMARY KEY,
    title TEXT,
    duration INTEGER,
    numberOfTracks INTEGER,
    description TEXT,
    image TEXT,
    squareImage TEXT,
    URL TEXT,
    path TEXT,
    queued BOOLEAN,
    downloaded BOOLEAN,
    plexUUID TEXT
);

DROP TABLE IF EXISTS tidal_tracks;
CREATE TABLE tidal_tracks (
    id INTEGER NOT NULL PRIMARY KEY,
    title TEXT,
    duration INTEGER,
    trackNumber INTEGER,
    volumeNumber INTEGER,
    trackNumberOnPlaylist INTEGER,
    version TEXT,
    isrc TEXT,
    explicit BOOLEAN,
    audioQuality TEXT,
    audioModes TEXT,
    copyRight TEXT,
    artist INTEGER,
    artists TEXT,
    album INTEGER,
    URL TEXT,
    path TEXT,
    queued BOOLEAN,
    downloaded BOOLEAN,
    plexUUID TEXT
);

DROP TABLE IF EXISTS tidal_queue;
CREATE TABLE tidal_queue (
    url TEXT NOT NULL PRIMARY KEY,
    type TEXT,
    login BOOLEAN,
    id INTEGER,
    path TEXT,
    encryptionKey TEXT,
    urls TEXT
);

DROP TABLE IF EXISTS files;
CREATE TABLE files (
    path TEXT NOT NULL PRIMARY KEY,
    type TEXT,
    id INTEGER,
    description TEXT
);

DROP TABLE IF EXISTS tidal_key;
CREATE TABLE tidal_key (
    deviceCode TEXT,
    userCode TEXT,
    verificationUrl TEXT,
    authCheckTimeout INT,
    authCheckInterval INT,
    userId TEXT,
    countryCode TEXT,
    accessToken TEXT,
    refreshToken TEXT,
    expiresIn INT,
    token TEXT,
    clientId TEXT,
    clientSecret TEXT
);

DROP TABLE IF EXISTS tidal_playlist_tracks;
CREATE TABLE tidal_playlist_tracks (
    uuid TEXT NOT NULL,
    track INT NOT NULL,
    puid TEXT,
    UNIQUE(uuid, track)
);