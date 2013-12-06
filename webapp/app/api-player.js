import keys from 'appkit/keys';

var hasScInited = false;
function initSoundcloud() {
  if (!hasScInited) {
    hasScInited = true;
    SC.initialize({
      client_id: keys.soundcloud
    });
  }
}

var SoundcloudPlayer = Ember.Object.extend({
  isPaused: true,
  isPlaying: false,

  init: function() {
    this._super();
    this._initing = Ember.RSVP.defer();
    this.initing = this._initing.promise;
    this._ending = Ember.RSVP.defer();
    this.ending = this._ending.promise;

    initSoundcloud();
    var player = SC.stream(this.get('currentSound').get('location'), _.bind(function(player) {
      this.set('player', player);
      player.load({
        whileplaying: _.bind(this._whilePlaying, this),
      })
      this._initing.resolve();
    }, this));
  },

  play: function() {
    this.get('player').play();
    this.set('isPaused', false);
  },

  pause: function() {
    this.get('player').pause();
    this.set('isPaused', true);
    this.set('isPlaying', false);
  },

  seekTo: function(seconds) {
    this.get('player').setPosition(seconds * 1000);
  },

  setVolume: function(volume) {
    this.get('player').setVolume(volume);
  },

  setMute: function() {
    this.initing.then(_.bind(function() {
      if (this.get('isMuted')) {
        this.get('player').mute();
      } else {
        this.get('player').unmute();
      }
    }, this));
  }.observes('isMuted').on('init'),

  destroy: function() {
    this.get('player').destruct();
  },

  _whilePlaying: function() {
    if (!this.get('isPaused')) {
      this.set('isPlaying', true);
    }
    this.set('position', this.get('player').position / 1000);
  }
});

var ytPlayerVars = {
  autoplay: 0,
  autohide: 1,
  controls: 0,
  disablekb: 1,
  fs: 0,
  iv_load_policy: 3,
  modestbranding: 1,
  rel: 0,
  showinfo: 0,
  html5: 1
};

var YoutubePlayer = Ember.Object.extend({
  isPaused: true,
  isPlaying: false,

  init: function() {
    this._super();
    this._initing = Ember.RSVP.defer();
    this.initing = this._initing.promise;
    this._ending = Ember.RSVP.defer();
    this.ending = this._ending.promise;

    this._trackPosition = _.bind(this._trackPosition, this);

    var player = new YT.Player('youtube-player', {
      height: '100',
      width: '100',
      videoId: this.get('currentSound').get('location'),
      playerVars: ytPlayerVars,
      events: {
        onReady: _.bind(this._onPlayerReady, this),
        onStateChange: _.bind(this._onStateChange, this)
      }
    });
    this.set('player', player);
  },

  play: function() {
    this.get('player').playVideo();
  },

  pause: function() {
    this.get('player').pauseVideo();
  },

  seekTo: function(seconds) {
    this.get('player').seekTo(seconds, true);
  },

  setVolume: function(volume) {
    this.get('player').setVolume(volume);
  },

  setMute: function() {
    this.initing.then(_.bind(function() {
      if (this.get('isMuted')) {
        this.get('player').mute();
      } else {
        this.get('player').unMute();
      }
    }, this));
  }.observes('isMuted').on('init'),

  _onPlayPause: function() {
    if (this.get('isPlaying')) {
      if (!this.trackPositionId) {
        this.trackPositionId = window.setInterval(this._trackPosition, 1000);
      }
    } else {
      window.clearInterval(this.trackPositionId);
      this.trackPositionId = null;
    }
  }.observes('isPlaying'),

  _trackPosition: function() {
    this.set('position', this.get('player').getCurrentTime());
  },

  _onPlayerReady: function() {
    this.set('duration', this.get('player').getDuration());
    this._initing.resolve();
  },

  _onStateChange: function(event) {
    switch (event.data) {
      case YT.PlayerState.ENDED:
        this._ending.resolve();
        this.set('isPaused', true);
        this.set('isPlaying', false);
        break;
      case YT.PlayerState.PLAYING:
        this.set('isPaused', false);
        this.set('isPlaying', true);
        break;
      case YT.PlayerState.PAUSED:
        this.set('isPaused', true);
        this.set('isPlaying', false);
        break;
      case YT.PlayerState.BUFFERING:
        this.set('isPaused', false);
        this.set('isPlaying', false);
        break;
    }
  },

  destroy: function() {
    this.get('player').destroy();
  }
});

export var SoundcloudPlayer = SoundcloudPlayer;
export var YoutubePlayer = YoutubePlayer;
