class Game < ApplicationRecord
   belongs_to :platform
   has_many :ladders
   has_many :tournaments
   has_many :matches

   has_attached_file :game_img, :styles => { :game_index => "250x350>", :game_show => "325x475>" }, :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :game_img, :content_type => /\Aimage\/.*\Z/
end
