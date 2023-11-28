class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    def index
        @notes = Note.all
    end

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
end
