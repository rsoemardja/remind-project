require 'time'

class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @user = current_user
    @notes = Note.all
  
  end

  def show
    if params[:id] == 'trash'
      @trashed_notes = Note.in_trash
      render 'notes/trash_index'
    else
      @note = Note.find(params[:id])
      # Set other necessary instance variables for displaying an individual note
    end
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
