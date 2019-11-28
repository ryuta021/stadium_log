class Public::StadiumController < ApplicationController

PER = 6


  def show
    #binding.pry
    @posted =Stadium.find(params[:id])
    # @posteds = Post.where(stadium_id: params[:id]).to_json
    @posteds = Post.where(stadium_id: params[:id]).page(params[:page]).to_json
    @posts = Post.where(stadium_id: params[:id]).page(params[:page]).per(PER)
    @access = @posts.average(:access_rate).blank? ? 0 : @posts.average(:access_rate).floor(2)
    @gouremet = @posts.average(:gouremet_rate).blank? ? 0 : @posts.average(:gouremet_rate).floor(2)
    @mood = @posts.average(:mood_rate).blank? ? 0 : @posts.average(:mood_rate).floor(2)
    @sightseeing = @posts.average(:sightseeing_rate).blank? ? 0 :  @posts.average(:sightseeing_rate).floor(2)
    @capacity = @posts.average(:capacity_rate).blank? ? 0 : @posts.average(:capacity_rate).floor(2)
    @total_rate = @posts.average(:total_rate).blank? ? 0 : @posts.average(:total_rate).floor(2)
  end

  def index

    @post = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @posted =Stadium.find_by(params[:id])
    @posteds = Stadium.all.to_json
  	@stadiums = Stadium.all
    @sort_total = Post.order("average_total_rate desc").group(:stadium_id).average(:total_rate)
  	@sort_posts = Hash[ Post.group(:stadium_id).average(:gouremet_rate).sort_by{ |_, v| -v } ]
  	@sort_accesses = Hash[ Post.group(:stadium_id).average(:access_rate).sort_by{ |_, v| -v } ]
  	@sort_moods = Hash[ Post.group(:stadium_id).average(:mood_rate).sort_by{ |_, v| -v } ]
  	@sort_sightseeings = Hash[ Post.group(:stadium_id).average(:sightseeing_rate).sort_by{ |_, v| -v } ]
  	@sort_capacities = Hash[ Post.group(:stadium_id).average(:capacity_rate).sort_by{ |_, v| -v } ]

  end


  def about
  end


   private
    def stadium_params
      params.require(:stadium).permit(:name, :image, :information, :position, :address, :latitude, :longitude)
    end


end
