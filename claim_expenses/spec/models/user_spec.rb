require 'spec_helper'

describe User do

  it "has method admin" do
    user = FactoryGirl.create(:user)
    user.should respond_to("admin?")
  end
end