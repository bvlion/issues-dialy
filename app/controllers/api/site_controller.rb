# frozen_string_literal: true

module Api
  class SiteController < ApplicationController
    before_action :admin_user

    def site
      exists_site

      pre_site = @admin_user.site&.filter { |s| s.url == site_data[:url] }&.first
      if pre_site
        pre_site.url = site_data[:url]
        pre_site.pass = site_data[:pass]
        pre_site.top_image_url = site_data[:top_image_url]
        pre_site.save!
        render json: pre_site.to_json, status: :ok
      else
        data = site_data
        data[:user_id] = @admin_user.id
        data[:id] = SecureRandom.uuid
        render json: Site.create!(data).to_json, status: :ok
      end
    end

    def exists_site
      exists_site = Site.where(url: site_data[:url])&.first
      raise ErrorRenderable::ApiError.new('既にサイトの URL は使用されています。', :forbidden)\
        if !exists_site.nil? && exists_site[:user_id] != @admin_user.id
    end

    def site_data
      params.require(:url)
      params.require(:pass)
      params.require(:top_image_url)

      params.permit(
        :url,
        :pass,
        :top_image_url
      )
    end

    def article
      # TODO
    end
  end
end
