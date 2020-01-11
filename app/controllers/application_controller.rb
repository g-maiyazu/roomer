class ApplicationController < ActionController::Base
  before_action :set_post_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_post_search
    @search_post = Post.ransack(params[:q])
    @search_posts = @search_post.result.page(params[:page]).per(Constants::Page::Count)
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[user_name email password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
