class UsersController < ApplicationController

  before_action :set_user

  def index
    @users = User.all
  end

  private
    def set_user
      @user = current_user
    end
end
