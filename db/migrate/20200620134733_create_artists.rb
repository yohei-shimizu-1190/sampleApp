class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :group, null: false
      t.timestamps
    end
  end
end
