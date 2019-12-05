class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /notes
  # GET /notes.json
  def index
    @notebooks = current_user.notebooks
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    if @note.notebook.user != current_user
      not_found
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
    @notebooks = Notebook.joins(:user).where(user: current_user)
  end

  # GET /notes/1/edit
  def edit
    if @note.notebook.user != current_user
      not_found
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: I18n.t('controllers.notes.create') }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    if @note.user != current_user
      not_found
    end

    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: I18n.t('controllers.notes.update') }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    if @note.notebook.user != current_user
      not_found
    end

    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: I18n.t('controllers.notes.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:title, :notebook_id, :subtitle, :content)
  end
end
