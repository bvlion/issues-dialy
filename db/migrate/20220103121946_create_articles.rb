# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :string do |t|
      t.references :site, null: false, foreign_key: true, type: :string
      t.string :title, null: false
      t.text :description, null: false
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :articles, :title
  end
end
