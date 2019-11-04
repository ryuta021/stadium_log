class Public::PostsController < ApplicationController
  def index
  end

  def index_top
  end

  def new
      @post =Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.save
      redirect_to  posts_index_path
  end
  def show
  end



  def destroy
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate )
   end
end
