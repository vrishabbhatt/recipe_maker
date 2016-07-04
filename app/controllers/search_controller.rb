class SearchController < ApplicationController
  def index
  	@query = Query.new
  end
  def search_result
  	puts params
  	
  	respond_to do |format|
  		format.html{
  			if params[:query].blank?
  				@query = params[:querys] 
  			else
  				@query = params[:query][:title]
  			end
  			@page = params[:page] || 1
  			@results = GoogleCustomSearchApi.search(@query , page: @page)
  			puts @results.items.first
  		}
  		format.js{}
  	end
  end
  def searchs
  	if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q],
                                              page: page)
  	end
  end

end
  	# @results = GoogleCustomSearchApi.search("poker")
