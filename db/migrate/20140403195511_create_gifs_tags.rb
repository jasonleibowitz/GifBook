class CreateGifsTags < ActiveRecord::Migration
  def change
    create_join_table :gifs, :tags
  end
end
