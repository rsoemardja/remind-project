require 'timers'

class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
<<<<<<< HEAD
=======

>>>>>>> 9880f6aaee7b98bdfac63363f213b31bd8680c12
  def index
    @user = current_user
    @notes = Note.all
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

  def show
  end

  def new
    @user = current_user
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to notes_path(@note)
    else
      render :new, status: :unprocessable_entity
    end
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

  def edit
  end

  def update
<<<<<<< HEAD
    # set_note
    # if @note.update(note_params)
    #   redirect_to notes_path(@note)
    # else
    #   render :edit
    #     redirect_to @note
    # else
    #     render :edit
    # end
    set_note
=======
>>>>>>> 9880f6aaee7b98bdfac63363f213b31bd8680c12
    @note.update(note_params)
    redirect_to notes_path(@note)
  end

  def destroy
    @note.destroy
    redirect_to notes_path, status: :see_other
  end

  private

  def set_note
    # Finds model per id
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :category, :due_date, photos: [])
  end
end
