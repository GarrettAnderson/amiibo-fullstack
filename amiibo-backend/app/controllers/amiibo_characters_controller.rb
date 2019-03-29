class AmiiboCharactersController < ApplicationController
  before_action :set_amiibo_character, only: [:show, :update, :destroy]

  # GET /amiibo_characters
  def index
    @amiibo_characters = AmiiboCharacter.all

    render json: @amiibo_characters
  end

  # GET /amiibo_characters/1
  def show
    render json: @amiibo_character
  end

  # POST /amiibo_characters
  def create
    @amiibo_character = AmiiboCharacter.new(amiibo_character_params)

    if @amiibo_character.save
      render json: @amiibo_character, status: :created, location: @amiibo_character
    else
      render json: @amiibo_character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /amiibo_characters/1
  def update
    if @amiibo_character.update(amiibo_character_params)
      render json: @amiibo_character
    else
      render json: @amiibo_character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /amiibo_characters/1
  def destroy
    @amiibo_character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amiibo_character
      @amiibo_character = AmiiboCharacter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amiibo_character_params
      params.require(:amiibo_character).permit(:name, :image_URL)
    end
end
