class FavoritesController < ApplicationController

  def index
    @lists_follow = List.where.not(user_id: current_user.id).lists_shared
  end

  # def create
  #   @follow = Follow.new(list_id: params[:list_id], user_id: current_user.id)
  #   if @follow.save
  #     redirect_to users_url, notice: 'Follow was successfully created.'
  #   else
  #     redirect_to users_url, alert: 'Sorry. You are already following this list.'
  #   end
  # end
  #
  # def destroy
  #   @follow = Follow.where(user_id: params[:user_id], list_id: params[:list_id])
  #   @follow.destroy(@follow.ids)
  #   redirect_to root_path, notice: 'Follow was successfully destroyed.'
  # end
end
