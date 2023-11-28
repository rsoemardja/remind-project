class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_task
  end

  def update
    # if @task.update(task_params)
    #   redirect_to @task
    # else
    #   render :edit
    # end
    set_task
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :category, :due_date, :completed)
  end
end
