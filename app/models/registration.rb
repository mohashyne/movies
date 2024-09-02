class Registration < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ }

  HOW_HEARD_OPTIONS = [
    'Newsletter',
    'google',
    'mouth of the world',
    'twitter',
    'Blog Post',
    'Web search',
    'Friend/Coworker',
    'Other'
]

  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }

end
