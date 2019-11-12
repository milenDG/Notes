class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def all
    @collections = current_user.collections
  end

  def create
    puts collection_params.inspect
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    respond_to do |format|
      if @collection.save
        @appnotice = 'Collection was succesfully created.'
        format.html {redirect_to collections_all_path}
        format.json {render :show, status: :created, location: @collection }
      else
        @appalert = 'Collection should have a name and a description.'
        format.html { render :new}
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
    puts @collection.inspect
  end

  def delete
  end

  def edit
  end

  def show

  end

  private
    def collection_params
      params.require(:collection).permit(:name, :subtitle, :description)
    end
end
