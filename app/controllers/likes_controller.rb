# class LikesController < ApplicationController

#     before_action :require_signin   

#         # def create
#     #     @movie = Movie.find(params[:movie_id])  
#     #     @movie.likes.create!(user: current_user)

#     #     redirect_to @movie, notice: "Thanks for liking!"
#     # end

#     def create
#         @movie = Movie.find(params[:movie_id])  
#         @movie.likes.create!(user: current_user)
#         redirect_to @movie, notice: "Thanks for liking!"
#     end

#     def destroy
#         @movie = Movie.find(params[:movie_id])
#         like = @movie.likes.find_by(user: current_user)
    
#         if like
#           like.destroy
#           message = "You have unliked the movie."
#         else
#           message = "You haven't liked this movie yet."
#         end
    
#         redirect_to @movie, notice: message
#       end

# end


class LikesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find_by!(slug: params[:movie_id])
    @movie.likes.create!(user: current_user)
    redirect_to @movie, notice: "Thanks for liking!"
  end

  def destroy
    @movie = Movie.find_by!(slug: params[:movie_id])
    like = @movie.likes.find_by(user: current_user)

    if like
      like.destroy
      message = "You have unliked the movie."
    else
      message = "You haven't liked this movie yet."
    end

    redirect_to @movie, notice: message
  end
end
