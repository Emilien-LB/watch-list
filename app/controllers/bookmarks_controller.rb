class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    # @list = List.find(params[:list_id])---créer le lien avec la list
    @bookmark = Bookmark.new
  end

  def create
    # @list = List.find(params[:list_id]) ---créer le lien avec la list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list #---créer le lien avec la list
    if @bookmark.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
