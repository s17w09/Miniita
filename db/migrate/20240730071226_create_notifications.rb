# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :article_id
      t.integer :comment_id
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :article_id
    add_index :notifications, :comment_id
  end
end
