class DosesController < ApplicationController
  def index
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
    # why can I still use @dose on line 34 when we destroy it on line 33?
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
