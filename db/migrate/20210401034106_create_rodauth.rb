class CreateRodauth < ActiveRecord::Migration[6.0]
  def change
    enable_extension "citext"

    create_table :accounts, id: :uuid do |t|
      t.citext :email, null: false, index: { unique: true, where: "status IN ('unverified', 'verified')" }
      t.string :status, null: false, default: "unverified"
    end

    # Used if storing password hashes in a separate table (default)
    create_table :account_password_hashes, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :password_hash, null: false
    end

    # Used by the password reset feature
    create_table :account_password_reset_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.datetime :email_last_sent, null: false, default: -> { "CURRENT_TIMESTAMP" }
    end

    # Used by the account verification feature
    create_table :account_verification_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :requested_at, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :email_last_sent, null: false, default: -> { "CURRENT_TIMESTAMP" }
    end

    # Used by the verify login change feature
    create_table :account_login_change_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.string :login, null: false
      t.datetime :deadline, null: false
    end

    # Used by the remember me feature
    create_table :account_remember_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
    end
  end
end
