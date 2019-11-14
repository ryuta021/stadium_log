class Admin::PostsController < ApplicationController

  def index
  	@post = Post.page(params[:page]).per(10)
  end

 def show
     @post =Post.find(params[:id])
 end

  def edit
     @post =Post.find(params[:id])
  end

 def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to admin_posts_path(@post.id)
    else
      render 'edit'
    end
 end

  def destroy
     post = Post.find(params[:id])
      post.destroy
    redirect_to admin_posts_path, danger: "投稿情報を削除しました。"
  end

   private
   def post_params
      params.require(:post).permit(:user_id, :stadium_id, :watching_date, :posted_image, :post_content, :access_rate, :gouremet_rate, :sightseeing_rate, :mood_rate, :capacity_rate )
   end
end
