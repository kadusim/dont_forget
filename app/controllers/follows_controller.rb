class FollowsController < ApplicationController
  before_action :set_follow, only: [:destroy]

  def index
    @lists_follow = List.where.not(user_id: current_user.id).where(type_access: :list_shared)
  end

  def create
    @follow = Follow.new(list_id: params[:list_id], user_id: current_user.id)
    if @follow.save
      redirect_to users_url, notice: 'Follow was successfully created.'
    else
      redirect_to users_url, alert: 'Sorry. You are already following this list.'
    end
  end

  def destroy
    @follow.destroy(@follow.ids)
    redirect_to root_path, notice: 'Follow was successfully destroyed.'
  end

  private

  def set_follow
    @follow = Follow.where(user_id: params[:user_id], list_id: params[:list_id])
  end

end
