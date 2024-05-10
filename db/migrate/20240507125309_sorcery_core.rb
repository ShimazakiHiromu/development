class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :email, :string, null: false
    add_index :users, :email, unique: true
  end
end
