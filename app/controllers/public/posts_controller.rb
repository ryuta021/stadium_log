class Public::PostsController < ApplicationController
  PER = 8
  def index
     #binding.pry
      @posts = Post.page(params[:page]).per(PER)
      #@posteds = Post.where(stadium_id: params[:id]).to_json
      @posteds =Post.all.to_json

  end


  def new
      @post =Post.new
  end


  def edit
      @post = Post.find(params[:id])
  end


   def show
    @access = Post.where(stadium_id: params[:id]).average(:access_rate)
    @gouremet = Post.where(stadium_id: params[:id]).average(:gouremet_rate)
    @mood = Post.where(stadium_id: params[:id]).average(:mood_rate)
    @sightseeing = Post.where(stadium_id: params[:id]).average(:sightseeing_rate)
    @capacity = Post.where(stadium_id: params[:id]).average(:capacity_rate)
     @post =Post.find(params[:id])

     # @access = Post.where(stadium_id: 2).average(:access_rate)
     # @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     # @mood = Post.where(stadium_id: 2).average(:mood_rate)
     # @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     # @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     #@posts = @user.posts
     #@favorite_post = @user.favorite_post
   end


  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
   if @post.save
      redirect_to  posts_path
       else
      @posts = Post.all
      render :new
    end
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
