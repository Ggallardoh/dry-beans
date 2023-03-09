class CreatePickups < ActiveRecord::Migration[7.0]
  def change
    create_table :pickups do |t|
      t.string :sender
      t.string :address
      t.datetime :picked_up_at
      t.string :aasm_state
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
