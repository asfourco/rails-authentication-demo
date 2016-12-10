class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # Basic attributes
      t.string :name
      t.string :email
      t.string :password_digest

      # timed attributes
      t.datetime :last_updated
      t.datetime :account_closed
      t.datetime :last_login
      t.datetime :last_failed_login
      t.datetime :password_changed
      t.datetime :last_failed_password_reset
      t.datetime :verification_key_sent

      # status attributes
      t.boolean :is_login_allowed
      t.boolean :requires_password_reset
      t.boolean :is_account_verified
      t.integer :failed_login_count
      t.integer :failed_password_reset_count
      t.integer :verification_purpose
        
      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :updated_at
  end
end
