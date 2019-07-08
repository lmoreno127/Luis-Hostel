class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string  :description
      t.date    :review_date
      t.integer :booking_id
    end
  end
end
