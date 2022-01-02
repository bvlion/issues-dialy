# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :string do |t|
      t.string :github_id, null: false
      t.string :url, null: false
      t.string :pass, null: false
      t.string :top_image_url, null: false
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :users, :github_id, unique: true
  end
end
