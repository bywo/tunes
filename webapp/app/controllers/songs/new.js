var SongsNewController = Ember.Controller.extend({
  actions: {
    save: function() {
      var ctrl = this;
      this.get('model').save().then(function() {
        ctrl.transitionToRoute('index');
      })
    }
  }

});

export default SongsNewController;

