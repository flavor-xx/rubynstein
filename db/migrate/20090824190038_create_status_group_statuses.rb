class CreateStatusGroupStatuses < ActiveRecord::Migration

  def self.up

    create_table :status_group_statuses do |t|
      t.integer    :status_group_id, :null => false
      t.integer    :status_id, :null => false
      t.timestamps
    end

    add_index :status_group_statuses, [:status_group_id, :status_id], :unique => true

    execute("INSERT INTO STATUS_GROUP_STATUSES (
            STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
            ) VALUES (
            1, 1, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUS_GROUP_STATUSES (
            STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
            ) VALUES (
            1, 2, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUS_GROUP_STATUSES (
            STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
            ) VALUES (
            1, 3, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
    execute("INSERT INTO STATUS_GROUP_STATUSES (
            STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
            ) VALUES (
            1, 4, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")

  end

  def self.down
    drop_table :status_group_statuses
  end
end
