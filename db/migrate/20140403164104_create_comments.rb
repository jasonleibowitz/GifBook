class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references  :bookmark,
                    :user
      t.timestamps
      t.text :content
    end
  end
end
