# frozen_string_literal: true

module Web
  class Oauth2Controller < ApplicationController
    def create
      render json: request.env['omniauth.auth'], status: HttpStatus.OK
    end
  end
end
