class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string     :name, :null => false
      t.datetime   :birthday, :null => false
      t.integer    :status_group_id, :null => false
      t.integer    :status_id, :null => false
      t.timestamps
    end

    execute("INSERT INTO PEOPLE (
            NAME, BIRTHDAY, STATUS_GROUP_ID, STATUS_ID, CREATED_AT, UPDATED_AT
            ) VALUES (
            'Mister X', '08.06.1967 08:10:00', 1, 3, '08.06.1967 08:10:00', '08.06.1967 08:10:00'
    )")
  end

  def self.down
    drop_table :people
  end
end
