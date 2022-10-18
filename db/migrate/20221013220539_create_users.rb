class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # adding null: false provides validation so that a user can't be created without an email address
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
