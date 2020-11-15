class AddGameToGuessesAndSecretCode < ActiveRecord::Migration[6.0]
  def change
    add_reference :secret_codes, :game, null: false, index: true
    add_reference :guesses, :game, null: false, index: true

    add_foreign_key :secret_codes, :games
    add_foreign_key :guesses, :games
  end
end
