class Admin::ExpensesController < ApplicationController
  before_filter :admin_authenticate
  def index
  end
end
