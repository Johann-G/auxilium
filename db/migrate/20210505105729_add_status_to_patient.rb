class AddStatusToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :status, :string, default: "draft"
  end
end
