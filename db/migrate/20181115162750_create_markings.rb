class CreateMarkings < ActiveRecord::Migration[5.2]
  def change
    create_table :markings do |t|
      t.string :name

      t.timestamps
    end
  end
end
