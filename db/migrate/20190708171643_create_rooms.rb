class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      #t.string :image
      t.string :title
      t.string :description
      t.float  :price
      t.boolean :is_booked
    end
  end
end
