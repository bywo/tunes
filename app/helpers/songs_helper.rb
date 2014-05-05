module SongsHelper

  def song_from_soundcloud_url(url)
    client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_KEY'])
    sound_info = resolve_soundcloud_sound(client, url)

    sound = Sound.find_by(sound_type: 'soundcloud', location: sound_info.id.to_s)
    if sound
      return sound.song
    end

    artist_info = client.get("/users/#{sound_info.user_id}")

    song = Song.new({
      title: sound_info.title,
      artist: artist_info.username
    })
    song.save

    sound = Sound.new({
      sound_type: 'soundcloud',
      location: sound_info.id.to_s,
      song: song
    })
    sound.save

    return song
  end

  def resolve_soundcloud_sound(client, url)
    sound_info = client.get('/resolve', :url => url)
    if !sound_info.streamable
      fail 'Sound is not streamable'
    end

    return sound_info
  end

end
