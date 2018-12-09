# frozen_string_literal: true

class AddCommentableTypeToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_type, :string
  end
end
