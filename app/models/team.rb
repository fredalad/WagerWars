class Team < ApplicationRecord
  serialize :user_id, Array
  serialize :username, Array


  belongs_to :ladder
end
