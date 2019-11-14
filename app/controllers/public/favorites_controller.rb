class Public::FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
		@favorites = Favorite.where(post_id: params[:post_id])
		@posts = Post.all


	end

	def destroy
	 @post = Post.find(params[:post_id])
	@favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	@favorite.destroy
	@favorites = Favorite.where(post_id: params[:post_id])
	@posts = Post.all


	end
end

