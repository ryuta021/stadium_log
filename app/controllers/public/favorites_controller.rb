class Public::FavoritesController < ApplicationController
 def create

    @favorite = Favorite.create(user_id: current_user.id, post_id: params[:post_id])
    @favorite = Favorite.where(post_id: params[:post_id])
    @tweets = Post.all

 end
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
    @favorite = Favorite.where(post_id: params[:post_id])
    @post = Post.all


  end
end

