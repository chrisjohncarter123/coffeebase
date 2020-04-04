class CreatePosts < ActiveRecord::Migration
  def change
    create_table :Posts do |t|
      t.integer :user_id
      t.string :content
    end
  end
end
