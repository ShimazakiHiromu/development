class CreateDiaries < ActiveRecord::Migration[7.1]
  def change
    create_table :diaries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.integer :status
      t.date :date

      t.timestamps
    end
  end
end
