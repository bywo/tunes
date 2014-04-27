require 'spec_helper'

describe Group do
  let(:group){ FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:memberships) }
  #it { should respond_to(:playlist) }

  it { should be_valid }

  describe 'managing members' do
    let(:new_member_user){ FactoryGirl.create(:user) }
    let(:non_member_user){ FactoryGirl.create(:user) }

    before do
      group.add_member!(new_member_user)
    end

    describe "adds new memeber" do
      its(:users) {should include(new_member_user)}
    end

    describe "removing members" do
      before { group.remove_member!(new_member_user) }

      its(:users) { should_not include(new_member_user) }

      # this is a little too tightly coupled with the implementation imo
      #
      it "blows up when removing a non-member" do
        expect{group.remove_member!(non_member_user)}.to raise_error(NoMethodError)
      end
    end
  end


  describe 'managing posts' do
    let(:user){ FactoryGirl.create(:user) }
    let(:song){ FactoryGirl.create(:song) }
    let(:fake_text_post) { FactoryGirl.create(:text_post) }
    let(:fake_song_post) { FactoryGirl.create(:song_post) }

    describe 'text posts' do
      let(:text_post) { group.add_text_post!(user, fake_text_post.content) }

      describe 'adding new text post' do
        its(:text_posts) { should include(text_post) }
        its(:posts) { should include(text_post) }
      end

      describe 'remove text post' do
        before { group.remove_post!(text_post) }

        its(:text_posts) { should_not include(text_post) }
        its(:posts) { should_not include(text_post) }
      end
    end

    describe 'song posts' do
      let(:song_post) { group.add_song_post!(user, fake_song_post.content, fake_song_post.song) }

      describe 'adding new song post' do
        its(:song_posts) { should include(song_post) }
        its(:posts) { should include(song_post) }
      end

      describe 'remove song post' do
        before { group.remove_post!(song_post) }

        its(:song_posts) { should_not include(song_post) }
        its(:posts) { should_not include(song_post) }
      end
    end
  end


  describe 'post feed' do


  end

end
