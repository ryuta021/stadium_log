class Admin::StadiumController < ApplicationController
  def index
    @stadium = Stadium.new
    @stadiums = Stadium.all
  end

  def create
    @stadium = Stadium.new(stadium_params)
    @stadium.save
    redirect_to admin_stadium_index_path
  end


  def edit
    @stadium = Stadium.find(params[:id])
  end

  def update
       @stadium = Stadium.find(params[:id])
    if @stadium.update(stadium_params)
       redirect_to admin_stadium_index_path(@stadium.id), success: "#{@stadium.stadium_name}の情報を変更しました。"
    else
      render 'edit'
    end
  end

  def destroy
     stadium = Stadium.find(params[:id])
      stadium.destroy
    redirect_to admin_stadium_index_path, danger: "球場情報を削除しました。"
  end


    private
    def stadium_params
      params.require(:stadium).permit(:stadium_name, :stadium_image, :information, :position, :address, :latitube, :longitude)
    end


end
