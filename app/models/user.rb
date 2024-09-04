class User < ApplicationRecord
  has_many  :registrations, dependent: :destroy # dependent: :destroy will destroy all registrations related to user once user is delete

  has_secure_password


  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ },
                      uniqueness: { case_sensitive: false}

end
