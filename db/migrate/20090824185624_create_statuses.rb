class CreateStatuses < ActiveRecord::Migration

  def self.up

    create_table :statuses do |t|
      t.string     :name, :null => false
      t.timestamps
    end

    add_index :statuses, [:name], :unique => true, :case_sensitive => false

    execute("INSERT INTO STATUSES (
            NAME, CREATED_AT, UPDATED_AT
            ) VALUES (
            'Clean', '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUSES (
            NAME, CREATED_AT, UPDATED_AT
            ) VALUES (
            'Inserted', '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUSES (
            NAME, CREATED_AT, UPDATED_AT
            ) VALUES (
            'Updated', '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUSES (
            NAME, CREATED_AT, UPDATED_AT
            ) VALUES (
            'Deleted', '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")

  end

  def self.down
    drop_table :statuses
  end
end
