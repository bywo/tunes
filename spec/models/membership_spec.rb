require 'spec_helper'

describe Membership do
  let(:user){ FactoryGirl.create(:user) }
  let(:group){ FactoryGirl.create(:group) }
  let(:membership) { group.add_member!(user) }

  subject { membership }

  it { should respond_to(:user) }
  it { should respond_to(:group) }
  it { should respond_to(:owner) }

end
