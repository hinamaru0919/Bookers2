class AddUserIdToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :name, :user_id, :string
  end
end
