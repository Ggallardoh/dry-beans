class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :recipient
      t.string :address
      t.datetime :delivered_at
      t.string :aasm_state
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
