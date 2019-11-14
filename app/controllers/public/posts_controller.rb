class Public::PostsController < ApplicationController
  PER = 8
  def index
     #binding.pry
     # @posted =Post.find_by ("stadium_id = 2 ")
      @posts = Post.page(params[:page]).per(PER)
     # @access = Post.where(stadium_id: 2).average(:access_rate)
     # @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     # @mood = Post.where(stadium_id: 2).average(:mood_rate)
     # @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     # @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     # @post = Post.all
     #@post =Post.find(params[:id])
  end


  def new
      @post =Post.new
  end


  def edit

  end


   def show
     @post =Post.find(params[:id])
     @access = Post.where(stadium_id: 2).average(:access_rate)
     @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     @mood = Post.where(stadium_id: 2).average(:mood_rate)
     @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     #@posts = @user.posts
     #@favorite_post = @user.favorite_post
   end


  def create
    p "---------------------------------------"
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save!
      redirect_to  posts_path
  end



  def destroy
     post = Post.find(params[:id])
      post.destroy
      redirect_to user_path(@post.id), danger: "投稿情報を削除しました。"
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate, :latitude, :longitude, :address )
   end
end
