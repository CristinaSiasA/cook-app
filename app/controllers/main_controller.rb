class MainController < ApplicationController
  def index
    @recipes = Recipe.order('created_at').limit(4).preload(:user, :category)
  end

  def about
  end
end
