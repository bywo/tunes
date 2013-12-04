var SongsNewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('song');
  },
});

export default SongsNewRoute;
