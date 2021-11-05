class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [ :show, :edit, :update, :destroy ]

  def index
    @notes = Note.where(user_id: current_user).filter_by_content(params[:search])
  end

  def show; end

  def new
    @note = current_user.notes.build
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Nota criada com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: "Nota atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Nota deletada com sucesso." }
    end
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content, :priority)
    end
end
