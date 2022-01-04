# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites, id: :string do |t|
      t.references :user, null: false, foreign_key: true, type: :string
      t.string :url, null: false
      t.string :pass, null: false
      t.string :top_image_url, null: false
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
