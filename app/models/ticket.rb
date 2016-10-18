class Ticket < ApplicationRecord
  belongs_to :match

  has_attached_file :proof_img1, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :proof_img1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :proof_img2, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :proof_img2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :proof_img3, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :proof_img3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :proof_img4, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :proof_img4, :content_type => /\Aimage\/.*\Z/

  has_attached_file :proof_img5, :styles => { :ticket_index => "250x350>", :ticket_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :proof_img5, :content_type => /\Aimage\/.*\Z/
end
