import players from 'appkit/api-player';

var PlayerController = Ember.Controller.extend({
  currentSong: null,

  updateCurrentSound: function() {
    var currentSong = this.get('currentSong');
    if (currentSong) {
      this.set('currentSound', currentSong.get('sounds').content[0]);
    } else {
      this.unset('currentSound');
    }
  }.observes('currentSong'),

  setupPlayer: function() {
    var player = this.get('player');
    if (player) {
      player.destroy();
    }

    var currentSound = this.get('currentSound');
    var soundType = currentSound.get('soundType');
    if (soundType === 'youtube') {
      player = players.YoutubePlayer.create({
        currentSound: currentSound
      });
      this.set('player', player);
    } else if (soundType == 'soundcloud') {
      player = players.SoundcloudPlayer.create({
        currentSound: currentSound
      });
      this.set('player', player);
    }
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

