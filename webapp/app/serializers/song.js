var SongSerializer = DS.ActiveModelSerializer.extend({
  attrs: {
    sounds: {embedded: 'always'}
  }
});
export default SongSerializer;
