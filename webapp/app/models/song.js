var Song = DS.Model.extend({

  title: DS.attr('string'),

  artist: DS.attr('string'),

  sounds: DS.hasMany('sound')

});

// Song.FIXTURES = [{
//   id: 1,
//   title: 'Home (Genix Remix)',
//   artist: 'Above & Beyond'
// }, {
//   id: 2,
//   title: 'Gas Pedal (Motez Edit)',
//   artist: 'Sage the Gemini'
// }, {
//   id: 3,
//   title: 'Without You (feat. Totally Enormous Extinct Dinosaurs)',
//   artist: 'Dillon Francis'
// }];

export default Song;

