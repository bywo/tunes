require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.create(:song_post) }

  subject { post }

  it { should respond_to(:group) }
  it { should respond_to(:user) }
  it { should respond_to(:post_likes) }
  it { should respond_to(:likes) }

  describe 'managing likes' do
    let(:user) { FactoryGirl.create(:user) }
    before { @like = post.add_like!(user) }

    describe 'add new like' do
      its(:likes) { should include(@like) }
    end

    describe 'new like' do
      subject { @like }
      its(:user) { should == user }
    end

    describe 'remove like' do
      before { post.remove_like!(user) }
      its(:likes) { should_not include(@like) }

      it 'throws when removing unexisting like' do
        expect { post.remove_like!(user) }.to raise_error()
      end
    end
  end
end
