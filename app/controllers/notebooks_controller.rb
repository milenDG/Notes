class NotebooksController < ApplicationController
  # Set the notebook before the specific actions
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]

  # Authenticate user, before every action
  before_action :authenticate_user!

  # GET /notebooks
  # GET /notebooks.json
  def index
    # The notebooks of the current user
    @notebooks = current_user.notebooks
  end

  # GET /notebooks/1
  # GET /notebooks/1.json
  def show
    # If the current user does not have access to that notebook -> show not found
    if @notebook.user != current_user
      not_found
    end
  end

  # GET /notebooks/new
  def new
    # Create a new notebook to fill the forms
    @notebook = Notebook.new
  end

  # GET /notebooks/1/edit
  def edit
    # If the current user does not have access to that notebook -> show not found
    if @notebook.user != current_user
      not_found
    end
  end

  # POST /notebooks
  # POST /notebooks.json
  def create
    # Create the notebook with the parameters from the post request
    @notebook = Notebook.new(notebook_params)

    # Specify the current user as the user for the notebook
    @notebook.user = current_user

    # Try saving the notebook
    respond_to do |format|
      if @notebook.save
        # Display the notebook
        format.html { redirect_to @notebook, notice: I18n.t('controllers.notebooks.create') }
        format.json { render :show, status: :created, location: @notebook }
      else
        # Show the error
        format.html { render :new }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebooks/1
  # PATCH/PUT /notebooks/1.json
  def update
    # If the current user does not have access to that notebook -> show not found
    if @notebook.user != current_user
      not_found
    end

    respond_to do |format|
      # Try updating the notebook
      if @notebook.update(notebook_params)
        format.html { redirect_to @notebook, notice: I18n.t('controllers.notebooks.update') }
        format.json { render :show, status: :ok, location: @notebook }
      else
        format.html { render :edit }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.json
  def destroy
    # If the current user does not have access to that notebook -> show not found
    if @notebook.user != current_user
      not_found
    end

    # Destroy the notebook (its notes are destroyed, too)
    @notebook.destroy
    respond_to do |format|
      format.html { redirect_to notebooks_url, notice: I18n.t('controllers.notebooks.destroy') }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notebook_params
      params.require(:notebook).permit(:title, :subtitle, :description)
    end
end
