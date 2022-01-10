# frozen_string_literal: true

module Api
  class Oauth2Controller < ApplicationController
    def create
      auth_data = request.env['omniauth.auth']
      raise ErrorRenderable::ApiError.new('パラメータがありません。', :bad_request) if auth_data.nil?

      uuid = SecureRandom.uuid
      user_id = User.upsert(
        {
          id: auth_data.uid,
          email: auth_data.info.email,
          token: uuid
        }
      )

      raise ErrorRenderable::ApiError.new('ユーザーの登録・更新に失敗しました。', :internal_server_error) if user_id.nil?

      render json: { token: uuid }, status: :ok
    end
  end
end
