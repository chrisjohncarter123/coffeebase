class CreateComments < ActiveRecord::Migration
  def change
    create_table :Comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :content
    end
  end
end
