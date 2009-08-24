class CreateUsers < ActiveRecord::Migration

  def self.up

    create_table :users do |t|
      t.string     :login, :null => false
      t.string     :pwd, :null => false
      t.string     :salt, :null => false
      t.timestamp  :last_login_at
      t.timestamp  :last_logout_at
      t.integer    :status_group_id, :null => false
      t.integer    :status_id, :null => false
      t.timestamps
    end

    add_index :users, [:login], :unique => true, :case_sensitive => false

    execute("INSERT INTO USERS (
             LOGIN, PWD, SALT, LAST_LOGIN_AT, LAST_LOGOUT_AT, STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
             ) VALUES (
             'flavor', '3333', '3333', '08.06.1967 08:10:00', '08.06.1967 08:10:00', 1, 1, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")

  end

  def self.down
    drop_table :users
  end
end
