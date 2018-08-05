class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :district
      t.string :zipcode
      t.text :complement
      t.string :city
      t.string :state
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
