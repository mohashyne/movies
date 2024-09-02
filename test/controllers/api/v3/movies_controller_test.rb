require "test_helper"

class Api::V3::MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v3_movie = api_v3_movies(:one)
  end

  test "should get index" do
    get api_v3_movies_url, as: :json
    assert_response :success
  end

  test "should create api_v3_movie" do
    assert_difference("Api::V3::Movie.count") do
      post api_v3_movies_url, params: { api_v3_movie: { actor: @api_v3_movie.actor, description: @api_v3_movie.description, name: @api_v3_movie.name, net_worth: @api_v3_movie.net_worth, price: @api_v3_movie.price, producer: @api_v3_movie.producer, release_year: @api_v3_movie.release_year, starts_at: @api_v3_movie.starts_at } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v3_movie" do
    get api_v3_movie_url(@api_v3_movie), as: :json
    assert_response :success
  end

  test "should update api_v3_movie" do
    patch api_v3_movie_url(@api_v3_movie), params: { api_v3_movie: { actor: @api_v3_movie.actor, description: @api_v3_movie.description, name: @api_v3_movie.name, net_worth: @api_v3_movie.net_worth, price: @api_v3_movie.price, producer: @api_v3_movie.producer, release_year: @api_v3_movie.release_year, starts_at: @api_v3_movie.starts_at } }, as: :json
    assert_response :success
  end

  test "should destroy api_v3_movie" do
    assert_difference("Api::V3::Movie.count", -1) do
      delete api_v3_movie_url(@api_v3_movie), as: :json
    end

    assert_response :no_content
  end
end
