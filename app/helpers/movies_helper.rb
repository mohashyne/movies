module MoviesHelper
  def price(movie)
    # movie.price == 0 ? "free" : "Ticket Price : #{number_to_currency(movie.price, precision: 0)}"
    if movie.free?
      'free'
    else
      "Ticket Price : #{number_to_currency(movie.price, precision: 0)}"
    end
  end

#   def day_and_time(movie)
#    movie.starts_at.strftime("%B %d at %I:%M %P")
#   end

end
