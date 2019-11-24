class Public::StadiumController < ApplicationController


  def show
     #binding.pry
    @posted =Stadium.find(params[:id])
    @posts = Post.where(stadium_id: params[:id])
    @posteds = Post.where(stadium_id: params[:id]).to_json

    @access = Post.where(stadium_id: params[:id]).average(:access_rate)
    @gouremet = Post.where(stadium_id: params[:id]).average(:gouremet_rate)
    @mood = Post.where(stadium_id: params[:id]).average(:mood_rate)
    @sightseeing = Post.where(stadium_id: params[:id]).average(:sightseeing_rate)
    @capacity = Post.where(stadium_id: params[:id]).average(:capacity_rate)
    #@all = Post.where(stadium_id: params[:id]).average(:total_rate)
  end

  def index
     @q = Post.ransack(params[:q])
  	 #binding.pry
    @post = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @posted =Stadium.find_by(params[:id])
    @posteds = Stadium.all.to_json
  	@stadiums = Stadium.all

  	@sort_posts = Hash[ Post.group(:stadium_id).average(:gouremet_rate).sort_by{ |_, v| -v } ]
  	@sort_accesses = Hash[ Post.group(:stadium_id).average(:access_rate).sort_by{ |_, v| -v } ]
  	@sort_moods = Hash[ Post.group(:stadium_id).average(:mood_rate).sort_by{ |_, v| -v } ]
  	@sort_sightseeings = Hash[ Post.group(:stadium_id).average(:sightseeing_rate).sort_by{ |_, v| -v } ]
  	@sort_capacities = Hash[ Post.group(:stadium_id).average(:capacity_rate).sort_by{ |_, v| -v } ]

  end


  def create
  end

  def destroy
  end


   private
    def stadium_params
      params.require(:stadium).permit(:name, :image, :information, :position, :address, :latitude, :longitude)
    end


end
