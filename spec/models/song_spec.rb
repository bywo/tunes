require 'spec_helper'

describe Song do
  # create an example song using FactoryGirl (spec/factories.rb)
  let(:song){ FactoryGirl.create(:song) }

  # it will now refer to song var
  subject { song }

  # check for methods/attrs
  it { should respond_to(:title) }
  it { should respond_to(:artist) }

  # will run validations on song example obj
  # to get this to fail, set either title or artist properties to ''
  it { should be_valid }

  describe 'sounds association' do
    let!(:sound) { song.sounds.build }

    it 'should destroy associated microposts' do
      # save a copy of the song's sounds
      sounds = song.sounds.to_a
      # destory song
      song.destroy
      # check to make sure local copy is saved before destory (false positive)
      expect(sounds).not_to be_empty
      # verify that each sound has been destoryed
      sounds.each do |sound|
        expect(Sound.where(id: sound.id)).to be_empty
      end
    end
  end

end
