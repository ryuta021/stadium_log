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
    @stadium
  end


  def destroy
  end

  def update
  end

    private
    def stadium_params
      params.require(:stadium).permit(:stadium_name, :stadium_image_id, :information, :position)
    end


end
