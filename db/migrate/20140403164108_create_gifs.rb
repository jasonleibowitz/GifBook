class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :gif_url
    end
  end
end
