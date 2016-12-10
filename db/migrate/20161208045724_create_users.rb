class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # Basic attributes
      t.string :name
      t.string :email
      t.string :password_digest

      # timed attributes
      t.datetime :last_login
      t.datetime :last_failed_login
      t.datetime :last_failed_password_reset

      # status attributes
      t.boolean :requires_password_reset, default: false
      t.boolean :is_account_verified, default: false
      t.integer :failed_login_count, default: 0
      t.integer :failed_password_reset_count, default: 0

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :updated_at
  end
end
