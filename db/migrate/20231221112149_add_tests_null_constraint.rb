class AddTestsNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end
end
