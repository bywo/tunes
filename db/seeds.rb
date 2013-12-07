# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = Song.where(:title => "It Won't Stop", :artist => "Sevyn Streeter").first_or_create
Sound.where(:song => s, :sound_type => 'youtube', :location => 'aEz1GNUGfwY').first_or_create

s = Song.where(:title => "Without a Word", :artist => "Jaze Baqti").first_or_create
Sound.where(:song => s, :sound_type => 'soundcloud', :location => '122846285').first_or_create

s = Song.where(:title => "Sexual Healing (Kygo Remix)", :artist => "Marvin Gaye").first_or_create
Sound.where(:song => s, :sound_type => 'soundcloud', :location => '121239554').first_or_create

s = Song.where(:title => "Simple Things (Original Mix)", :artist => "Foyle & Zo").first_or_create
Sound.where(:song => s, :sound_type => 'youtube', :location => 'DT5sF1kBDGE').first_or_create


s = Song.where(:title => "Pillz", :artist => "Flosstradamus").first_or_create
Sound.where(:song => s, :sound_type => 'soundcloud', :location => '111133727').first_or_create
