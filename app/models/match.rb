class Match < ApplicationRecord
  serialize :setting_id, Array
  attr_accessor :hours, :minutes, :am_pm
  belongs_to :game
  has_many :tickets
end
