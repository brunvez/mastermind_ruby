class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.string :colors, array: true, default: [], null: false

      t.timestamps
    end
  end
end
