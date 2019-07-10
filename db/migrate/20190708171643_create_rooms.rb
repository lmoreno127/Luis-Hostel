class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.float  :price
      t.boolean :is_booked
      t.string :image
    end
  end
end
