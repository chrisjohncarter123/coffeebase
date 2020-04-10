class CreateUsers < ActiveRecord::Migration
  def change
    create_table :Users do |t|
      t.string :full_name
      t.string :email
      t.string :username
      t.string :password_digest
    end
  end
end
