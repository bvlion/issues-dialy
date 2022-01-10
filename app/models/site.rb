# frozen_string_literal: true

class Site < ApplicationRecord
  belongs_to :user
  has_many :article, dependent: :destroy

  validates :url, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'URL は英数字のみ使用できます。' }
  validates :pass, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'パスは英数字のみ使用できます。' }
  validates :top_image_url, format: {
    with: %r{\Ahttp(s)?://[a-zA-Z0-9]+/[a-zA-Z0-9]+\.(gif|jpg|png|jpeg)\z},
    message: '正しい画像の URL を入力してください。'
  }
end
