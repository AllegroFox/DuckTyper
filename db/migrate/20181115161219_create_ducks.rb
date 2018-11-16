class CreateDucks < ActiveRecord::Migration[5.2]
  def change
    create_table :ducks do |t|
      t.string :name
      t.references :owner, foreign_key: true #owner_id foreign key
      t.references :colour, foreign_key: true #colour_id foreign key
      t.references :marking, foreign_key: true #marking_id foreign key

      t.timestamps
    end
  end
end
