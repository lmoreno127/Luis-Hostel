class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :last_name
      t.integer :cardnumber
      t.string  :namecard
      t.date    :expirationdate
      t.integer :cvv
      t.string  :profile_photo
      t.boolean :is_admin
    end
  end
end
