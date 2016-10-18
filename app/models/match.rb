class Match < ApplicationRecord
  serialize :setting_id, Array
  attr_accessor :hours, :minutes, :am_pm
  belongs_to :ladder
  has_many :tickets
end
