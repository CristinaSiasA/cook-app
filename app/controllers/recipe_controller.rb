class RecipeController < ApplicationController
  def index
    @recipes = Recipe.preload(:user, :category)
    puts(@recipes.inspect)
  end

  def lunch
    @recipes = Recipe.where(category_id: Integer(2)).preload(:user, :category)
    puts(@recipes.inspect)
  end

  def dinner
    @recipes = Recipe.where(category_id: Integer(1)).preload(:user, :category)
    puts(@recipes.inspect)
  end

  def breakfast
    @recipes = Recipe.where(category_id: Integer(3)).preload(:user, :category)
    puts(@recipes.inspect)
  end

  def show
    @id = params[:id]
    @recipe = Recipe.where(id: Integer(params[:id])).preload(:user, :category).first
    puts(@recipe.inspect)
  end
end
