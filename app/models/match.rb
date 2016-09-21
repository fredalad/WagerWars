class Match < ApplicationRecord
  attr_accessor :hours, :minutes, :am_pm
  belongs_to :ladder
end
