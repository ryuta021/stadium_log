class Public::StadiumController < ApplicationController


  def show
    #@stadium = Stadium.find(params[:id])
    @post =Post.find(params[:id])
    @posted =Post.find_by ("stadium_id = 2 ")
     @posts = Post.where("stadium_id = 2 ")

     @access = Post.where(stadium_id: 2).average(:access_rate)
     @gouremet = Post.where(stadium_id: 2).average(:gouremet_rate)
     @mood = Post.where(stadium_id: 2).average(:mood_rate)
     @sightseeing = Post.where(stadium_id: 2).average(:sightseeing_rate)
     @capacity = Post.where(stadium_id: 2).average(:capacity_rate)
     #@post =Post.find(params[:id])
  end

  def index
  	 #binding.pry
  	 @sort_post = Hash[ Post.group(:stadium_id).average(:gouremet_rate).sort_by{ |_, v| -v } ]
    @posts = Post.find(Post.group(:stadium_id).order(:gouremet_rate).pluck(:stadium_id))

  end

  def create
  end

  def destroy
  end


   private
    def stadium_params
      params.require(:stadium).permit(:name, :image, :information, :position, :address, :latitube, :longitude)
    end


end
