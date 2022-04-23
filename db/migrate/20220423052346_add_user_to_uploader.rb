class AddUserToUploader < ActiveRecord::Migration[7.0]

  def change
    add_reference :uploaders, :user, null: false, foreign_key: true
  end
end
