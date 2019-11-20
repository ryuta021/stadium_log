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
       @plan = @post.plans.build
       @spot = @plan.spots.build
  end


  def edit
      @post = Post.find(params[:id])
  end

  def detail_search
     @search_product = Post.ransack(params[:q])
     @posts = @search_product.result.page(params[:page])
  end


   def search_location
        latitude = params[:latitude].to_f
        longitude = params[:longitude].to_f
        @locations = Post.within_box(0.310686, latitude, longitude)
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
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate, :latitude, :longitude, :address ,plan_attributes: [:id, :title, :_destroy,
                                   spot_attributes: [:id, :spot_number, :spot_content, :spot_place, :spot_time, :plan_id, :_destroy]])
   end
end
