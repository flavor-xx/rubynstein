class CreateStatusGroups < ActiveRecord::Migration

  def self.up

    create_table :status_groups do |t|
      t.string     :name, :null => false
      t.integer    :parent_id
      t.timestamps
    end

    add_index :status_groups, [:name], :unique => true, :case_sensitive => false

    execute("INSERT INTO STATUS_GROUPS (
            NAME, CREATED_AT, UPDATED_AT
            ) VALUES (
            'DB-Row Status', '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")

  end

  def self.down
    drop_table :status_groups
  end
end
