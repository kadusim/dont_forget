class ListsController < ApplicationController
  before_action :authenticate_user!

  before_action :list_params_create, only: [:create]
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:show, :update, :destroy]

  def show
    @lists = current_user.list
  end

  def index
    @lists = current_user.list
  end

  def create
    @lists = current_user.list
    @list = List.new(name: list_params_create[:name], type_access: :private_me, status: :open, user: current_user)
    respond_to do |format|
      if @list.save
        format.json { render json: @list }
        format.html { redirect_to edit_list_path(@list) }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.html
      end
    end
  end

  def edit
    @lists = current_user.list
  end

  def update
    respond_to do |format|
      if @list.update(list_params_update)
        format.json { render json: true }
        format.html { redirect_to edit_list_path(@list) }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.html
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.json { render json: true }
      format.html { redirect_to lists_path }
    end
  end

  private

  def is_owner?
    unless current_user == @list.user
      respond_to do |format|
        format.json { render json: false, status: :forbidden }
        format.html { redirect_to main_app.root_url }
      end
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params_update
    params.require(:list).permit(:name, :type_access, :status).merge(user: current_user)
  end

  def list_params_create
    params.require(:list).permit(:name)
  end
end
