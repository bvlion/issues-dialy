# frozen_string_literal: true

module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :override_exception
    rescue_from ActionController::ParameterMissing, with: :override_exception
    rescue_from ApiError do |e|
      render json: { message: e.message }, status: e.status
    end
  end

  def override_exception(error)
    render json: { message: error.message }, status: :bad_request
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
