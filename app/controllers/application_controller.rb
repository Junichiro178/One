class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :sex, :img_name])

    devise_parameter_sanitizer.permit(:account_update, keys: %i(name self_introduction sex img_name))
    # →ストロングパラメータを記述することで、デフォルトでは保存ができない、name/self_introductionなどのカラムの値も更新保存できるようにする
  end

  def after_sign_in_path_for(resource)
    users_path
  end
end