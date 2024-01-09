class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
  
    def index
      # @notes = Note.all
      # @notes = Note.where(title: params[:Pesquisar])
      # # @notes_concluida = true
      # # @notes_by_month = Note.metodo_da_model_que_filtra_por_mes(month)
      if params[:pesquisa].present?
        @notes = Note.search_by_title(params[:pesquisa])
      else
        @notes = Note.all
      end
    end
  
    

    def show
    end
  
    def new
      @note = Note.new
    end
  
    def create
      @note = Note.new(note_params)
      if @note.save
        Note.last&.update(date: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
        redirect_to @note, notice: 'Nota criada com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @note = Note.find(params[:id])
  
      if @note.update(completed: true)
        redirect_to notes_path, notice: 'Nota atualizada com sucesso.'
      else
        redirect_to notes_path, alert: 'Erro ao atualizar a nota.'
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
  