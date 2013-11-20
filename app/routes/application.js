var ApplicationRoute = Ember.Route.extend({
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
