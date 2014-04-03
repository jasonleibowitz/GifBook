class Bookmark < ActiveRecord::Base
  belongs_to :gif
  belongs_to :user
  has_and_belongs_to_many :tags

end
