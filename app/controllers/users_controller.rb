class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  before_action :set_user,           only: [:show]

  def index
    @users = User.where.not(id: current_user.id).includes(:lists)
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end 

end
