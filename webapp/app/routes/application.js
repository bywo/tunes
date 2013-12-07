var ApplicationRoute = Ember.Route.extend({
  activate: function() {
    this.keysLoading = $.getJSON('/api/keys').then(_.bind(function(keys) {
      this.controllerFor('player').set('keys', keys);
    }, this));
  },

  renderTemplate: function() {
    this.render();
    this.render('player', {
      outlet: 'player',
      controller: 'player',
      into: 'application'
    });
  },

  actions: {
    play: function(song) {
      var player = this.controllerFor('player');
      player.set('currentSong', song);
      // play
    }
  }
});

export default ApplicationRoute;
