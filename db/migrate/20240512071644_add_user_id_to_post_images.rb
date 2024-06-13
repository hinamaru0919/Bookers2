class AddUserIdToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_images, :user, null: false, foreign_key: true
  end
end
