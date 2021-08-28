class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
  
    if !Favorite.exists?(book_id: params[:book_id], user_id: current_user.id)
      @favorite = current_user.favorites.new(:book_id => params[:book_id])
      @favorite.save
      # 非同期通信
      render :create
    end
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    if Favorite.exists?(book_id: params[:book_id], user_id: current_user.id)
      @favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
      @favorite.destroy
      # 非同期通信
      render :destroy
    end
  end
end
