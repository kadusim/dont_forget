class ListsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_list,  only: %i[edit update destroy show]
  before_action :is_owner?, only: %i[edit update destroy]
  before_action :list_open, only: %i[index create edit show]

  def index
  end

  def show
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to edit_list_path(@list), notice: 'List was successfully created.'
    else
      redirect_to lists_path, notice: 'Could not created List.'
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = 'List was successfully saved.'
      if @list.status == "list_done"
        redirect_to root_path
      else
        redirect_to list_path(@list)
      end
    else
      redirect_to lists_path, notice: 'Could not saved List.'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def is_owner?
    unless current_user == @list.user
      redirect_to main_app.root_url, notice: 'Sorry. Action not allowed.'
    end
  end

  def set_list
    @list = List.includes(:tasks).find(params[:id])
  end

  def list_open
    @lists           = current_user.lists.lists_pend
    @lists_following = current_user.following
  end

  def list_params
    params.require(:list).permit(:name,
                                 :type_access,
                                 :status,
                                 tasks_attributes: [:id,
                                                    :description,
                                                    :status,
                                                    :_destroy,
                                 subtasks_attributes: [:id,
                                                       :description,
                                                       :status,
                                                       :task_id,
                                                       :_destroy]]).merge(user: current_user)
  end

end
