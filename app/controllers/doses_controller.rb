class DosesController < ApplicationController
  before_action :set_cocktail, :set_ingredient, only: [:new, :create]
  before_action :set_ingredient, only: [:create]

  def new
    @dose = @cocktail.doses.build
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
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
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
