class ChangeStatusToEnumInReports < ActiveRecord::Migration[7.2]
  def up
    change_column :reports, :status, :integer, default: 0, null: true, using: "status::integer"
  end
  def down
    change_column :reports, :status, :string
  end
end
