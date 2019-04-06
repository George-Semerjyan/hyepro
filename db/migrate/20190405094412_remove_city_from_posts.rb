class RemoveCityFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :city, :string
    remove_column :posts, :phone, :string
    remove_column :posts, :email, :string
    remove_column :posts, :contact_name, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :contact_name, :string
  end
end
