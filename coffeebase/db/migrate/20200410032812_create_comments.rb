class CreateComments < ActiveRecord::Migration
  def change
    create_table :Comments do |t|
      t.string :content
      t.integer :status_id
    end
  end
end
