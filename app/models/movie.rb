class Movie < ApplicationRecord
has_many :registrations, dependent: :destroy # dependent destroy will delete the registration attached to the movie to watch, when we call th destroy on the parent

 validates :name, :actor, presence: true
 
 validates :description, length: {minimum:25, maximum:100}

 validates :price, numericality: { greater_than_or_equal_to: 0}

 validates :capacity, numericality: 
             { only_integer: true, greater_than_or_equal_to: 1}

 validates :image_file_name, format: { 
           with:  /\w+\.(jpg|png|webp)\z/i,
           message: "must be a JPG, WEBP OR PNG image"
         }             
#  this will define the method in the movie class
  def self.upcoming
    # we don't need to call the Movie.where("starts_at > ?", Time.now).order("starts_at")
    # because of the self we used itt will call it automatically
    where("starts_at > ?", Time.now).order("starts_at")
  end

  def free?
    price.blank? || price.zero?
  end

#  method if capacity equals zero , "Sold out"
 def sold_out?
        (capacity - registrations.size).zero?
      end
end