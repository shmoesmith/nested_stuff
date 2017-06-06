class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreign_key: true
      t.string :city
      t.string :state
      t.string :street
      t.string :zip

      t.timestamps
    end
  end
end
