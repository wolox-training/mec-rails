class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def change
    table = :users
    change_table(table) do |t|
      ## Required
      t.string :provider, null: false, default: "email" unless column_exists?(table, :provider)
      t.string :uid, null: false, default: "" unless column_exists?(table, :uid)

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: "" unless column_exists?(table, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(table, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(table, :reset_password_sent_at)
      t.boolean  :allow_password_change, default: false unless column_exists?(table, :allow_password_change)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(table, :created_at)

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name unless column_exists?(table, :name)
      t.string :nickname unless column_exists?(table, :nickname)
      t.string :image unless column_exists?(table, :image)
      t.string :email unless column_exists?(table, :email)

      ## Tokens
      t.json :tokens unless column_exists?(table, :tokens)

      #t.timestamps
    end

    add_index :users, :email,                unique: true unless index_exists?(:users, :email)
    add_index :users, [:uid, :provider],     unique: true unless index_exists?(:users, [:uid, :provider])
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # add_index :users, :unlock_token,       unique: true
  end
end
