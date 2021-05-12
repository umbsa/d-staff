class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name,     null: false
      t.string :history,   null: false
      t.text   :comment,  null: false
      t.text   :hobby,    null: false
      t.integer :price,   null: false
      t.timestamps
    end
  end
end
