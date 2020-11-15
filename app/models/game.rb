class Game < ApplicationRecord
  VALID_COLORS = %w[red blue green yellow violet cyan].freeze
  VALID_COLOR_COMBINATIONS = VALID_COLORS.permutation(4).to_a.freeze

  has_one :secret_code
  has_many :guesses
end
