class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @tasks = Task.all
  end

  def show
  end

  def new
    @user = current_user
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
  end

  def update
    # if @task.update(task_params)
    #   redirect_to @task
    # else
    #   render :edit
    # end
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :category, :due_date, :completed, photos: [])
  end
end
