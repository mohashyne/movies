# class RegistrationsController < ApplicationController

# #    instead of calling the "set_movie_id" in each method
# #    we use the before_action method
#   before_action :require_signin
#   before_action :set_movie_id
#   before_action :set_registration, only: [:edit, :update, :destroy] 

#     def index
#         # @registrations = Registration.all

#         # select reg for a specified movie
#         # @movie = Movie.find(40)
#         # @registrations = @movie.registrations
#     #    set_movie_id
#         @registrations = @movie.registrations
#     end
    
    
#     def new   
#     #    set_movie_id
#        @registration = @movie.registrations.new 
#     end

#     def create
#     #    set_movie_id
#         @registration = @movie.registrations.new(registration_params)
#         @registration.user = current_user

#      if @registration.save
#         redirect_to movie_registrations_url(@movie),
#         notice: "Thanks for registering!"
#      else
#         render :new, status: :unprocessable_entity
#      end

#     end



#     def edit
#         # @registration is already set by before_action
#       end
    
#       def update
#         if @registration.update(registration_params)
#           redirect_to movie_registrations_url(@movie), 
#           notice: "Registration updated successfully!"
#         else
#           render :edit, status: :unprocessable_entity
#         end
#       end
    
#       def destroy
#         @registration.destroy
#         redirect_to movie_registrations_url(@movie), 
#         notice: "Registration deleted successfully!"
#       end



#     private

#     def set_movie_id
#         @movie = Movie.find(params[:movie_id])
#       end

#     def set_registration
#         @registration = @movie.registrations.find(params[:id])
#       end

#     def registration_params
#         registration_params =
#           params
#             .require(:registration)
#             .permit(
#               # :name,
#               # :email,
#               :how_heard
#             )
#       end

# end


class RegistrationsController < ApplicationController
  before_action :require_signin
  before_action :set_movie_id
  before_action :set_registration, only: [:edit, :update, :destroy] 

  def index
    @registrations = @movie.registrations
  end

  def new
    @registration = @movie.registrations.new
  end

  def create
    @registration = @movie.registrations.new(registration_params)
    @registration.user = current_user

    if @registration.save
      redirect_to movie_registrations_url(@movie), notice: "Thanks for registering!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @registration.update(registration_params)
      redirect_to movie_registrations_url(@movie), notice: "Registration updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registration.destroy
    redirect_to movie_registrations_url(@movie), notice: "Registration deleted successfully!"
  end

  private

  def set_movie_id
    @movie = Movie.find_by!(slug: params[:movie_id])
  end

  def set_registration
    @registration = @movie.registrations.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit(:how_heard)
  end
end
