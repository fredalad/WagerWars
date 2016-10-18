class Ticket < ApplicationRecord
  belongs_to :match

  has_attached_file :acpt_team_img1, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :acpt_team_img1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :acpt_team_img2, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :acpt_team_img2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :acpt_team_img3, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :acpt_team_img3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :acpt_team_img4, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :acpt_team_img4, :content_type => /\Aimage\/.*\Z/

  has_attached_file :acpt_team_img5, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :acpt_team_img5, :content_type => /\Aimage\/.*\Z/

  has_attached_file :chlg_team_img1, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :chlg_team_img1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :chlg_team_img2, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :chlg_team_img2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :chlg_team_img3, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :chlg_team_img3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :chlg_team_img4, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :chlg_team_img4, :content_type => /\Aimage\/.*\Z/

  has_attached_file :chlg_team_img5, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :chlg_team_img5, :content_type => /\Aimage\/.*\Z/
end
