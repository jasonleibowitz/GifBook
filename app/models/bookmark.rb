class Bookmark < ActiveRecord::Base

  validates :title, :gif_id, presence: true
  belongs_to :gif
  belongs_to :user
  has_and_belongs_to_many :tags

  @@tag_filter = ["the", "a"]

end
