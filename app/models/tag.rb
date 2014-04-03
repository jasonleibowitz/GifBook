class Tag < ActiveRecord::Base
  serialize :name
  has_and_belongs_to_many :bookmarks
end
