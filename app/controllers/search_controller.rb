class SearchController < ApplicationController
  def index
  	@query = Query.new
  end

  def search_result
  	puts params
  	if params[:query].blank?
  		@query = params[:querys] 
  	else
  		@query = params[:query][:title]
  	end
  	@page = params[:page] || 1
  	@results = GoogleCustomSearchApi.search(@query , page: @page)
  	puts @results.items.first
  	puts '++++++++++++++++++++++++++++++++'
  	puts @results.items.first.pagemap.cse_thumbnail.first.src
  end
  def searchs
  end

end
  	# @results = GoogleCustomSearchApi.search("poker")
