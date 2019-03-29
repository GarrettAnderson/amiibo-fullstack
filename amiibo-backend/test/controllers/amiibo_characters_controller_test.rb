require 'test_helper'

class AmiiboCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amiibo_character = amiibo_characters(:one)
  end

  test "should get index" do
    get amiibo_characters_url, as: :json
    assert_response :success
  end

  test "should create amiibo_character" do
    assert_difference('AmiiboCharacter.count') do
      post amiibo_characters_url, params: { amiibo_character: { image_URL: @amiibo_character.image_URL, name: @amiibo_character.name } }, as: :json
    end

    assert_response 201
  end

  test "should show amiibo_character" do
    get amiibo_character_url(@amiibo_character), as: :json
    assert_response :success
  end

  test "should update amiibo_character" do
    patch amiibo_character_url(@amiibo_character), params: { amiibo_character: { image_URL: @amiibo_character.image_URL, name: @amiibo_character.name } }, as: :json
    assert_response 200
  end

  test "should destroy amiibo_character" do
    assert_difference('AmiiboCharacter.count', -1) do
      delete amiibo_character_url(@amiibo_character), as: :json
    end

    assert_response 204
  end
end
