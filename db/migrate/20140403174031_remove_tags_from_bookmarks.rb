class RemoveTagsFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :tags
  end
end
