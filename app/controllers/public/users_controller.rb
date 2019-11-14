class Public::UsersController < ApplicationController

 def show



 	#binding.pry
 	@user = User.find(params[:id])
   @users = Post.find(params[:id])
   @posts = @user.post
   @favorite_post = @user.favorite_post
 end


 def edit
 	@user = User.find(params[:id])
 end

 def update
 	   @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to  user_path(@user.id)
    else
      render 'edit'
    end
 end


  private
 def user_params
   params.require(:user).permit(:name, :image_id, :introduction, :team_id)
 end
end
