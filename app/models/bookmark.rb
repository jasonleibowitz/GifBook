class Bookmark < ActiveRecord::Base
  validates :title, :gif_id, presence: true

end
