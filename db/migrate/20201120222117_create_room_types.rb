class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.boolean :available, default: false
      t.references :hotel, null: false, foreign_key: true
    end
  end
end
