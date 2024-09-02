class Api::V2::MoviesController < ApplicationController
  before_action :set_api_v2_movie, only: %i[ show update destroy ]

  # GET /api/v2/movies
  # GET /api/v2/movies.json
  def index
    @api_v2_movies = Api::V2::Movie.all
  end

  # GET /api/v2/movies/1
  # GET /api/v2/movies/1.json
  def show
  end

  # POST /api/v2/movies
  # POST /api/v2/movies.json
  def create
    @api_v2_movie = Api::V2::Movie.new(api_v2_movie_params)

    if @api_v2_movie.save
      render :show, status: :created, location: @api_v2_movie
    else
      render json: @api_v2_movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/movies/1
  # PATCH/PUT /api/v2/movies/1.json
  def update
    if @api_v2_movie.update(api_v2_movie_params)
      render :show, status: :ok, location: @api_v2_movie
    else
      render json: @api_v2_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/movies/1
  # DELETE /api/v2/movies/1.json
  def destroy
    @api_v2_movie.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v2_movie
      @api_v2_movie = Api::V2::Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v2_movie_params
      params.require(:api_v2_movie).permit(:name, :actor, :producer, :description, :net_worth, :starts_at, :price, :release_year)
    end
end
