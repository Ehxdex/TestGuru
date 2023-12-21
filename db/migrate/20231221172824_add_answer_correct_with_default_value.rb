class AddAnswerCorrectWithDefaultValue < ActiveRecord::Migration[7.0]
  def change
    add_column(:answers, :column, :boolean)
    change_column_default(:answers, :column, from: nil, to: false)
  end
end
