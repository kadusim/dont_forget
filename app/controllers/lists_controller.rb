class ListsController < ApplicationController
  before_action :authenticate_user!

  before_action :list_params_create, only: [:create]
  before_action :set_list, only: [:edit, :update, :destroy]
  before_action :is_owner?, only: [:update, :destroy]
  before_action :list_open, only: [:index, :create, :edit]

  def index
  end

  def create
    @list = List.new(name: list_params_create[:name], type_access: :list_private, status: :list_pend, user: current_user)
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
    # todos = current_user.list[0].task
    # puts "TODOS #{todos.inspect}"
    # first_father = current_user.list[0].task.where(father_id: 0)

    # def list_child father, retorno
    #   puts "FATHER ID: #{father.id} size #{father.child.size}"
    #   if father.child.size > 0
    #     father.child.each { |child_child|
    #       puts "Adicionou child: #{child_child.id}"
    #       retorno << child_child.child
    #       list_child child_child, retorno
    #     }
    #   else
    #     puts "Adicionou pai: #{father.id}"
    #     retorno << father
    #   end
    # end
    # retorno = []
    # first_father.each { |father|
    #   retorno << father
    #   list_child father, retorno
    # }
    # puts "retorno: #{retorno}"

    @lists = current_user.lists.lists_pend

  end

  def list_params_update
    params.require(:list).permit(:name, :type_access, :status, tasks_attributes: [:id, :description, :status, :father_id, :_destroy]).merge(user: current_user)
  end

  def list_params_create
    params.require(:list).permit(:name)
  end
end
