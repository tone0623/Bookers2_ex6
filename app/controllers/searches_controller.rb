class SearchesController < ApplicationController
    
    def search
        @search_name = params[:search]
        @search_method = params[:search_method]
        @search_model = params[:search_model]
        @results = User.where(name: @search_name)
    end
end
