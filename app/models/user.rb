class User < ApplicationRecord
  
  has_many  :registrations, dependent: :destroy # dependent: :destroy will destroy all registrations related to user once user is delete, source has to be singular, but if you are using the default, you can use plural
  has_many :likes
  has_many :liked_movies, through: :likes, source: :movie


  has_secure_password


  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ },
                      uniqueness: { case_sensitive: false}

end
