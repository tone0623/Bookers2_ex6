class SearchesController < ApplicationController
    
    def search
        #検索テキストと検索モデルはViewで表示
        @search_name = params[:search]
        @search_model = params[:search_model]
        method = params[:search_method]
        
        # 検索モデルがUserの場合
        if @search_model == "User"
            # 検索方法で場合分け
            if method == "forward_match"
                    @results = User.where("name LIKE?","#{@search_name}%")
            elsif method == "backward_match"
                    @results = User.where("name LIKE?","%#{@search_name}")
            elsif method == "perfect_match"
                    @results = User.where("name LIKE?","#{@search_name}")
            else
                    @results = User.where("name LIKE?","%#{@search_name}%")
            end
        
        # 検索モデルがBookの場合
        else
            # 検索方法で場合分け
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
