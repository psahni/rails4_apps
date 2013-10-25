require 'spec_helper'

describe HomeController do

  include Devise::TestHelpers

  def login_user
    @user = FactoryGirl.create(:user)
    #controller.stub!(:current_user).and_return(@user)
    sign_in @user
    @request.session[:user_id] = @user ? @user.id : nil
  end
  context 'expenses page' do
    it 'should redirect to sign in page if not logged in' do
      controller.stub!(:current_user).and_return(nil)
      get :index
      response.should redirect_to sign_in_path
    end

    it 'should redirect to expenses page if logged in' do
      login_user
      get :index
      response.should redirect_to expenses_path
    end

  end
end