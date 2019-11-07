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
      @post.user_id = current_user.id
       #@post = params[:post][:access_rate]
       #@post = params[:post][:gouremet_rate]
       #@post = Post.find(params[:post][:mood_rate])
       #@post = Post.find(params[:post][:capacity_rate])
       #@post = Post.find(params[:post][:sightseeing_rate])
      @post.save
      redirect_to  posts_path
  end
  def show
     @post =Post.find(params[:id])
  end



  def destroy
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate )
   end
end
