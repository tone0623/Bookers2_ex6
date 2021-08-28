class SearchesController < ApplicationController
    
    def search
        @search_name = params[:search]
        @search_model = params[:search_model]
        method = params[:search_method]
        
        
        if @search_model == "User"
        
            if method == "forward_match"
                    @results = User.where("name LIKE?","#{@search_name}%")
            elsif method == "backward_match"
                    @results = User.where("name LIKE?","%#{@search_name}")
            elsif method == "perfect_match"
                    @results = User.where("name LIKE?","#{@search_name}")
            else
                    @results = User.where("name LIKE?","%#{@search_name}%")
            end
        
        
        else
            if method == "forward_match"
                    @results = Book.where("title LIKE?","#{@search_name}%")
            elsif method == "backward_match"
                    @results = Book.where("title LIKE?","%#{@search_name}")
            elsif method == "perfect_match"
                    @results = Book.where("title LIKE?","#{@search_name}")
            else
                    @results = Book.where("title LIKE?","%#{@search_name}%")
            end
            
        end
        
    end
end
