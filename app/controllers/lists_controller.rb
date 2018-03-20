class ListsController < ApplicationController
  before_action :authenticate_user!

  before_action :list_params_create, only:   [:create]
  before_action :set_list,           only: %i[edit update destroy show]
  before_action :is_owner?,          only: %i[edit update destroy]
  before_action :list_open,          only: %i[index create edit show]

  def index
  end

  def create
    @list = List.new(list_params_create)
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
  end

  def update
    respond_to do |format|
      if @list.update(list_params_update)
        flash[:success] = 'List was successfully saved.'
        if @list.status == "list_done"
          format.html { redirect_to root_path }
        else
          format.html { redirect_to edit_list_path(@list) }
        end
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

  def list_open
    @lists           = current_user.lists.lists_pend
    @lists_following = current_user.following
  end

  def list_params_update
    params.require(:list).permit(:name,
                                 :type_access,
                                 :status,
                                 tasks_attributes: [:id,
                                                    :description,
                                                    :status,
                                                    :father_id,
                                                    :_destroy]).merge(user: current_user)
  end

  def list_params_create
    params.require(:list).permit(:name).merge(user: current_user)
  end
end
