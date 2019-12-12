class QuickNotesController < ApplicationController
  # Set the Quick Note before the specific actions
  before_action :set_quick_note, only: [:show, :edit, :update, :destroy]

  # Authenticate the user before each action
  before_action :authenticate_user!

  # GET /quick_notes
  # GET /quick_notes.json
  def index
    # Get all Quick Notes of the current user
    @quick_notes = current_user.quick_notes
  end

  # GET /quick_notes/1
  # GET /quick_notes/1.json
  def show
    # If the current user does not have access to that Quick note -> show not found
    if @quick_note.user != current_user
      not_found
    end
  end

  # GET /quick_notes/new
  def new
    # Create a new Quick note to fill the forms with
    @quick_note = QuickNote.new
  end

  # GET /quick_notes/1/edit
  def edit
    # If the current user does not have access to that Quick note -> show not found
    if @quick_note.user != current_user
      not_found
    end
  end

  # POST /quick_notes
  # POST /quick_notes.json
  def create
    # Create a new Quick note with the parameters from the post http request
    @quick_note = QuickNote.new(quick_note_params)

    # Specify the user for the Quick note to be the current user
    @quick_note.user = current_user

    respond_to do |format|
      # Try saving the Quick note
      if @quick_note.save
        # If the saving was successful -> show the new Quick note
        format.html { redirect_to @quick_note, notice: I18n.t('controllers.quicknotes.create') }
        format.json { render :show, status: :created, location: @quick_note }
      else
        # If unsuccessful -> show the errors
        format.html { render :new }
        format.json { render json: @quick_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quick_notes/1
  # PATCH/PUT /quick_notes/1.json
  def update
    # If the current user does not have access to that Quick note -> show not found
    if @quick_note.user != current_user
      not_found
    end

    respond_to do |format|
      # Try updating the Quick note with the parameters from the post http request
      if @quick_note.update(quick_note_params)
        format.html { redirect_to @quick_note, notice: I18n.t('controllers.quicknotes.update') }
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
    # If the current user does not have access to that Quick note -> show not found
    if @quick_note.user != current_user
      not_found
    end

    # Destroy the notebook and redirect to all Quick notes
    @quick_note.destroy
    respond_to do |format|
      format.html { redirect_to quick_notes_url, notice: I18n.t('controllers.quicknotes.destroy') }
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
