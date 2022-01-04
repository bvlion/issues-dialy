# frozen_string_literal: true

class Site < ApplicationRecord
  belongs_to :user
  has_many :article, dependent: :destroy
end
