class Public::PostsController < ApplicationController
  PER = 4
  def index
      @q = Post.ransack(params[:q])
      @posts = Post.page(params[:page]).per(PER).order("created_at DESC")
      @posteds =Post.all.to_json
      #@posteds = Post.where(stadium_id: params[:id]).to_json
  end

  def new
       @post =Post.new
  end

  def edit
      @post = Post.find(params[:id])
  end

  def detail_search
     @posts = @search_product.result.page(params[:page])
  end


   def favorite_post
      @favorite = current_user.favorites
   end



   def show
    # @rate = Post.where(stadium_id: params[:id])
    @rate = Post.where(stadium_id: params[:id])
    @access = @rate.average(:access_rate)
    #@access = Post.where(stadium_id: params[:id]).average(:access_rate)
    @gouremet = Post.where(stadium_id: params[:id]).average(:gouremet_rate)
    @mood = Post.where(stadium_id: params[:id]).average(:mood_rate)
    @sightseeing = Post.where(stadium_id: params[:id]).average(:sightseeing_rate)
    @capacity = Post.where(stadium_id: params[:id]).average(:capacity_rate)
    @post =Post.find(params[:id])
    @plan = Post.joins(:plans => :spots).select("posts.*,plans.*,spots.*").where(user_id: @post.user.id).where(stadium_id: @post.stadium_id)
    #binding.pry
    #@posteds =Post.all.to_json
    @posteds =Post.find(params[:id]).to_json
   end



  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id

      access_rate = @post[:access_rate].present? ?  @post[:access_rate] : 0
      gouremet_rate = @post[:gouremet_rate].present? ?  @post[:gouremet_rate] : 0
      mood_rate = @post[:mood_rate].present? ?  @post[:mood_rate] : 0
      sightseeing_rate = @post[:sightseeing_rate].present? ?  @post[:sightseeing_rate] : 0
      capacity_rate = @post[:capacity_rate].present? ?  @post[:capacity_rate] : 0

      @post.total_rate =  access_rate + gouremet_rate + mood_rate + sightseeing_rate + capacity_rate

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
      redirect_to public_posts_path  danger: "投稿情報を削除しました。"
  end


  private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :total_rate, :sightseeing_rate, :mood_rate, :capacity_rate, :latitude, :longitude, :address,
                                   plans_attributes: [:id, :title, :_destroy,
                                   spots_attributes: [:id, :spot_title, :spot_number, :spot_content, :spot_place, :spot_time, :address, :latitude, :longitude, :spots_image_id, :_destroy]])
   end
end
