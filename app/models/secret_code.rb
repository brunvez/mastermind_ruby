class SecretCode < ApplicationRecord
  belongs_to :game, required: true

  validates_with ColorsValidator
end
