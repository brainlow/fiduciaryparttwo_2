require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_mail_address

  def geocode_mail_address
    if self.mail_address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.mail_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.mail_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.mail_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.mail_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :profile_pic, ProfilePicUploader

  # Direct associations

  has_many   :employees,
             :class_name => "Occupation",
             :dependent => :destroy

  has_many   :assignments,
             :dependent => :destroy

  # Indirect associations

  has_many   :matters,
             :through => :assignments,
             :source => :matter

  has_many   :organizations,
             :through => :employees,
             :source => :organization

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
