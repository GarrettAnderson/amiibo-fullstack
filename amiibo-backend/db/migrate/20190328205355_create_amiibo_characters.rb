class CreateAmiiboCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :amiibo_characters do |t|
      t.string :name
      t.string :image_URL

      t.timestamps
    end
  end
end
