class Ladder < ApplicationRecord
  belongs_to :games
  has_many :teams

end
