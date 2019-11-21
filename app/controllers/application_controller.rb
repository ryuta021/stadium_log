class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_stadiums
  before_action :get_ransack

  def get_stadiums
    @stadiums = Stadium.all
  end

  def get_ransack
      @q = Post.ransack(params[:q])
      @p = Plan.ransack(params[:p])
  end


  protected
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:team_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
