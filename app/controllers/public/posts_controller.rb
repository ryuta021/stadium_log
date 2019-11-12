class Public::PostsController < ApplicationController

  def index
     #binding.pry
     @posted =Post.find_by ("stadium_id = 2 ")
     @posts = Post.where("stadium_id = 2 ")

     @access = Post.where(stadium_id: 2).average(:access_rate)
     @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     @mood = Post.where(stadium_id: 2).average(:mood_rate)
     @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     #@post =Post.find(params[:id])
  end

  def index_top
     #binding.pry
     #@posts =Post.group(:stadium_id).order(:gouremet_rate).pluck(:stadium_id)
     @posts = Post.find(Post.group(:stadium_id).order(:gouremet_rate).pluck(:stadium_id))
     @post =Post.all
    
  end

  def new
      @post =Post.new
  end

   def show
      @post =Post.find(params[:id])
     #@posts = @user.post
     #@favorite_post = @user.favorite_post
   end




  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to  posts_path
  end



  def destroy
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate )
   end
end
