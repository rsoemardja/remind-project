require 'timers'

class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @user = current_user
    @notes = Note.all
    # timers = Timers::Group.new
    # timers.every(60.minutes) do
    #   # Check if 24 hours have elapsed
    #   if Time.now >= @note.created_at + 24.hours
    #     # Perform the action you want to execute after 24 hours
    #     # ...
    #     timers.stop
    #   end
    # end
    # timers.start
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
    timers = Timers::Group.new
    timers.every(60.minutes) do
      # Check if 24 hours have elapsed
      if Time.now >= @note.created_at + 24.hours
        # Perform the action you want to execute after 24 hours
        # ...
        timers.stop
      end
    end
    timers.start
  end

  def edit
  end

  def update
    set_note
    @note.update(note_params)
    redirect_to notes_path(@note)
  end

  def destroy
    @note.destroy
    redirect_to notes_path, status: :see_other
  end

  def trash
    note = Note.find(params[:id])
    note.update(in_trash: true)
    redirect_to notes_path, notice: 'Note moved to trash.'
  end

  def restore
    note = Note.find(params[:id])
    note.update(in_trash: false)
    redirect_to notes_path, notice: 'Note restored from trash.'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :category, :due_date, photos: [])
  end
end
