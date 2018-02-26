class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def destroy
  end

  def update
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :status, :list_id, :father_id)
  end

  def is_owner?
    unless current_user == @task.list.user
      respond_to do |format|
        flash[:error] = 'Sorry. Action not allowed.'
        format.html { redirect_to main_app.root_url }
      end
    end
  end
end
