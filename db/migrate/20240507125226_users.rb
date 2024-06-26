class Users < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :line_id

      t.timestamps null: false
    end
  end
end
