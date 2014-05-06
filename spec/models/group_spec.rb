require 'spec_helper'

describe Group do
  let(:group){ FactoryGirl.create(:group) }

  subject { group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:memberships) }
  #it { should respond_to(:playlist) }
  it { should respond_to(:owner) }

  it { should be_valid }

  # its(:owner) { should_not be_nil }


  describe 'managing members' do
    let(:new_member_user){ FactoryGirl.create(:user) }
    let(:non_member_user){ FactoryGirl.create(:user) }

    before do
      group.add_member!(new_member_user)
    end

    describe "adds new memeber" do
      describe "first time member" do
        its(:users) {should include(new_member_user)}
        its(:users) { should have(1).items }
      end

      describe "redundant add" do
        before do
          group.add_member!(new_member_user)
        end

        its(:users) { should have(1).items }
      end
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
      before { @text_post = group.add_text_post!(user, fake_text_post.content) }

      describe 'new text post' do
        subject { @text_post }
        its(:user) { should == user }
        its(:content) { should == fake_text_post.content }
      end

      describe 'adding new text post' do
        its(:text_posts) { should include(@text_post) }
        its(:posts) { should include(@text_post) }
      end

      describe 'remove text post' do
        before { group.remove_post!(@text_post) }

        its(:text_posts) { should_not include(@text_post) }
        its(:posts) { should_not include(@text_post) }
      end
    end

    describe 'song posts' do
      before { @song_post = group.add_song_post!(user, fake_song_post.content, fake_song_post.song) }

      describe 'new song post' do
        subject { @song_post }
        its(:user) { should == user }
        its(:content) { should == fake_song_post.content }
        its(:song) { should == fake_song_post.song }
      end

      describe 'adding new song post' do
        its(:song_posts) { should include(@song_post) }
        its(:posts) { should include(@song_post) }
      end

      describe 'remove song post' do
        before { group.remove_post!(@song_post) }

        its(:song_posts) { should_not include(@song_post) }
        its(:posts) { should_not include(@song_post) }
      end
    end
  end


  describe 'post feed' do


  end

end
