class TeamsUser < ApplicationRecord
  belongs_to :users
  belongs_to :teams
end
