require 'spec_helper'

BABY_URL = "https://soundcloud.com/saintpepsi/baby"
BABY_JSON = "{\"kind\":\"track\",\"id\":135417787,\"created_at\":\"2014/02/18 05:07:49 +0000\",\"user_id\":31531137,\"duration\":192070,\"commentable\":true,\"state\":\"finished\",\"original_content_size\":33868844,\"sharing\":\"public\",\"tag_list\":\"\",\"permalink\":\"baby\",\"streamable\":true,\"embeddable_by\":\"all\",\"downloadable\":false,\"purchase_url\":null,\"label_id\":null,\"purchase_title\":null,\"genre\":\"R\\u0026B\",\"title\":\"Baby\",\"description\":\"DOWNLOAD GIN CITY HERE: saintpepsi.bandcamp.com/album/gin-city\\r\\n\",\"label_name\":\"\",\"release\":\"\",\"track_type\":\"\",\"key_signature\":\"\",\"isrc\":\"\",\"video_url\":null,\"bpm\":null,\"release_year\":null,\"release_month\":null,\"release_day\":null,\"original_format\":\"wav\",\"license\":\"all-rights-reserved\",\"uri\":\"http://api.soundcloud.com/tracks/135417787\",\"user\":{\"id\":31531137,\"kind\":\"user\",\"permalink\":\"saintpepsi\",\"username\":\"SAINT PEPSI\",\"uri\":\"http://api.soundcloud.com/users/31531137\",\"permalink_url\":\"http://soundcloud.com/saintpepsi\",\"avatar_url\":\"http://i1.sndcdn.com/avatars-000044265573-3am5yz-large.jpg?61e8f21\"},\"permalink_url\":\"http://soundcloud.com/saintpepsi/baby\",\"artwork_url\":\"http://i1.sndcdn.com/artworks-000071909934-i61hek-large.jpg?61e8f21\",\"waveform_url\":\"http://w1.sndcdn.com/FaMBEPsgVLnm_m.png\",\"stream_url\":\"http://api.soundcloud.com/tracks/135417787/stream\",\"playback_count\":99317,\"download_count\":1000,\"favoritings_count\":1988,\"comment_count\":99,\"attachments_uri\":\"http://api.soundcloud.com/tracks/135417787/attachments\"}"
SAINTPEPSI_JSON = "{\"id\":31531137,\"kind\":\"user\",\"permalink\":\"saintpepsi\",\"username\":\"SAINT PEPSI\",\"uri\":\"http://api.soundcloud.com/users/31531137\",\"permalink_url\":\"http://soundcloud.com/saintpepsi\",\"avatar_url\":\"http://i1.sndcdn.com/avatars-000044265573-3am5yz-large.jpg?61e8f21\",\"country\":null,\"first_name\":\"Ryan\",\"last_name\":\"DeRobertis\",\"full_name\":\"Ryan DeRobertis\",\"description\":\"BOOKING/MANAGEMENT: saintpepsi.mgmt@gmail.com\\r\\n\",\"city\":\"\",\"discogs_name\":null,\"myspace_name\":null,\"website\":\"http://saintpepsi.bandcamp.com/\",\"website_title\":\"SAINT PEPSI  B A N D C A M P\",\"online\":false,\"track_count\":30,\"playlist_count\":1,\"plan\":\"Pro\",\"public_favorites_count\":540,\"followers_count\":17082,\"followings_count\":400,\"subscriptions\":[{\"product\":{\"id\":\"creator-pro\",\"name\":\"Pro\"}}]}"

describe SongsHelper do
  describe "song_from_soundcloud_url" do
    before do
      # stub out Soundcloud API requests
      stub_request(:get, "http://api.soundcloud.com/resolve").
        with(query: hash_including({"url" => BABY_URL})).
        to_return(status: 200, body: BABY_JSON, headers: {"Content-Type" => "application/json; charset=utf-8"})

      stub_request(:get, "http://api.soundcloud.com/users/31531137").
        with(query: hash_including({})).
        to_return(status: 200, body: SAINTPEPSI_JSON, headers: {"Content-Type" => "application/json; charset=utf-8"})
    end

    it "creates a song and sound with correct metadata" do
      song = helper.song_from_soundcloud_url(BABY_URL)
      expect(song[:title]).to eq("Baby")
      expect(song[:artist]).to eq("SAINT PEPSI")
      expect(song.sounds.exists?({:sound_type => 'soundcloud', :location => '135417787'})).to eq(true)
    end

    describe "redundant add" do
      before { @song = helper.song_from_soundcloud_url(BABY_URL) }

      it "should return same song" do
        song = helper.song_from_soundcloud_url(BABY_URL)
        expect(song).to eq(@song)
      end
    end
  end
end
