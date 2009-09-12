class CreateUsers < ActiveRecord::Migration

  def self.up

    create_table :users do |t|
      t.string     :login, :null => false
      t.string     :crypted_password, :null => false
      t.string     :password_salt, :null => false
      t.string     :persistence_token, :null => false
      t.integer    :login_count, :null => false, :default => 0
      t.integer    :failed_login_count, :null => false, :default => 0
      t.datetime   :last_request_at
      t.datetime   :current_login_at
      t.datetime   :last_login_at
      t.string     :current_login_ip
      t.string     :last_login_ip
      t.boolean    :is_admin, :null => false, :default => false
      t.integer    :person_id, :null => false
      t.integer    :status_group_id, :null => false
      t.integer    :status_id, :null => false
      t.timestamps
    end

    add_index :users, [:login], :unique => true, :case_sensitive => false

    fk :users, :person_id, :people

  end

  def self.down
    drop_fk :users, :person_id
    drop_table :users
  end
end
