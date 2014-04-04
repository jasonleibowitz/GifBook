class BookmarksController < ApplicationController

  @@tag_filter = ["the", "a"]

  def index
    # news feed / homepage
    @bookmarks = Bookmark.all
    # add bookmark search form in index file
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def results
    @search_terms = params[:search_terms]
    @giphy_urls_ary = GetGiphy.search_giphy(@search_terms)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(new_bookmark_params)
    @gif = Gif.create(gif_url: params[:gif_url])
    @bookmark.gif_id = @gif.id
    @tag = params[:tag].split
    @@tag_filter.each do |filter_word|
      @tag.delete(filter_word)
    end
    @tag.each do |tag|
      if Tag.find_by(name: tag.downcase) == nil
        @bookmark.tags << Tag.create(name: tag.downcase)
      else
        @bookmark.tags << Tag.find_by(name: tag.downcase)
      end
    end
    if @bookmark.valid?
      @bookmark.save
      redirect_to user_path(current_user)
    else
      flash[:notice] = "#{@bookmark.errors}"
      render 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(update_bookmark_params)
      @tag = params[:bookmark][:tags]
      @@tag_filter.each do |filter_word|
      @tag.delete(filter_word)
    end
      @tag.each do |tag|
        if Tag.find_by(name: tag.downcase) == nil
          @bookmark.tags << Tag.create(name: tag.downcase)
        elsif
          !@bookmark.tags.include? Tag.find_by(name: tag.downcase)
          @bookmark.tags << Tag.find_by(name: tag.downcase)
        end
    end
      redirect_to @bookmark
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private
    def new_bookmark_params
      return params.permit(:user_id, :title, :description)
    end

    def update_bookmark_params
      return params.require(:bookmark).permit(:title, :description)
    end

end
