class Bookmark < ActiveRecord::Base

  validates :title, :gif_id, presence: true
  belongs_to :gif
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments


end
