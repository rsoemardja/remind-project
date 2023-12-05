require 'timers'

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @user = current_user
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @deadline = @task.due_date.strftime('%Y-%m-%dT%H:%M:%SZ')
  end

  def new
    @user = current_user
    @task = Task.new
    timers = Timers::Group.new
    timers.every(60.minutes) do
      # Check if 24 hours have elapsed
      if Time.now >= created_at + 24.hours
        # Perform the action you want to execute after 24 hours
        # ...
        timers.stop
      end
      timers.start
    end
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
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
    # @task.update!(task_params)
    # redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def deadline
    @tasks = Task.all
    @tasks.each do |task|
      if task.due_date < Time.now
        task.completed = true
      end
    end
  end

  def initialize_timer(element, deadline)
    timer_id = element.dataset[:timer_id]
    initialize_timer(element, timer_id, deadline)
  end

  def trash
    task = Task.find(params[:id])
    task.update(in_trash: true)
    redirect_to tasks_path, notice: 'Task moved to trash.'
  end

  def restore
    task = Task.find(params[:id])
    task.update(in_trash: false)
    redirect_to tasks_path, notice: 'Task restored.'
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :category, :due_date, :completed, photos: [])
  end
end
