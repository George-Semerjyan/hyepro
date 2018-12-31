class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :strain_name
      t.text :description
      t.string :category
      t.string :city
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
