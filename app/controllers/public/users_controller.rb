class Public::UsersController < ApplicationController


PER = 6
 def show
 	#binding.pry
   @user = User.find(params[:id])
   #@user = User.find_by(id: params[:id])
   @posts = current_user.post.page(params[:page]).per(PER)
   @posteds = current_user.post.all.to_json
   @posted = Post.find_by(user_id: params[:id])

 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	   @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to  public_user_path(@user.id)
    else
      render 'edit'
    end
 end


  private
 def user_params
   params.require(:user).permit(:name, :image_id, :introduction, :team_id)
 end
end
