#!/usr/bin/env python
# -*- encoding: utf-8 -*-
'''
@File    :   scanQueuesTracks.py
@Time    :   2023/10/24
@Author  :   Jacob Roy
@Version :   1.0
@Contact :   lejacobroy@gmail.com
@Desc    :   
'''

from tidalrr.database import *
from tidalrr.tidal import *
from tidalrr.workers import *

def scanQueuedTracks():
    tracks = getTidalTracks()
    if len(tracks) > 0 :
        for i,track in enumerate(tracks):
            if hasattr(track, 'id') and track.queued:
                if track.queued:
                    print('Scanning track '+ str(i)+'/'+str(len(tracks))+' '+track.title)
                    result = start_track(track)
                    if result:
                        track.queued = False
                        updateTidalTrack(track)

def start_track(obj: Track):
    settings = getSettings()
    album = getTidalAlbum(obj.album)
    if settings.saveCovers:
        scanCover(album)
    file = getFileById(obj.id)
    queue = getTidalQueueById(obj.id)
    if file is None and queue is None:
        return scanTrack(obj, album, settings.audioQuality)
    else:
        print('File Exists, skipping')
        return True

def scanTrack(track: Track, album=Album, audioQuality='Normal', playlist=None):
    stream = TIDAL_API.getStreamUrl(track.id, audioQuality)
    artist = getTidalArtist(track.artist)
    if artist is not None and stream is not None:
        path = getTrackPath(track, stream, artist, album, playlist)

        queue = Queue(
            type='Track',
            login=True,
            id=track.id,
            path=path,
            url=stream.url,
            encryptionKey=stream.encryptionKey
        )

        addTidalQueue(queue)
        print('Adding track to queue '+track.title)
        return True
    else:
        print('Track '+str(track.id)+' Unknown artist or url'+ str(track.artist)+' '+ track.artists)
        # maybe add the artist and re-run
        return False