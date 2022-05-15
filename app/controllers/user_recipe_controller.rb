require 'aws-sdk-s3'

class UserRecipeController < ApplicationController
  before_action :require_user_logged_in!

  def index
    if session[:user_id]
      @recipes = Recipe.where(user_id: Integer(session[:user_id])).preload(:user, :category)
    end
  end

  def create
    @recipe = Recipe.new
    @categories = Category.all
    @data = RecipeCountry.get_countries
  end

  def store_recipe

    @recipe = Recipe.new(user_recipe_params)
    object_key = params[:photo].original_filename
    file = params[:photo].tempfile
    url = "https://my-cookbook-photos.s3.amazonaws.com/#{object_key}"
    upload_to_s3(file,object_key)
    @recipe.photo = url
    if @recipe.save
      redirect_to users_recipe_create_path, notice: 'Recipe created successfully'
    else
      @categories = Category.all
      @data= RecipeCountry.get_countries
      render :create
    end


  end

  def edit
    @categories = Category.all
    @id = params[:id]
    @recipe = Recipe.find(params[:id])
  end

  def edit_recipe
    recipe = params.permit(:name, :prep, :cook, :direction, :ingredient, :user_id, :category_id)
    @recipe = Recipe.find(params[:id]).update(recipe)
    if @recipe
      redirect_to users_recipes_path, notice: 'Recipe has been updated successfully'
    else
      @id = params[:id]
      @recipe = Recipe.find(params[:id])
      @categories = Category.all
      flash.now[:alert] = 'Something went wrong, please try again'
      render :edit
    end

  end

  def delete
    recipe = Recipe.delete(params[:id])
    if recipe
      redirect_to users_recipes_path, notice: 'Recipe has been deleted successfully'
    else
      redirect_to users_recipes_path, alert: 'Something went wrong'
    end
  end

  def show; end

  private

  def user_recipe_params
    params.permit(:name, :prep, :cook, :direction, :ingredient, :user_id, :category_id,:country)
  end

  def upload_to_s3(file,object_key)
    client = Aws::S3::Client.new(
      region: "us-east-1",
      credentials: Aws::Credentials.new("AKIA37R36ZD5YOP2477C", "EzVmSETmBT8XVRoiL8U0cAfPGtaVODqO2xINy4gw"),

      )
    begin
      return client.put_object(
        bucket: "my-cookbook-photos",
        key: object_key,
        body: file,
        )

    rescue StandardError => e
      puts "Error uploading object: #{e.message}"
    end
  end

end
