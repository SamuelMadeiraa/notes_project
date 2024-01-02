class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
  
    def index
      @notes = Note.all
      # @notes_by_month = Note.metodo_da_model_que_filtra_por_mes(month)
      march_notes = Note.march_notes

    end
  
    def show
    end
  
    def new
      @note = Note.new
    end
  
    def create
      @note = Note.new(note_params)
      if @note.save
        redirect_to @note, notice: 'Nota criada com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @note.update(note_params)
        redirect_to @note, notice: 'Nota atualizada com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @note.destroy
      redirect_to notes_url, notice: 'Nota excluída com sucesso.'
    end
  
    private
  
    def set_note
      @note = Note.find(params[:id])
    end
  
    def note_params
      params.require(:note).permit(:title, :content)
    end
  end
  