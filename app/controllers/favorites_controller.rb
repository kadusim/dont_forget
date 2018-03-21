class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists_follow = List.where.not(user_id: current_user.id).lists_shared
  end

  def create
    list = List.find(params[:list_followed_id])
    current_user.follow(list)
    redirect_to list_path(list)
  end

  def destroy
    list = Favorite.find(params[:id]).list_followed
    current_user.unfollow(list)
    redirect_to list_path(list)
  end

end
