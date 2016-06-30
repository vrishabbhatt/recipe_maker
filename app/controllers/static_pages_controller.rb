class StaticPagesController < ApplicationController
	def home
	end
	def index
		respond_to do |format|
			@all = Recipe.all.order(:created_at)
			puts "+++++++++++===========+++++++"
			puts params
    		format.html{}
    		format.js{
    			get_ratings params
    		}
    	end
	end
	def show
		respond_to do |format|
    		format.html {
				@recipe = Recipe.find(params[:id])		
    		}
    		format.js {
    			get_ratings params
    		}
    	end
	end
	def var
		@rating = Rating.new
		puts "+===============+++++++++++++++====+++++==="
		puts params
	end

	private

	def  get_ratings params
		puts "+++++++++++++"
		puts params
		puts "-------------"
		rating = Rating.find_by(recipe_id: params[:r_id], user_id: current_user.id)||Rating.new(recipe_id: params[:r_id], user_id: current_user.id)
    	rating.score = params[:rating][:score]
    	puts rating
    	if rating.save
    		flash[:notice] = "Thank you for rating"
    	else
    		flash[:notice] = "Ooops something went wrong"
    	end
    end

end
