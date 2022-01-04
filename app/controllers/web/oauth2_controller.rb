# frozen_string_literal: true

module Web
  class Oauth2Controller < ApplicationController
    def create
      auth_data = request.env['omniauth.auth']
      raise ErrorRenderable::ApiError.new('パラメータがありません。', :bad_request) if auth_data.nil?

      uuid = SecureRandom.uuid
      User.upsert_all(
        [
          {
            id: auth_data.uid,
            email: auth_data.info.email,
            token: uuid
          }
        ]
      )
      render json: { token: uuid }, status: :ok
    end
  end
end
