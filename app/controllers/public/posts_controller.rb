class Public::PostsController < ApplicationController

  def index
     #binding.pry
     #@post =Post.all
     @posts = Post.where("stadium_id = 2 ")
     @post_gouremet = Post.group("stadium_id = 2 ")
     #@post =Post.find(params[:id])
  end

  def index_top
     #binding.pry
     @post =Post.all
     #@post_ranking = Post.group("stadium_id = 2 ").average(:gouremet_rate).order('count_stadium_id DESC').limit(5).count(:stadium_id).keys
    #@access = Post.where("stadium_id = 2 ").sum(:access_rate)
    #@capacity = Post.where("stadium_id = 2 ").sum(:capacity_rate)
    #@gouremet = Post.where("stadium_id = 2 ").sum(:gouremet_rat)
    #@sightseeing = Post.where("stadium_id = 2 ").sum(:sightseeing_rate)
    #@mood = Post.where("stadium_id = 2 ").sum(:mood_rate)
    #Post.group("stadium_id = 2 ").average(:gouremet_rate)



    #@access = Post.find(Post.group(:access_rate).order('count(access_rate) desc').limit(10).pluck(:access_rate))
    #@access = Post.find(Post.group(:stadiam_id).order('count(access_rate) desc').limit(10).pluck(:access_rate))

   #@access = Post.group(:access_rate) .order('count_access_rate DESC').limit(5).count(:access_rate).keys
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
