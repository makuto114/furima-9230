class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user.create
      render root_path
    else
      render action: :new
  end
end
