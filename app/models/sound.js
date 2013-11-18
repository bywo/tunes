var Sound = DS.Model.extend({
  soundType: DS.attr(),
  identifier: DS.attr()

});

Sound.FIXTURES = [{
  id: 1,
  soundType: 'soundcloud',
  identifier: '293'
}, {
  id: 2,
  soundType: 'youtube',
  identifier: '66L5jxLBa8M'
}, {
  id: 3,
  soundType: 'soundcloud',
  identifier: '117548701'
}, {
  id: 4,
  soundType: 'soundcloud',
  identifier: '102584835'
}];

export default Sound;

