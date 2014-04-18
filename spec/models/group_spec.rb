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


  describe 'playlist' do

  end


  describe 'post feed' do


  end

end
