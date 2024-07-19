# frozen_string_literal: true

class RemoveArticleForeignKeyFromCommentfavorites < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :commentfavorites, :articles
    remove_column :commentfavorites, :article_id
  end
end
