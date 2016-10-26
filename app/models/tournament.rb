class Tournament < ApplicationRecord
  belongs_to :game
  attr_accessor :team_id, :am_pm, :date, :minutes, :hours

end
