class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :teams

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :user_icon, :styles => { :user_index => "250x350>", :user_show => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_icon, :content_type => /\Aimage\/.*\Z/


end