class MoviesController < ApplicationController
  def index
    # all movies
    # @movies = Movie.all

    # upcomming movies , but its a bad practice to define it here
    # rather we defin the upcoming in the movie class
    # @movies = Movie.where("starts_at > ?", Time.now).order("starts_at")
    @movies = Movie.upcoming
  end

  def show
    #fail # this a old way debugging trick
    # @movie = Movie.find(1)
    find_movie
  end

  def edit
    find_movie
  end

  def update
    #  we need the movies id again , because instance variable
    # donot live on after the action runs, thats why we called it here
    # again despite calling it on edit.
    find_movie
    if @movie.update(permitted_values)
    #  flash[:notice] = "Event sucessfully updated!"  

    #   redirect_to movie_path(@movie)
    redirect_to @movie, notice: "Event sucessfully updated!"  
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(permitted_values)
    if @movie.save
        # flash[:notice] = "Event sucessfully updated!"
    redirect_to @movie, notice: "Event sucessfully updated!"  
    else
        # This re-displays the new movie form with an HTTP status of 422 Unprocessable Entity 
        # if the movie fails to save, allowing the user to correct errors.
        render :new, status: :unprocessable_entity
    end
  end

  def destroy
    find_movie
    @movie.destroy
    redirect_to movies_url, status: :see_other, #turbolinks: false
      alert: "Movie was successfully destroyed."
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def permitted_values
    movie_params =
      params
        .require(:movie)
        .permit(
          :name,
          :actor,
          :producer,
          :description,
          :net_worth,
          :starts_at,
          :price,
          :release_year,
          :capacity,
          :image_file_name
        )
  end


end
