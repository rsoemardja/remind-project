class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
<<<<<<< HEAD

    def show
        set_note
    end

    def new
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
        set_note
    end

    def update
        # set_note
        # if @note.update(note_params)
        #     redirect_to @note
        # else
        #     render :edit
        # end
        set_note
        @note.update(note_params)
        redirect_to notes_path(@note)
    end

    def destroy
        set_note
        @note.destroy
        redirect_to notes_path, status: :see_other
    end

    private

    def set_note
        @note = Note.find(params[:id])
    end
    
    def note_params
        params.require(:note).permit(:title, :description, :categories, :due_date )
    end

    def set_note
        # Finds model per id
        @note = Note.find(params[:id])
      end
=======
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end
>>>>>>> 71fefb4e7454e5e547d43173d55bc7e2879190b8
end
