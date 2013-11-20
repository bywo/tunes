var Sound = DS.Model.extend({
  song: DS.belongsTo('song'),
  soundType: DS.attr('string'),
  identifier: DS.attr('string')

});

Sound.FIXTURES = [{
  id: 1,
  song: 1,
  soundType: 'youtube',
  identifier: '66L5jxLBa8M'
}, {
  id: 2,
  song: 2,
  soundType: 'soundcloud',
  identifier: '117548701'
}, {
  id: 3,
  song: 3,
  soundType: 'soundcloud',
  identifier: '102584835'
}];

export default Sound;

