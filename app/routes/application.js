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
    loadSound: function(sound) {
      this.controllerFor('player').set('currentSoundId', sound.id);
    }
  }
});

export default ApplicationRoute;
