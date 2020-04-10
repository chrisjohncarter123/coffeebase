class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :Statuses do |t|
      t.string :name
      t.string :content
      t.integer :user_id
    end
  end
end
