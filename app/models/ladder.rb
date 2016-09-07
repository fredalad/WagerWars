class Ladder < ApplicationRecord
  belongs_to :game
  has_many :teams

end
