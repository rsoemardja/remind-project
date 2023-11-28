class TasksController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  def index
    @task = Note.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
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
    params.require(:task).permit(:title, :description, :categories, :due_date, :completed)
  end
end
