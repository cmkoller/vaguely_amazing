class AddRoleToUsers < ActiveRecord::Migration
  def up
    add_column :users, :role, :string, null: false, default: "member"

    User.all.each do |user|
      user.role = "member"
      user.save!
    end
  end

  def down
    remove_column :users, :role
  end
end
