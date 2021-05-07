class CreateVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.references :staff, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
