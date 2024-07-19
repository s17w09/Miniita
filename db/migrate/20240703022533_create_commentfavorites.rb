# frozen_string_literal: true

class CreateCommentfavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :commentfavorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
