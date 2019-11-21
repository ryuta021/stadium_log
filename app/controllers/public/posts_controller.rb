class Public::PostsController < ApplicationController
  PER = 6
  def index
      @q = Post.ransack(params[:q])
      @posts = Post.page(params[:page]).per(PER)
      @posteds =Post.all.to_json
      #@posteds = Post.where(stadium_id: params[:id]).to_json
  end

  def new
       @post =Post.new
       # @plan = @post.plans.build
       # @spot = @plan.spots.build
  end


  def edit
      @post = Post.find(params[:id])
  end

  def detail_search
     @search_product = Post.ransack(params[:q])
     @posts = @search_product.result.page(params[:page])
  end


   def favorite_post
        @favorite = Favorite.all
   end



   def show
    @access = Post.where(stadium_id: params[:id]).average(:access_rate)
    @gouremet = Post.where(stadium_id: params[:id]).average(:gouremet_rate)
    @mood = Post.where(stadium_id: params[:id]).average(:mood_rate)
    @sightseeing = Post.where(stadium_id: params[:id]).average(:sightseeing_rate)
    @capacity = Post.where(stadium_id: params[:id]).average(:capacity_rate)
     @post =Post.find(params[:id])

   end


  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      #binding.pry
   if @post.save
      redirect_to  public_posts_path
       else
      @posts = Post.all
      render :new
    end
  end





  def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to public_user_path(@post.id), danger: "投稿情報を削除しました。"
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate, :latitude, :longitude, :address,
                                   plans_attributes: [:id, :title, :_destroy,
                                   spots_attributes: [:id, :spot_title, :spot_number, :spot_content, :spot_place, :spot_time,  :address, :latitude, :longitude, :spots_image_id, :_destroy]])
   end
end
