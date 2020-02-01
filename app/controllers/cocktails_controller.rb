class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  # CREATE
  ## GET the form
  def new
    @cocktail = Cocktail.new
  end

  ## POST the form
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # STRONG PARAMS
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
