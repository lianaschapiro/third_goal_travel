class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :link
      t.text :description
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
