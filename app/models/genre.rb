class Genre < ActiveRecord::Base
  has_many :books
  validates :genre, presence: true
end