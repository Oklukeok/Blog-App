class UsersController < ApplicationController
  def index
    @greetings = 'Hello World!'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
