module SongsHelper

  def song_from_soundcloud_url(url)
    client = HTTPClient.new
    soundcloud_key = ENV['SOUNDCLOUD_KEY']
    request_url = "http://api.soundcloud.com/resolve.json?url=#{url}&client_id=#{soundcloud_key}"
    message = client.get(request_url, :follow_redirect => true)
    sound_info = JSON.parse(message.content)
    if sound_info.key? 'errors'
      fail sound_info['errors'][0]['error_message']
    elsif !sound_info['streamable']
      fail 'Sound is not streamable'
    end

    artist_request_url = "http://api.soundcloud.com/users/#{sound_info['user_id']}.json?client_id=#{soundcloud_key}"
    artist_message = client.get(artist_request_url)
    artist_info = JSON.parse(artist_message.content)

    if artist_info.key? 'errors'
      fail artist_info['errors'][0]['error_message']
    end

    song = Song.new(:title => sound_info['title'], :artist => artist_info['username'])
    song.save

    sound = Sound.new({
      :sound_type => 'soundcloud',
      :location => sound_info['id'],
      :song => song
    })
    sound.save

    return song
  end

end
