require "test_helper"

class Api::V2::MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v2_movie = api_v2_movies(:one)
  end

  test "should get index" do
    get api_v2_movies_url, as: :json
    assert_response :success
  end

  test "should create api_v2_movie" do
    assert_difference("Api::V2::Movie.count") do
      post api_v2_movies_url, params: { api_v2_movie: { actor: @api_v2_movie.actor, description: @api_v2_movie.description, name: @api_v2_movie.name, net_worth: @api_v2_movie.net_worth, price: @api_v2_movie.price, producer: @api_v2_movie.producer, release_year: @api_v2_movie.release_year, starts_at: @api_v2_movie.starts_at } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v2_movie" do
    get api_v2_movie_url(@api_v2_movie), as: :json
    assert_response :success
  end

  test "should update api_v2_movie" do
    patch api_v2_movie_url(@api_v2_movie), params: { api_v2_movie: { actor: @api_v2_movie.actor, description: @api_v2_movie.description, name: @api_v2_movie.name, net_worth: @api_v2_movie.net_worth, price: @api_v2_movie.price, producer: @api_v2_movie.producer, release_year: @api_v2_movie.release_year, starts_at: @api_v2_movie.starts_at } }, as: :json
    assert_response :success
  end

  test "should destroy api_v2_movie" do
    assert_difference("Api::V2::Movie.count", -1) do
      delete api_v2_movie_url(@api_v2_movie), as: :json
    end

    assert_response :no_content
  end
end
