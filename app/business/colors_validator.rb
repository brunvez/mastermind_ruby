class ColorsValidator < ActiveModel::Validator
  def validate(record)
    unless Game::VALID_COLOR_COMBINATIONS.include?(record.colors)
      record.errors[:colors] << 'must all be present, be valid and not be repeated'
    end
  end
end
