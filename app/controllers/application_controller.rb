# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorRenderable

  def admin_user
    token, = ActionController::HttpAuthentication::Token.token_and_options(request)
    @admin_user ||= User.find_by(token: token) if token
    raise ErrorRenderable::ApiError.new('認証されていません。', :unauthorized) if @admin_user.nil?
  end

  def authenticate_user
    raise ErrorRenderable::ApiError.new('認証されていません。', :unauthorized) if @user.nil?
  end
end
