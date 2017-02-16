class Match < ApplicationRecord

  serialize :setting_id, Array
  serialize :acpt_player_names, Array
  serialize :chlg_player_names, Array

  attr_accessor :hours, :minutes, :am_pm
  belongs_to :game
  has_many :tickets
end
