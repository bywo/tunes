var Router = Ember.Router.extend({
  location: 'history'
}); // ensure we don't share routes between all Router instances

Router.map(function() {
  this.route('component-test');
  this.route('helper-test');
  this.route('about');
  this.resource('songs', function() {
    this.route('new');
  });
});

export default Router;
