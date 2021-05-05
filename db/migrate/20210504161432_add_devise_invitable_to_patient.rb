class AddDeviseInvitableToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :invitation_token, :string
    add_column :patients, :invitation_created_at, :datetime
    add_column :patients, :invitation_sent_at, :datetime
    add_column :patients, :invitation_accepted_at, :datetime
    add_column :patients, :invitation_limit, :integer
    add_column :patients, :invited_by_id, :integer
    add_column :patients, :invited_by_type, :string
    add_index :patients, :invitation_token, unique: true
  end
end
