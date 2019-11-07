class Public::UsersController < ApplicationController

 def show
 	@user = User.find(params[:id])
 end


 def edit
 end

 def update
 end
  private

 def user_params
   params.require(:user).permit(:name, :image_id, :introduction, :team_id)
 end
end
