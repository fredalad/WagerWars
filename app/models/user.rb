class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages

  serialize :team_id, Array

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username, :case_sensitive => false
  validates_uniqueness_of :xbox_gt, :ps4_gt, :lol_summoner_name, allow_blank: true, :case_sensitive => false

  has_attached_file :user_icon, :styles => { :user_index => "250x350>", :user_show => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_icon, :content_type => /\Aimage\/.*\Z/

  def self.search(username)
    if username != ''
      where('LOWER(username) LIKE ?', "%#{username}%")
    end
  end

end
