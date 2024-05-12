class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.references :diary, null: false, foreign_key: true
      t.string :file_path
      t.datetime :uploaded_at
      t.string :title
      t.string :artist
      t.integer :status

      t.timestamps
    end
  end
end
