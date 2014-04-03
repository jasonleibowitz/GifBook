class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references  :user,
                    :gif
      t.timestamps
      t.string :title
      t.text :description
    end
  end
end
