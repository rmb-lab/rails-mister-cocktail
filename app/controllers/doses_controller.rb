class DosesController < ApplicationController
  before_action :set_cocktail, :set_ingredient, only: [:new, :create, :destroy]
  before_action :set_ingredient, only: [:create]

  def new
    @dose = @cocktail.doses.build
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:dose][:ingredient])
  end

  # STRONG PARAMS#
  def dose_params
    params.require(:dose).permit(:description)
  end

  def ingredient_params
    raise
    params.require(:dose).permit(:name)
  end
end
