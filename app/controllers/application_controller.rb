class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def is_admin?(email)
    if email == "jonsnow@example.com"
      return true
    else
      return false
    end
  end

  def find_power_of_two(num, count)
    if num == 1
      return count
    else
      return find_power_of_two(num / 2, count + 1)
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username,
        :email, :password, :time_zone) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username,
        :email, :password, :current_password, :user_icon, :time_zone, :xbox_gt,
        :ps4_gt, :lol_summoner_name) }
    end
end
