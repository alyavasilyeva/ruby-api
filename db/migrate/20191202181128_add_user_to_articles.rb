class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user, :reference
  end
end
