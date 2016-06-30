class RecipieController < ApplicationController
	before_action :authenticate_user!

	def new
		@recipe = Recipe.new
		@recipe.ingredients.build
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		if recipe_valid params		
			if @recipe.save
				flash[:notice]= "saved"
			else
				flash[:notice] = "not saved"
			end
		else
			flash[:notice] = "fields missing"
		end
		redirect_to recipie_index_path
	end


	def edit
		puts "++++++++++++++++"
		puts params
		@recipe = Recipe.find(params[:r_id])
		@id = @recipe.id
	end

	def update
		puts "++++++++++===============++++++++"
		puts params
		@recipe = Recipe.find(params[:id])
		if recipe_valid params
			if @recipe.update(recipe_params)
	    		redirect_to recipie_index_path
	    		flash[:notice]= "saved"
	    	else
	    		flash[:notice]= "not saved"
	    	end
  		else
  			flash[:notice] = "fields missing"
    		render 'edit'
  		end
	end

	def destroy
	@recipie = Recipe.find(params[:id])
	if @recipie.destroy
		flash[:notice] = "deleted"
	end
		respond_to do |format|
    		format.html {}
    		format.js {}
    	end
	end

	def index
		@user = current_user
		@recipes = current_user.recipes
	end

private
	def recipe_params
      params.require(:recipe).permit(:title, :description , ingredients_attributes: [:id , :ingredient_name ,:_destroy])
    end
    def recipe_valid params
    	if params[:title].blank? || params[:description].blank?
    		false
    	else
    		true
    	end
    end
end

