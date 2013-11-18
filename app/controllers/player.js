import players from 'appkit/api-player';

var PlayerController = Ember.Controller.extend({
  currentSoundId: null,

  currentSound: function() {
    var currentSoundId = this.get('currentSoundId');
    if (currentSoundId) {
      var store = this.get('store');
      return store.find('sound', currentSoundId);
    }
  }.property('currentSoundId'),

  setupPlayer: function() {
    var player = this.get('player');
    if (player) {
      player.destroy();
    }
    this.get('currentSound').then(_.bind(function(currentSound) {
      var soundType = currentSound.get('soundType');
      if (soundType === 'youtube') {
        var player = players.YoutubePlayer.create({
          currentSound: currentSound
        });
        this.set('player', player);
      } else if (soundType == 'soundcloud') {
        var player = players.SoundcloudPlayer.create({
          currentSound: currentSound
        });
        this.set('player', player);
      }
    }, this));
  }.observes('currentSound'),

  actions: {
    play: function() {
      this.get('player').play();
    },
    pause: function() {
      this.get('player').pause();
    }
  }
});

export default PlayerController;

