class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.decimal :point, precision: 3, scale: 2, null: false
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
