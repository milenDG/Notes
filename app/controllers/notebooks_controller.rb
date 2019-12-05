class NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /notebooks
  # GET /notebooks.json
  def index
    @notebooks = current_user.notebooks
  end

  # GET /notebooks/1
  # GET /notebooks/1.json
  def show
    if @notebook.user != current_user
      not_found
    end
  end

  # GET /notebooks/new
  def new
    @notebook = Notebook.new
  end

  # GET /notebooks/1/edit
  def edit
    if @notebook.user != current_user
      not_found
    end
  end

  # POST /notebooks
  # POST /notebooks.json
  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user = current_user

    respond_to do |format|
      if @notebook.save
        format.html { redirect_to @notebook, notice: I18n.t('controllers.notebooks.create') }
        format.json { render :show, status: :created, location: @notebook }
      else
        format.html { render :new }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebooks/1
  # PATCH/PUT /notebooks/1.json
  def update
    if @notebook.user != current_user
      not_found
    end

    respond_to do |format|
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
    if @notebook.user != current_user
      not_found
    end

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
