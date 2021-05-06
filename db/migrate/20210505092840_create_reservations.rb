class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|

      t.datetime :start_time
      t.references :staff, foreign_key: true
      t.references :user, foreign_key: true
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :addresses,     null: false
      t.string     :building
      t.string     :phone_number,  null: false
      
      t.timestamps
    end
  end
end
