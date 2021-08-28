class SearchesController < ApplicationController
    
    def search
        @search_name = params[:search]
        @results = User.where(name: @search_name)
    end
end
