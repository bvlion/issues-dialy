# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :string do |t|
      t.string :email, null: false
      t.string :token, null: false
      t.string :url, null: false
      t.string :pass, null: false
      t.string :top_image_url, null: false
      t.boolean :ban, null: false, default: false
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :users, :token, unique: true
  end
end
