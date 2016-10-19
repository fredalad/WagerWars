class Ladder < ApplicationRecord
  belongs_to :game
  has_many :teams
  has_many :matches
  has_many :settings

end
