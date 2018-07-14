class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :gif_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
