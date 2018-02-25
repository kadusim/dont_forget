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
        flash[:success] = 'List was successfully created.'
        format.html { redirect_to edit_list_path(@list) }
      else
        flash[:error] = 'Could not created List.'
        format.html { redirect_to lists_path }
      end
    end
  end

  def edit
    @lists = current_user.list
  end

  def update
    respond_to do |format|
      if @list.update(list_params_update)
        flash[:success] = 'List was successfully saved.'
        format.html { redirect_to edit_list_path(@list) }
      else
        flash[:error] = 'Could not saved List.'
        format.html { redirect_to lists_path }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      flash[:success] = 'List was successfully deleted.'
      format.html { redirect_to lists_path }
    end
  end

  private

  def is_owner?
    unless current_user == @list.user
      respond_to do |format|
        flash[:error] = 'Sorry. Action not allowed.'
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
