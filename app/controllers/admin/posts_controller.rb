class Admin::PostsController < ApplicationController

  def index
  	@post = Post.all
  end

 def show

 end

  def edit
  end

  def destroy
  end

  def update
  end

   private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate )
   end
end
