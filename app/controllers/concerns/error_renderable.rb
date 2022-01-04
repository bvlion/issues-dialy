# frozen_string_literal: true

module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    rescue_from ApiError do |e|
      render json: { message: e.message }, status: e.status
    end
  end

  class ApiError < StandardError
    attr_reader :message, :status

    def initialize(message = '不明なエラーです', status = :internal_server_error, error = nil)
      logger.warn(error) unless error.nil?
      @message = message
      @status = status
    end
  end
end
