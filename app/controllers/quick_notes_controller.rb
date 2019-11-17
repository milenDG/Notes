class QuickNotesController < ApplicationController
  before_action :set_quick_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /quick_notes
  # GET /quick_notes.json
  def index
    @quick_notes = QuickNote.joins(:user).where(user: current_user)
  end

  # GET /quick_notes/1
  # GET /quick_notes/1.json
  def show
    if @quick_note.user != current_user
      not_found
    end
  end

  # GET /quick_notes/new
  def new
    @quick_note = QuickNote.new
  end

  # GET /quick_notes/1/edit
  def edit
    if @quick_note.user != current_user
      not_found
    end
  end

  # POST /quick_notes
  # POST /quick_notes.json
  def create
    @quick_note = QuickNote.new(quick_note_params)
    @quick_note.user = current_user

    respond_to do |format|
      if @quick_note.save
        format.html { redirect_to @quick_note, notice: 'Quick note was successfully created.' }
        format.json { render :show, status: :created, location: @quick_note }
      else
        format.html { render :new }
        format.json { render json: @quick_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quick_notes/1
  # PATCH/PUT /quick_notes/1.json
  def update
    if @quick_note.user != current_user
      not_found
    end

    respond_to do |format|
      if @quick_note.update(quick_note_params)
        format.html { redirect_to @quick_note, notice: 'Quick note was successfully updated.' }
        format.json { render :show, status: :ok, location: @quick_note }
      else
        format.html { render :edit }
        format.json { render json: @quick_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_notes/1
  # DELETE /quick_notes/1.json
  def destroy
    if @quick_note.user != current_user
      not_found
    end


    @quick_note.destroy
    respond_to do |format|
      format.html { redirect_to quick_notes_url, notice: 'Quick note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick_note
      @quick_note = QuickNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_note_params
      params.require(:quick_note).permit(:title, :subtitle, :content)
    end
end
