class Admin::TeamController < ApplicationController
  def index
     @team = Team.new
     @teams = Team.all
  end

  def create
       @team = Team.new(team_params)
    if @team.save
       redirect_to  admin_team_index_path
    else
      @teams = Team.all
      render :index
    end
  end


  def edit
     @team = Team.find(params[:id])
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to admin_team_index_path, danger: "チーム情報を削除しました。"
  end

  def update
     @team = Team.find(params[:id])
    if @team.update(team_params)
       redirect_to admin_team_index_path(@team.id), success: "#{@team.team}の情報を変更しました。"
    else
      render 'edit'
    end
  end
 private
    def team_params
      params.require(:team).permit(:team)
    end





end
