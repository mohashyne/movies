class Api::V3::MoviesController < ApplicationController
  before_action :set_api_v3_movie, only: %i[ show update destroy ]

  # GET /api/v3/movies
  # GET /api/v3/movies.json
  def index
    @api_v3_movies = Api::V3::Movie.all
  end

  # GET /api/v3/movies/1
  # GET /api/v3/movies/1.json
  def show
  end

  # POST /api/v3/movies
  # POST /api/v3/movies.json
  def create
    @api_v3_movie = Api::V3::Movie.new(api_v3_movie_params)

    if @api_v3_movie.save
      render :show, status: :created, location: @api_v3_movie
    else
      render json: @api_v3_movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v3/movies/1
  # PATCH/PUT /api/v3/movies/1.json
  def update
    if @api_v3_movie.update(api_v3_movie_params)
      render :show, status: :ok, location: @api_v3_movie
    else
      render json: @api_v3_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v3/movies/1
  # DELETE /api/v3/movies/1.json
  def destroy
    @api_v3_movie.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v3_movie
      @api_v3_movie = Api::V3::Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v3_movie_params
      params.require(:api_v3_movie).permit(:name, :actor, :producer, :description, :net_worth, :starts_at, :price, :release_year)
    end
end
