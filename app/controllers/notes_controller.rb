class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @user = current_user
    @notes = Note.all
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
  end

  def edit
  end

  def update
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
