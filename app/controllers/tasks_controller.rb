class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path(@task)
  end

  def edit
    @task
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path(@task), status: :see_other
  end

  private

  def set_task
    # Cette méthode privée me permet de refactoriser en ne répétant pas la même ligne dans plusieurs méthodes
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
