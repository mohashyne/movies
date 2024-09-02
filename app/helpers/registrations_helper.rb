module RegistrationsHelper
   

    def register_or_sold_out(movie)
        if movie.sold_out?
            "Sold Out"
        else
        link_to 'Register', new_movie_registration_path(@movie), class: "btn reg-btn"   
        end
    end
end
