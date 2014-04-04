class TagsController < ApplicationController

  def show
    @tag = Tag.where(id: params[:id])
  end

end
