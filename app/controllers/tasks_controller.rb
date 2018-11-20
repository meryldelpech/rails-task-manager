class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params_new)
    @task.save
    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params_edit)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


private

def tasks_params_new
  params.require(:task).permit(:title, :details)
end

def tasks_params_edit
  params.require(:task).permit(:title, :details, :completed)
end

end
