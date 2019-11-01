class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :update, :destroy]

  def index
    @apartments = Apartment.filter(params.slice(:zip_code, :apartment_size, :rent, :apartment_type, :apartment_id))
    render json:  @apartments
  end

  def show
    render json: @apartment
  end

  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      render json: @apartment, status: :created, location: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @apartment.update(apartment_params)
      render json: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def apartment_params
      params.require(:apartment).permit(:zip_code, :apartment_type, :apartment_size, :rent)
    end
end
