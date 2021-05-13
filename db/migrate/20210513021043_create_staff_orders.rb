class CreateStaffOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_orders do |t|
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
