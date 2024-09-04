class AddAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    # we set default to false , because we don't want new users to be flagged as admins
    add_column :users, :admin, :boolean, default: false
  end
end
