class Public::StadiumController < ApplicationController


  def show
    # binding.pry
    @posted =Post.find(params[:id])
    @posteds =Post.all.to_json
    @posts = Post.group(params[:id])
     # @access = Post.where(:stadium_id).average(:access_rate)
     # @gouremet = Post.where(:stadium_id).average(:gouremet_rate)
     # @mood = Post.where(:stadium_id).average(:mood_rate)
     # @sightseeing = Post.where(:stadium_id).average(:sightseeing_rate)
     # @capacity = Post.where(:stadium_id).average(:capacity_rate)


    # @posted =Post.find_by ("stadium_id = 2 ")
    # @posts = Post.where("stadium_id = 2 ")
     @access = Post.where(stadium_id: 2).average(:access_rate)
     @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     @mood = Post.where(stadium_id: 2).average(:mood_rate)
     @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     #@post =Post.find(params[:id])
  end

  def index
  	 #binding.pry
  	@stadiums = Stadium.all
    @stadium =Post.find_by ("stadium_id = 2 ")
    #@stadiums =Stadium.find(params[:id])
  	@sort_posts = Hash[ Post.group(:stadium_id).average(:gouremet_rate).sort_by{ |_, v| -v } ]
  	@sort_accesses = Hash[ Post.group(:stadium_id).average(:access_rate).sort_by{ |_, v| -v } ]
  	@sort_moods = Hash[ Post.group(:stadium_id).average(:mood_rate).sort_by{ |_, v| -v } ]
  	@sort_sightseeings = Hash[ Post.group(:stadium_id).average(:sightseeing_rate).sort_by{ |_, v| -v } ]
  	@sort_capacities = Hash[ Post.group(:stadium_id).average(:capacity_rate).sort_by{ |_, v| -v } ]
    #@posts = Post.find(Post.group(:stadium_id).order(:gouremet_rate).pluck(:stadium_id))



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
