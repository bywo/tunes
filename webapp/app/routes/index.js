var IndexRoute = Ember.Route.extend({
  model: function() {
    return this.get('store').findAll('song');
  },
  // renderTemplate: function() {
  //   this.render();
  //   this.render('player', {
  //     outlet: 'player',
  //     controller: 'player'
  //   });
  // }
});

export default IndexRoute;