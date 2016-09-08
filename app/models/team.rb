class Team < ApplicationRecord
  serialize :user_id, Array

  belongs_to :ladder
end
