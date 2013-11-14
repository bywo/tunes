### Base

* Users can create Playlists.
* Songs can be added to Playlists.
* Songs are represented by one or more Sounds.
  * This part isn't required, but I think it's useful
    * prevents duplicate Songs
    * allows for a fallback if a single Sound gets taken down for whatever reason
    * gives flexibility for if a user has a preferred audio source (e.g. premium spotify account)
* Reordering playlists will take O(n) time to replace the `index` field for each Song. I couldn't find a better representation for playlists. We can worry about perf later.

```
Song
    id
    title
    artist
    album

Sound
    id
    song {Song}
    type # e.g. youtube, soundcloud, mp3
    location # used with type to locate the sound

Playlist
    id
    user {User}
    name

SongInList
    id
    playlist {Playlist}
    song {Song}
    index # int for where song is in the list

User
```

### Optional

```
Profile
    id
    user
    blurb
    facebook
    twitter

SongUserData
    id
    user {User}
    song {Song}
    rating
    time_added
    num_listens
```
